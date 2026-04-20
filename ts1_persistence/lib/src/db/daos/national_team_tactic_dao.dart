import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/national_team_tactics.dart';

part 'national_team_tactic_dao.g.dart';

@DriftAccessor(tables: [NationalTeamTactics])
class NationalTeamTacticDao extends DatabaseAccessor<AppDatabase> with _$NationalTeamTacticDaoMixin {
  NationalTeamTacticDao(super.db);

  // Get tactic by team ID
  Future<NationalTeamTacticRecord?> getTacticByTeamId(int teamId) async {
    return await (select(
      nationalTeamTactics,
    )..where((t) => t.teamId.equals(teamId))).getSingleOrNull();
  }
}
