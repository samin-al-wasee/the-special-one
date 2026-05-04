import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';
import 'package:ts1_persistence/src/mappers/player_mapper.dart';
import 'package:ts1_persistence/src/repositories/country_repository.dart';

/// Repository for player data access and transformation.
///
/// Provides a domain-level interface for accessing and manipulating player data.
/// This repository handles the complex mapping between database records and domain models,
/// including automatic country resolution and attribute reconstruction.
///
/// Usage:
/// ```dart
/// final repo = PlayerRepository(playerDao, countryRepository);
/// final players = await repo.getAllPlayers();
/// final player = await repo.getById(123);
/// await repo.save(myPlayer);
/// ```
class PlayerRepository {
  final PlayerDao dao;
  final CountryRepository countryRepository;

  PlayerRepository(this.dao, this.countryRepository);

  // =========================
  // 🔹 PRIVATE HELPER METHODS
  // =========================

  /// Helper to map a single player with its country information.
  ///
  /// Looks up the player's country from the repository and maps to domain model.
  ///
  /// Parameters:
  ///   - [playerRow]: The database player record
  ///
  /// Returns: Domain [Player] model with country resolved
  ///
  /// Throws: Exception if country is not found
  Future<Player> _mapPlayerWithCountry(PlayerRecord playerRow) async {
    final country = await countryRepository.getCountryById(playerRow.countryId);
    return PlayerMapper.toDomain(playerRow, country);
  }

  /// Helper to map multiple players with their countries efficiently.
  ///
  /// Batch-fetches all unique countries in a single query, then maps players.
  /// More efficient than calling [_mapPlayerWithCountry] repeatedly.
  ///
  /// Parameters:
  ///   - [playerRows]: List of database player records
  ///
  /// Returns: List of domain [Player] models with countries resolved
  ///
  /// Note: Returns empty list if playerRows is empty
  Future<List<Player>> _mapPlayersWithCountries(
    List<PlayerRecord> playerRows,
  ) async {
    if (playerRows.isEmpty) return [];

    // Get all unique country IDs
    final countryIds = playerRows.map((row) => row.countryId).toSet().toList();

    // Fetch all countries in one batch
    final countries = await countryRepository.getCountriesByIds(countryIds);
    final countryMap = {for (var c in countries) c.id: c};

    // Map each player with its country
    return playerRows.map((playerRow) {
      final country = countryMap[playerRow.countryId];
      if (country == null) {
        throw Exception('Country not found for player ${playerRow.id}');
      }
      return PlayerMapper.toDomain(playerRow, country);
    }).toList();
  }

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves all players from the database.
  ///
  /// Returns: List of all [Player] domain models with countries resolved
  ///
  /// Performance: O(n + m) where n is player count, m is unique country count
  Future<List<Player>> getAllPlayers() async {
    final rows = await dao.getAllPlayers();
    return _mapPlayersWithCountries(rows);
  }

  /// Retrieves all players with their country and continent data.
  Future<List<Map<String, dynamic>>>
  getAllPlayersWithCountryAndContinent() async {
    return dao.getAllPlayersWithCountryAndContinent();
  }

  /// Retrieves specific players by their IDs.
  ///
  /// Parameters:
  ///   - [ids]: List of player IDs to retrieve
  ///
  /// Returns: List of [Player] domain models (only includes IDs that exist)
  Future<List<Player>> getPlayersByIdsWithCountry(List<int> ids) async {
    final rows = await dao.getPlayersByIdsWithCountry(ids);

    // Map the results to Player objects
    List<Player> players = [];
    for (var row in rows) {
      final playerRecord = row['player'] as PlayerRecord;
      final countryRecord = row['country'] as CountryRecord;
      players.add(PlayerMapper.toDomain(playerRecord, countryRecord));
    }
    return players;
  }

  /// Retrieves a single player by ID with its country information.
  Future<Map<String, dynamic>?> getPlayerByIdWithCountry(int id) async {
    return dao.getByIdWithCountry(id);
  }

  /// Retrieves players by position with their country information.
  Future<List<Map<String, dynamic>>> getPlayersByPositionWithCountry(
    Position position,
  ) async {
    return dao.getByPositionWithCountry(position.label);
  }

  /// Retrieves a single player by ID.
  ///
  /// Parameters:
  ///   - [id]: The player ID
  ///
  /// Returns: The [Player] domain model or null if not found
  Future<Player?> getById(int id) async {
    final row = await dao.getById(id);
    if (row == null) return null;
    return _mapPlayerWithCountry(row);
  }

  /// Retrieves all players with a specific position.
  ///
  /// Parameters:
  ///   - [position]: The [Position] enum to filter by
  ///
  /// Returns: List of [Player]s matching the position (empty list if none found)
  Future<List<Player>> getByPosition(Position position) async {
    final rows = await dao.getByPosition(position.label);
    return _mapPlayersWithCountries(rows);
  }

  /// Retrieves all players for a specific country.
  ///
  /// Parameters:
  ///   - [countryId]: The country ID to filter by
  ///
  /// Returns: List of [Player]s from that country (empty list if none found)
  Future<List<Player>> getPlayersByCountryId(int countryId) async {
    final rows = await dao.getPlayersByCountryId(countryId);
    return _mapPlayersWithCountries(rows);
  }

  // =========================
  // 🔹 WRITE OPERATIONS
  // =========================

  /// Saves a single player to the database (insert or update).
  ///
  /// Validates player data before saving and resolves country by name.
  ///
  /// Parameters:
  ///   - [player]: The [Player] domain model to save
  ///
  /// Throws: Exception if country is not found
  Future<void> save(Player player) async {
    // Need to get or create the country record first
    final country = await countryRepository.getCountryByName(player.country);
    if (country == null) {
      throw Exception('Country "${player.country}" not found');
    }
    final row = PlayerMapper.toCompanion(player, country);
    return dao.upsertPlayer(row);
  }

  /// Saves multiple players to the database (batch operation).
  ///
  /// Calls [save] for each player. For bulk imports, consider using [replaceAll].
  ///
  /// Parameters:
  ///   - [players]: List of [Player] domain models to save
  ///
  /// Throws: Exception if any country is not found
  Future<void> saveAll(List<Player> players) async {
    for (final player in players) {
      await save(player);
    }
  }

  /// Creates a single player record.
  Future<void> create(Player player) {
    return save(player);
  }

  /// Updates a single player record.
  Future<void> update(Player player) {
    return save(player);
  }

  /// Deletes a player by ID.
  ///
  /// Parameters:
  ///   - [id]: The player ID to delete
  ///
  /// Returns: Number of rows deleted (0 or 1)
  Future<void> deleteById(int id) {
    return dao.deletePlayer(id);
  }

  /// Deletes a single player record.
  Future<void> delete(Player player) {
    return deleteById(player.id);
  }

  // =========================
  // � UTILITY METHODS
  // =========================

  /// Retrieves a squad of players by their IDs (team roster).
  ///
  /// Parameters:
  ///   - [playerIds]: List of player IDs in the squad
  ///
  /// Returns: List of [Player]s from all players, filtered to squad IDs
  ///
  /// Note: Fetches all players, so avoid with large databases
  Future<List<Player>> getTeamSquad(List<int> playerIds) async {
    final all = await getAllPlayers();
    final idSet = playerIds.toSet();
    return all.where((p) => idSet.contains(p.id)).toList();
  }
}
