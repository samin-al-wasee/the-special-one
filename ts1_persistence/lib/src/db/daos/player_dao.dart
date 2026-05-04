import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/players.dart';

part 'player_dao.g.dart';

/// Data Access Object for player records in the database.
///
/// Provides low-level database access for [Players] table operations including
/// CRUD operations, batch processing, filtering by position, and lookups by ID.
///
/// Note: This DAO is typically used by [PlayerRepository] for higher-level
/// domain-aware operations. Prefer using the repository layer when available.
@DriftAccessor(tables: [Players])
class PlayerDao extends DatabaseAccessor<AppDatabase> with _$PlayerDaoMixin {
  PlayerDao(super.db);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves all players from the database.
  ///
  /// Returns: List of all [PlayerRecord]s (empty list if none exist)
  ///
  /// Performance: O(n) where n is total player count. Consider pagination for large datasets.
  Future<List<PlayerRecord>> getAllPlayers() {
    return select(players).get();
  }

  /// Retrieves players by IDs along with their associated country information.
  ///
  /// This is an efficient join query that fetches both player and country data
  /// in a single database call.
  ///
  /// Parameters:
  ///   - [ids]: List of player IDs to retrieve
  ///
  /// Returns: List of maps with 'player' and 'country' keys containing [PlayerRecord] and [CountryRecord]
  ///
  /// Note: Only returns players whose IDs are in the provided list; returns empty list if no matches
  Future<List<Map<String, dynamic>>> getPlayersByIdsWithCountry(List<int> ids) {
    final query = select(players).join([
      innerJoin(countries, countries.id.equalsExp(players.countryId)),
    ])..where(players.id.isIn(ids));

    return query.map((row) {
      final player = row.readTable(players);
      final country = row.readTable(countries);
      return {'player': player, 'country': country};
    }).get();
  }

  /// Retrieves a single player by ID.
  ///
  /// Parameters:
  ///   - [id]: The player ID
  ///
  /// Returns: The [PlayerRecord] or null if not found
  Future<PlayerRecord?> getById(int id) {
    return (select(players)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  /// Retrieves all players with a specific position.
  ///
  /// Parameters:
  ///   - [position]: The position label to filter by (e.g., 'Center Back', 'Striker')
  ///
  /// Returns: List of [PlayerRecord]s matching the position (empty list if none found)
  Future<List<PlayerRecord>> getByPosition(String position) {
    return (select(players)..where((p) => p.position.equals(position))).get();
  }

  /// Retrieves all players with their associated country information.
  Future<List<Map<String, dynamic>>> getAllPlayersWithCountry() async {
    final query = select(
      players,
    ).join([innerJoin(countries, countries.id.equalsExp(players.countryId))]);

    final rows = await query.get();
    return rows
        .map(
          (row) => {
            'player': row.readTable(players),
            'country': row.readTable(countries),
          },
        )
        .toList();
  }

  /// Retrieves a player by ID along with its country information.
  Future<Map<String, dynamic>?> getByIdWithCountry(int id) async {
    final query = select(players).join([
      innerJoin(countries, countries.id.equalsExp(players.countryId)),
    ])..where(players.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return {
      'player': row.readTable(players),
      'country': row.readTable(countries),
    };
  }

  /// Retrieves players by position along with their country information.
  Future<List<Map<String, dynamic>>> getByPositionWithCountry(
    String position,
  ) async {
    final query = select(players).join([
      innerJoin(countries, countries.id.equalsExp(players.countryId)),
    ])..where(players.position.equals(position));

    final rows = await query.get();
    return rows
        .map(
          (row) => {
            'player': row.readTable(players),
            'country': row.readTable(countries),
          },
        )
        .toList();
  }

  /// Retrieves all players with their country and continent information.
  Future<List<Map<String, dynamic>>>
  getAllPlayersWithCountryAndContinent() async {
    final query = select(players).join([
      innerJoin(countries, countries.id.equalsExp(players.countryId)),
      innerJoin(continents, continents.id.equalsExp(countries.continentId)),
    ]);

    final rows = await query.get();
    return rows
        .map(
          (row) => {
            'player': row.readTable(players),
            'country': row.readTable(countries),
            'continent': row.readTable(continents),
          },
        )
        .toList();
  }

  // =========================
  // 🔹 WRITE OPERATIONS (SINGLE)
  // =========================

  /// Inserts a new player into the database.
  ///
  /// Parameters:
  ///   - [player]: The [PlayersCompanion] to insert
  ///
  /// Throws: Exception if the player already exists (unique constraint violation)
  Future<void> insertPlayer(PlayersCompanion player) {
    return into(players).insert(player);
  }

  /// Inserts or updates a player (upsert operation).
  ///
  /// If a player with the same ID exists, it will be updated.
  /// If not, it will be inserted.
  ///
  /// Parameters:
  ///   - [player]: The [PlayersCompanion] to insert or update
  ///
  /// Returns: Future that completes when operation is done
  Future<void> upsertPlayer(PlayersCompanion player) {
    return into(players).insertOnConflictUpdate(player);
  }

  /// Updates an existing player record.
  ///
  /// Parameters:
  ///   - [player]: The [PlayersCompanion] with updated values (ID must match)
  ///
  /// Throws: Exception if no player with this ID exists
  Future<void> updatePlayer(PlayersCompanion player) {
    return (update(
      players,
    )..where((p) => p.id.equals(player.id.value))).write(player);
  }

  /// Deletes a player record by ID.
  ///
  /// Parameters:
  ///   - [id]: The player ID to delete
  ///
  /// Returns: Number of rows deleted (0 or 1)
  Future<int> deletePlayer(int id) {
    return (delete(players)..where((p) => p.id.equals(id))).go();
  }

  // =========================
  // 🔥 BULK OPERATIONS
  // =========================

  /// Inserts multiple players, updating if they already exist (batch upsert).
  ///
  /// This is more efficient than calling [upsertPlayer] multiple times.
  /// Executes all inserts/updates in a single batch transaction.
  ///
  /// Parameters:
  ///   - [items]: List of [PlayersCompanion] to insert or update
  ///
  /// Returns: Future that completes when all operations are done
  Future<void> insertAll(List<PlayersCompanion> items) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(players, items);
    });
  }

  /// Replaces all players in the database with the provided list (delete all, then insert).
  ///
  /// WARNING: This deletes ALL existing players before inserting new ones.
  /// Use with caution. This operation is atomic (all or nothing).
  ///
  /// Parameters:
  ///   - [items]: List of [PlayersCompanion] to replace all players with
  ///
  /// Returns: Future that completes when operation is done
  Future<void> replaceAll(List<PlayersCompanion> items) async {
    return transaction(() async {
      await delete(players).go();
      await insertAll(items);
    });
  }
}
