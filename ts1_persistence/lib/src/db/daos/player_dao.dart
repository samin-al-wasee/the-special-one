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

  Future<PlayerRecord?> getById(int id) {
    return (select(players)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<List<PlayerRecord>> getByPosition(String position) {
    return (select(players)..where((p) => p.position.equals(position))).get();
  }

  // =========================
  // 🔹 WRITE (single)
  // =========================

  Future<void> upsertPlayer(Insertable<PlayerRecord> player) {
    return into(players).insertOnConflictUpdate(player);
  }

  Future<int> deletePlayer(int id) {
    return (delete(players)..where((p) => p.id.equals(id))).go();
  }

  // =========================
  // 🔥 BULK OPERATIONS (IMPORTANT)
  // =========================

  Future<void> insertAll(List<Insertable<PlayerRecord>> items) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(players, items);
    });
  }

  Future<void> replaceAll(List<Insertable<PlayerRecord>> items) async {
    return transaction(() async {
      await delete(players).go();
      await insertAll(items);
    });
  }
}
