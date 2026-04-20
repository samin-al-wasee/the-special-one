import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/daos/national_team_tactic_dao.dart';

class NationalTeamTacticRepository {
  final NationalTeamTacticDao dao;

  NationalTeamTacticRepository(this.dao);

  Future<TeamTactic?> getTacticByTeamId(int teamId) async {
    final tacticRow = await dao.getTacticByTeamId(teamId);
    if (tacticRow == null) {
      return TacticalPresetFactory.create(
        TacticalPreset.balanced,
      ); // Return a default tactic if none is found for the team
    }
    return TeamTactic.fromJson(tacticRow.toJson());
  }

  // Get multiple tactics by team IDs (batch)
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
}
