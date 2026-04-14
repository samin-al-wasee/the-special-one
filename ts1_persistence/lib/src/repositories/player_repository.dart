import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';
import 'package:ts1_persistence/src/mappers/player_mapper.dart';

class PlayerRepository {
  final PlayerDao dao;

  PlayerRepository(this.dao);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  Future<List<Player>> getAllPlayers() async {
    final rows = await dao.getAllPlayers();
    return rows.map(PlayerMapper.toDomain).toList();
  }

  Future<Player?> getById(int id) async {
    final row = await dao.getById(id);
    if (row == null) return null;
    return PlayerMapper.toDomain(row);
  }

  Future<List<Player>> getByPosition(Position position) async {
    final rows = await dao.getByPosition(position.label);
    return rows.map(PlayerMapper.toDomain).toList();
  }

  // =========================
  // 🔹 WRITE OPERATIONS
  // =========================

  Future<void> save(Player player) {
    final row = PlayerMapper.toRecord(player);
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
