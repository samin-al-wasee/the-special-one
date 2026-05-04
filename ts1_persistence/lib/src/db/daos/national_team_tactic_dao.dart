import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/national_team_tactics.dart';

part 'national_team_tactic_dao.g.dart';

/// Data Access Object for national team tactics.
///
/// Provides database access for [NationalTeamTactics] table operations.
/// Tactics are associated with teams via team ID and store detailed playing style configuration.
///
/// This DAO is typically used by [NationalTeamTacticRepository].
@DriftAccessor(tables: [NationalTeamTactics])
class NationalTeamTacticDao extends DatabaseAccessor<AppDatabase>
    with _$NationalTeamTacticDaoMixin {
  NationalTeamTacticDao(super.db);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves a team's tactical configuration by team ID.
  ///
  /// Parameters:
  ///   - [teamId]: The team ID
  ///
  /// Returns: The [NationalTeamTacticRecord] or null if not found
  Future<NationalTeamTacticRecord?> getTacticByTeamId(int teamId) async {
    return await (select(
      nationalTeamTactics,
    )..where((t) => t.teamId.equals(teamId))).getSingleOrNull();
  }

  /// Retrieves a team's tactical configuration with its team record.
  Future<Map<String, Object?>?> getTacticByTeamIdWithTeam(int teamId) async {
    final query = select(nationalTeamTactics).join([
      innerJoin(
        db.nationalTeams,
        db.nationalTeams.id.equalsExp(nationalTeamTactics.teamId),
      ),
    ])..where(nationalTeamTactics.teamId.equals(teamId));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return {
      'tactic': row.readTable(nationalTeamTactics),
      'team': row.readTable(db.nationalTeams),
    };
  }

  // =========================
  // 🔹 WRITE OPERATIONS
  // =========================

  /// Inserts or updates a team's tactical configuration.
  ///
  /// Parameters:
  ///   - [tactic]: The [NationalTeamTacticsCompanion] to insert or update
  ///
  /// Returns: Future that completes when operation is done
  Future<void> upsertTactic(NationalTeamTacticsCompanion tactic) {
    return into(nationalTeamTactics).insertOnConflictUpdate(tactic);
  }

  /// Inserts a tactic record.
  Future<int> insertTactic(NationalTeamTacticsCompanion tactic) {
    return into(nationalTeamTactics).insert(tactic);
  }

  /// Updates an existing tactic record.
  Future<int> updateTacticRecord(
    int teamId,
    NationalTeamTacticsCompanion tactic,
  ) {
    return (update(
      nationalTeamTactics,
    )..where((t) => t.teamId.equals(teamId))).write(tactic);
  }

  /// Updates an existing tactic record.
  ///
  /// Parameters:
  ///   - [teamId]: The team ID to update tactic for
  ///   - [tactic]: The [NationalTeamTacticsCompanion] with updated values
  ///
  /// Returns: Number of rows updated
  Future<int> updateTactic(int teamId, NationalTeamTacticsCompanion tactic) {
    return updateTacticRecord(teamId, tactic);
  }

  /// Deletes a team's tactical configuration.
  ///
  /// Parameters:
  ///   - [teamId]: The team ID whose tactic should be deleted
  ///
  /// Returns: Number of rows deleted (0 or 1)
  Future<int> deleteTactic(int teamId) {
    return (delete(
      nationalTeamTactics,
    )..where((t) => t.teamId.equals(teamId))).go();
  }

  /// Deletes a tactic using the tactic record id.
  Future<int> deleteTacticById(int tacticId) {
    return (delete(
      nationalTeamTactics,
    )..where((t) => t.id.equals(tacticId))).go();
  }

  /// Retrieves all tactics for multiple teams in one query.
  ///
  /// Parameters:
  ///   - [teamIds]: List of team IDs to fetch tactics for
  ///
  /// Returns: Map of team ID to [NationalTeamTacticRecord]
  Future<Map<int, NationalTeamTacticRecord>> getTacticsByTeamIds(
    List<int> teamIds,
  ) async {
    final tactics = await (select(
      nationalTeamTactics,
    )..where((t) => t.teamId.isIn(teamIds))).get();
    return {for (var tactic in tactics) tactic.teamId!: tactic};
  }

  /// Retrieves tactics with a specific preset name.
  ///
  /// Parameters:
  ///   - [presetName]: The preset name to filter by
  ///
  /// Returns: List of [NationalTeamTacticRecord]s matching the preset
  Future<List<NationalTeamTacticRecord>> getTacticsByPresetName(
    String presetName,
  ) {
    return (select(
      nationalTeamTactics,
    )..where((t) => t.presetName.equals(presetName))).get();
  }

  /// Retrieves all tactics with their team records.
  Future<List<Map<String, Object?>>> getAllTacticsWithTeam() async {
    final query = select(nationalTeamTactics).join([
      innerJoin(
        db.nationalTeams,
        db.nationalTeams.id.equalsExp(nationalTeamTactics.teamId),
      ),
    ]);

    final rows = await query.get();
    return rows
        .map(
          (row) => {
            'tactic': row.readTable(nationalTeamTactics),
            'team': row.readTable(db.nationalTeams),
          },
        )
        .toList();
  }

  /// Retrieves multiple tactics with their team records.
  Future<Map<int, Map<String, Object?>>> getTacticsByTeamIdsWithTeam(
    List<int> teamIds,
  ) async {
    final query = select(nationalTeamTactics).join([
      innerJoin(
        db.nationalTeams,
        db.nationalTeams.id.equalsExp(nationalTeamTactics.teamId),
      ),
    ])..where(nationalTeamTactics.teamId.isIn(teamIds));

    final rows = await query.get();
    return {
      for (final row in rows)
        row.readTable(nationalTeamTactics).teamId!: {
          'tactic': row.readTable(nationalTeamTactics),
          'team': row.readTable(db.nationalTeams),
        },
    };
  }

  /// Retrieves all tactics (used for statistics or bulk operations).
  ///
  /// Returns: List of all [NationalTeamTacticRecord]s
  Future<List<NationalTeamTacticRecord>> getAllTactics() {
    return select(nationalTeamTactics).get();
  }
}
