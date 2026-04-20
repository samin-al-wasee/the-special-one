import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/national_teams.dart';
import '../tables/national_team_tactics.dart';

part 'national_team_dao.g.dart';

@DriftAccessor(tables: [NationalTeams, NationalTeamTactics])
class NationalTeamDao extends DatabaseAccessor<AppDatabase> with _$NationalTeamDaoMixin {
  NationalTeamDao(super.db);

  // Get all national teams
  Future<List<NationalTeamRecord>> getAllTeams() async {
    return await select(nationalTeams).get();
  }

  // Get all national teams with their tactics (join)
  Future<List<Map<String, Object?>>> getAllTeamsWithTactics() async {
    final query = select(nationalTeams).join([
      leftOuterJoin(
        nationalTeamTactics,
        nationalTeamTactics.teamId.equalsExp(nationalTeams.id),
      ),
    ]);

    final results = await query.get();

    return results.map((row) {
      final team = row.readTable(nationalTeams);
      final tactic = row.readTableOrNull(nationalTeamTactics);
      return {
        'team': team,
        'tactic': tactic,
      };
    }).toList();
  }

  // Get team by ID
  Future<NationalTeamRecord?> getTeamById(int id) async {
    return await (select(
      nationalTeams,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Get teams by country ID
  Future<List<NationalTeamRecord>> getTeamsByCountryId(int countryId) async {
    return await (select(
      nationalTeams,
    )..where((t) => t.countryId.equals(countryId))).get();
  }

  // Get team by national team ID
  Future<NationalTeamRecord?> getTeamByNationalTeamId(int nationalTeamId) async {
    return await (select(
      nationalTeams,
    )..where((t) => t.id.equals(nationalTeamId))).getSingleOrNull();
  }
}
