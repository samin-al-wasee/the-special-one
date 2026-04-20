import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/players.dart';

part 'player_dao.g.dart';

@DriftAccessor(tables: [Players])
class PlayerDao extends DatabaseAccessor<AppDatabase> with _$PlayerDaoMixin {
  PlayerDao(super.db);

  // =========================
  // 🔹 READ
  // =========================

  Future<List<PlayerRecord>> getAllPlayers() {
    return select(players).get();
  }

  // Get all players with country by a list of IDs.
  Future<List<Map<String, dynamic>>> getPlayersByIdsWithCountry(List<int> ids) {
    final query = select(players).join([
      innerJoin(countries, countries.id.equalsExp(players.countryId)),
    ])
      ..where(players.id.isIn(ids));

    return query.map((row) {
      final player = row.readTable(players);
      final country = row.readTable(countries);
      return {
        'player': player,
        'country': country,
      };
    }).get();
  }

  Future<PlayerRecord?> getById(int id) {
    return (select(players)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<List<PlayerRecord>> getByPosition(String position) {
    return (select(players)..where((p) => p.position.equals(position))).get();
  }

  // =========================
  // 🔹 WRITE (single)
  // =========================

  Future<void> insertPlayer(PlayersCompanion player) {
    return into(players).insert(player);
  }

  Future<void> upsertPlayer(PlayersCompanion player) {
    return into(players).insertOnConflictUpdate(player);
  }

  Future<void> updatePlayer(PlayersCompanion player) {
    return (update(players)..where((p) => p.id.equals(player.id.value))).write(player);
  }

  Future<int> deletePlayer(int id) {
    return (delete(players)..where((p) => p.id.equals(id))).go();
  }

  // =========================
  // 🔥 BULK OPERATIONS (IMPORTANT)
  // =========================

  Future<void> insertAll(List<PlayersCompanion> items) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(players, items);
    });
  }

  Future<void> replaceAll(List<PlayersCompanion> items) async {
    return transaction(() async {
      await delete(players).go();
      await insertAll(items);
    });
  }
}
