import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';
import 'package:ts1_persistence/src/mappers/player_mapper.dart';
import 'package:ts1_persistence/src/repositories/country_repository.dart';

class PlayerRepository {
  final PlayerDao dao;
  final CountryRepository countryRepository;

  PlayerRepository(this.dao, this.countryRepository);

  // =========================
  // 🔹 PRIVATE HELPER METHODS
  // =========================

  // Helper to map a single player with its country
  Future<Player> _mapPlayerWithCountry(PlayerRecord playerRow) async {
    final country = await countryRepository.getCountryById(playerRow.countryId);
    return PlayerMapper.toDomain(playerRow, country);
  }

  // Helper to map multiple players with their countries (batch)
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

  Future<List<Player>> getAllPlayers() async {
    final rows = await dao.getAllPlayers();
    return _mapPlayersWithCountries(rows);
  }

  Future<Player?> getById(int id) async {
    final row = await dao.getById(id);
    if (row == null) return null;
    return _mapPlayerWithCountry(row);
  }

  Future<List<Player>> getByPosition(Position position) async {
    final rows = await dao.getByPosition(position.label);
    return _mapPlayersWithCountries(rows);
  }

  // =========================
  // 🔹 WRITE OPERATIONS
  // =========================

  Future<void> save(Player player) async {
    // Need to get or create the country record first
    final country = await countryRepository.getCountryByName(player.country);
    if (country == null) {
      throw Exception('Country "${player.country}" not found');
    }
    final row = PlayerMapper.toCompanion(player, country);
    return dao.upsertPlayer(row);
  }

  Future<void> saveAll(List<Player> players) async {
    for (final player in players) {
      await save(player);
    }
  }

  Future<void> deleteById(int id) {
    return dao.deletePlayer(id);
  }

  // =========================
  // 🔹 OPTIONAL (GAME USE CASES)
  // =========================

  Future<List<Player>> getTeamSquad(List<int> playerIds) async {
    final all = await getAllPlayers();
    final idSet = playerIds.toSet();
    return all.where((p) => idSet.contains(p.id)).toList();
  }
}
