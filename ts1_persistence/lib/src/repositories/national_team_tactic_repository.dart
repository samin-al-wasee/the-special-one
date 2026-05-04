import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/daos/national_team_tactic_dao.dart';

/// Repository for national team tactical configuration data.
/// 
/// Provides domain-level access to team tactics, handling transformation from
/// database records to domain [TeamTactic] models. Returns default balanced tactics
/// if none are stored for a team.
/// 
/// Usage:
/// ```dart
/// final repo = NationalTeamTacticRepository(tacticDao);
/// final tactic = await repo.getTacticByTeamId(1);
/// final tactics = await repo.getTacticsByTeamIds([1, 2, 3]);
/// ```
class NationalTeamTacticRepository {
  final NationalTeamTacticDao dao;

  NationalTeamTacticRepository(this.dao);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves a team's tactical configuration.
  /// 
  /// If no tactics are stored for the team, returns a default balanced tactic.
  /// 
  /// Parameters:
  ///   - [teamId]: The team ID
  /// 
  /// Returns: The [TeamTactic] domain model (never null)
  Future<TeamTactic?> getTacticByTeamId(int teamId) async {
    final tacticRow = await dao.getTacticByTeamId(teamId);
    if (tacticRow == null) {
      return TacticalPresetFactory.create(
        TacticalPreset.balanced,
      ); // Return a default tactic if none is found for the team
    }
    return TeamTactic.fromJson(tacticRow.toJson());
  }

  /// Retrieves a team's tactical configuration along with the team record.
  Future<Map<String, Object?>?> getTacticByTeamIdWithTeam(int teamId) async {
    return dao.getTacticByTeamIdWithTeam(teamId);
  }

  /// Retrieves tactics for multiple teams in a single batch operation.
  /// 
  /// Returns default balanced tactics for any teams without stored tactics.
  /// 
  /// Parameters:
  ///   - [teamIds]: List of team IDs to retrieve tactics for
  /// 
  /// Returns: Map of team ID to [TeamTactic] (always includes all requested IDs)
  Future<Map<int, TeamTactic>> getTacticsByTeamIds(List<int> teamIds) async {
    Map<int, TeamTactic> tacticsMap = {};
    for (var teamId in teamIds) {
      final tactic = await getTacticByTeamId(teamId);
      if (tactic != null) {
        tacticsMap[teamId] = tactic;
      } else {
        tacticsMap[teamId] = TacticalPresetFactory.create(
          TacticalPreset.balanced,
        ); // Default tactic
      }
    }
    return tacticsMap;
  }

  /// Retrieves tactics with their team records in a single query.
  Future<List<Map<String, Object?>>> getAllTacticsWithTeam() async {
    return dao.getAllTacticsWithTeam();
  }

  /// Creates a tactic record.
  Future<int> createTactic(NationalTeamTacticsCompanion tactic) {
    return dao.insertTactic(tactic);
  }

  /// Upserts a tactic record.
  Future<void> upsertTactic(NationalTeamTacticsCompanion tactic) {
    return dao.upsertTactic(tactic);
  }

  /// Updates a tactic record.
  Future<int> updateTactic(int teamId, NationalTeamTacticsCompanion tactic) {
    return dao.updateTactic(teamId, tactic);
  }

  /// Deletes a tactic record by team ID.
  Future<int> deleteTactic(int teamId) {
    return dao.deleteTactic(teamId);
  }
}
