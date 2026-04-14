import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/players.dart';

part 'player_dao.g.dart';

@DriftAccessor(tables: [Players])
class PlayerDao extends DatabaseAccessor<AppDatabase> with _$PlayerDaoMixin {
  PlayerDao(super.db);

  // 🔹 Get all players
  Future<List<PlayerRecord>> getAllPlayers() {
    return select(players).get();
  }

  // 🔹 Get by ID
  Future<PlayerRecord?> getById(int id) {
    return (select(players)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  // 🔹 Get players by position
  Future<List<PlayerRecord>> getByPosition(String position) {
    return (select(players)..where((p) => p.position.equals(position))).get();
  }

  // 🔹 Insert / update
  Future<void> upsertPlayer(Insertable<PlayerRecord> player) {
    return into(players).insertOnConflictUpdate(player);
  }

  // 🔹 Delete
  Future<int> deletePlayer(int id) {
    return (delete(players)..where((p) => p.id.equals(id))).go();
  }
}
