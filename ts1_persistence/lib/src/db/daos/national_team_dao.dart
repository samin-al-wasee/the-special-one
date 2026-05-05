import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/national_teams.dart';

part 'national_team_dao.g.dart';

/// Data Access Object for national team records.
///
/// Provides database access for [NationalTeams] table operations.
/// Tactics are now stored as JSON within the team record.
///
/// This DAO is typically used by [NationalTeamRepository].
@DriftAccessor(tables: [NationalTeams])
class NationalTeamDao extends DatabaseAccessor<AppDatabase>
    with _$NationalTeamDaoMixin {
  NationalTeamDao(super.db);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves all national teams from the database.
  ///
  /// Returns: List of all [NationalTeamRecord]s (empty list if none exist)
  Future<List<NationalTeamRecord>> getAllTeams() async {
    return await select(nationalTeams).get();
  }

  /// Retrieves all teams joined with their country information.
  ///
  /// Tactics are now stored as JSON within the team record.
  ///
  /// Returns: List of maps with 'team' and 'country' keys
  ///   - 'team': [NationalTeamRecord]
  ///   - 'country': [CountryRecord]
  Future<List<Map<String, Object?>>> getAllTeamsWithTactics() async {
    final query = select(nationalTeams).join([
      innerJoin(countries, countries.id.equalsExp(nationalTeams.countryId)),
    ]);

    final results = await query.get();

    return results.map((row) {
      final team = row.readTable(nationalTeams);
      final country = row.readTable(countries);
      return {'team': team, 'country': country};
    }).toList();
  }

  /// Retrieves a single team by ID.
  ///
  /// Parameters:
  ///   - [id]: The team ID
  ///
  /// Returns: The [NationalTeamRecord] or null if not found
  Future<NationalTeamRecord?> getTeamById(int id) async {
    return await (select(
      nationalTeams,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Retrieves teams associated with a specific country.
  ///
  /// Parameters:
  ///   - [countryId]: The country ID
  ///
  /// Returns: List of [NationalTeamRecord]s for that country
  Future<List<NationalTeamRecord>> getTeamsByCountryId(int countryId) async {
    return await (select(
      nationalTeams,
    )..where((t) => t.countryId.equals(countryId))).get();
  }

  /// Retrieves a team by national team ID (typically same as country ID for national teams).
  ///
  /// Parameters:
  ///   - [nationalTeamId]: The national team ID
  ///
  /// Returns: The [NationalTeamRecord] or null if not found
  ///
  /// Note: This is often redundant with [getTeamById]; use that unless you specifically
  /// need to distinguish national team ID from team ID.
  Future<NationalTeamRecord?> getTeamByNationalTeamId(
    int nationalTeamId,
  ) async {
    return await (select(
      nationalTeams,
    )..where((t) => t.id.equals(nationalTeamId))).getSingleOrNull();
  }

  // =========================
  // 🔹 WRITE OPERATIONS
  // =========================

  /// Inserts a national team record.
  Future<int> insertTeam(NationalTeamsCompanion team) {
    return into(nationalTeams).insert(team);
  }

  /// Inserts or updates a national team record.
  Future<void> upsertTeam(NationalTeamsCompanion team) {
    return into(nationalTeams).insertOnConflictUpdate(team);
  }

  /// Updates an existing national team record.
  Future<int> updateTeam(NationalTeamsCompanion team) {
    return (update(
      nationalTeams,
    )..where((t) => t.id.equals(team.id.value))).write(team);
  }

  /// Deletes a national team by ID.
  Future<int> deleteTeam(int id) {
    return (delete(nationalTeams)..where((t) => t.id.equals(id))).go();
  }

  // =========================
  // 🔹 JOINED READ OPERATIONS
  // =========================

  /// Retrieves a team with country data by ID.
  ///
  /// Tactics are stored as JSON within the team record.
  ///
  /// Returns: Map with 'team' and 'country' keys, or null if not found
  Future<Map<String, Object?>?> getTeamByIdWithCountryAndTactics(int id) async {
    final query = select(nationalTeams).join([
      innerJoin(countries, countries.id.equalsExp(nationalTeams.countryId)),
    ])..where(nationalTeams.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return {
      'team': row.readTable(nationalTeams),
      'country': row.readTable(countries),
    };
  }

  /// Retrieves teams for a country with their country data.
  ///
  /// Tactics are stored as JSON within each team record.
  Future<List<Map<String, Object?>>> getTeamsByCountryIdWithCountryAndTactics(
    int countryId,
  ) async {
    final query = select(nationalTeams).join([
      innerJoin(countries, countries.id.equalsExp(nationalTeams.countryId)),
    ])..where(nationalTeams.countryId.equals(countryId));

    final rows = await query.get();
    return rows
        .map(
          (row) => {
            'team': row.readTable(nationalTeams),
            'country': row.readTable(countries),
          },
        )
        .toList();
  }
}
