import 'dart:convert';

import 'package:ts1_core/ts1_core.dart';
import 'package:drift/drift.dart' show Value;
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/daos/national_team_dao.dart';
import 'package:ts1_persistence/src/repositories/player_repository.dart';
import '../mappers/team_mapper.dart';
import '../mappers/team_lineup_mapper.dart';

/// Repository for national team data access and complex reconstruction.
///
/// Provides domain-level access to national teams with their lineups and tactics.
/// This is a complex repository because it must coordinate multiple related entities:
/// - National team records (with embedded tactics JSON)
/// - Lineup compositions with player objects
///
/// The repository automatically reconstructs complex nested structures from database storage.
///
/// Usage:
/// ```dart
/// final repo = NationalTeamRepository(dao, playerRepo);
/// final teams = await repo.getAllTeamsWithTactics();
/// final team = await repo.getTeamWithTactics(1);
/// ```
class NationalTeamRepository {
  final NationalTeamDao dao;
  final PlayerRepository playerRepository;

  NationalTeamRepository(this.dao, this.playerRepository);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves all national teams with their tactics and complete lineups.
  ///
  /// This is a heavyweight operation that reconstructs complex nested structures.
  /// Each team includes:
  /// - Tactical configuration (parsed from team record's tactics JSON)
  /// - Complete lineup with all player objects resolved
  /// - Bench and reserve player lists
  /// - Formation shape and slot assignments
  ///
  /// Returns: List of domain [Team] models fully reconstructed
  ///
  /// Performance: O(n*m) where n is team count, m is average players per team
  Future<List<Team>> getAllTeamsWithTactics() async {
    final teamRows = await dao.getAllTeamsWithTactics();

    print('Total teams found: ${teamRows.length}');

    List<Team> teams = [];
    for (var row in teamRows) {
      final teamRecord = row['team'] as NationalTeamRecord;

      final tactic = _parseTactics(teamRecord.tactics);
      final lineup = await _parseLineup(teamRecord.lineup);

      teams.add(TeamMapper.toDomain(teamRecord, tactic, lineup));
    }
    return teams;
  }

  /// Retrieves all national teams with their country and tactic information.
  Future<List<Map<String, Object?>>> getAllTeamsWithCountryAndTactics() async {
    return dao.getAllTeamsWithTactics();
  }

  // =========================
  // 🔧 UTILITY METHODS
  // =========================

  /// Retrieves a single team by ID with its tactics and lineup.
  ///
  /// Parameters:
  ///   - [teamId]: The team ID to retrieve
  ///
  /// Returns: The [Team] domain model fully reconstructed, or null if not found
  Future<Team?> getTeamWithTactics(int teamId) async {
    final teamRecord = await dao.getTeamById(teamId);
    if (teamRecord == null) return null;

    final tactic = _parseTactics(teamRecord.tactics);
    final lineup = await _parseLineup(teamRecord.lineup);

    return TeamMapper.toDomain(teamRecord, tactic, lineup);
  }

  /// Retrieves a team with its country and tactic information.
  Future<Map<String, Object?>?> getTeamWithCountryAndTactics(int teamId) async {
    return dao.getTeamByIdWithCountryAndTactics(teamId);
  }

  /// Retrieves multiple teams by their IDs with tactics and lineups.
  ///
  /// Parameters:
  ///   - [teamIds]: List of team IDs to retrieve
  ///
  /// Returns: List of [Team]s (only includes IDs that exist)
  Future<List<Team>> getTeamsWithTactics(List<int> teamIds) async {
    final teams = <Team>[];
    for (final teamId in teamIds) {
      final team = await getTeamWithTactics(teamId);
      if (team != null) {
        teams.add(team);
      }
    }
    return teams;
  }

  /// Creates a national team record.
  Future<int> createTeam(NationalTeamsCompanion team) {
    final prepared = _normalizeAndValidateCompanion(team);
    return dao.insertTeam(prepared);
  }

  /// Upserts a national team record.
  Future<void> upsertTeam(NationalTeamsCompanion team) {
    final prepared = _normalizeAndValidateCompanion(team);
    return dao.upsertTeam(prepared);
  }

  /// Updates a national team record.
  Future<int> updateTeam(NationalTeamsCompanion team) {
    final prepared = _normalizeAndValidateCompanion(team);
    return dao.updateTeam(prepared);
  }

  /// Updates a team's tactics by ID.
  ///
  /// Parameters:
  ///   - [teamId]: The team ID
  ///   - [tactic]: The new [TeamTactic] to store
  ///
  /// Returns: Number of rows updated
  Future<int> updateTeamTactics(int teamId, TeamTactic tactic) {
    final tacticJson = jsonEncode(tactic.toJson());
    return dao.updateTeam(
      NationalTeamsCompanion(id: Value(teamId), tactics: Value(tacticJson)),
    );
  }

  /// Deletes a national team by ID.
  Future<int> deleteTeam(int id) {
    return dao.deleteTeam(id);
  }

  /// Gets a team summary map for UI display.
  ///
  /// Parameters:
  ///   - [team]: The team to summarize
  ///
  /// Returns: Map with team information suitable for display
  static Map<String, dynamic> toSummaryMap(Team team) {
    return TeamMapper.toSummaryMap(team);
  }

  /// Validates team integrity.
  ///
  /// Parameters:
  ///   - [team]: The team to validate
  ///
  /// Throws: ArgumentError if validation fails
  static void validate(Team team) {
    TeamMapper.validate(team);
  }

  // =========================
  // 🔧 PRIVATE HELPER METHODS
  // =========================

  /// Parses tactics from stored JSON string in team record.
  ///
  /// If tactics JSON is empty or invalid, returns a default balanced tactic.
  ///
  /// Parameters:
  ///   - [tacticsJson]: Stringified JSON tactics data from database
  ///
  /// Returns: The [TeamTactic] domain model
  TeamTactic _parseTactics(String tacticsJson) {
    try {
      if (tacticsJson.isEmpty || tacticsJson == '{}') {
        return TacticalPresetFactory.create(TacticalPreset.balanced);
      }
      final decoded = Map<String, dynamic>.from(jsonDecode(tacticsJson) as Map);
      return TeamTactic.fromJson(decoded);
    } catch (e) {
      print('Error parsing tactics: $e, returning balanced tactic');
      return TacticalPresetFactory.create(TacticalPreset.balanced);
    }
  }

  /// Reconstructs a TeamLineup from stored JSON and player data.
  ///
  /// This method handles the complex transformation of database JSON storage
  /// back into a fully functional [TeamLineup] with resolved Player objects.
  ///
  /// JSON Structure expected:
  /// ```json
  /// {
  ///   "captainId": 123,
  ///   "benchIds": [playerID, ...],
  ///   "reserveIds": [playerID, ...],
  ///   "slotAssignments": [
  ///     {
  ///       "playerId": 123,
  ///       "roleAssignment": {...},
  ///       "formationSlot": {...}
  ///     },
  ///     ...
  ///   ],
  ///   "formationShape": {...}
  /// }
  /// ```
  ///
  /// Parameters:
  ///   - [lineupJson]: Stringified JSON lineup data from database
  ///
  /// Returns: Fully reconstructed [TeamLineup] with Player objects
  ///
  /// Throws: Exception if any referenced player is not found in database
  ///
  /// Private: Internal helper - use getAllTeamsWithTactics() for public API
  Future<TeamLineup> _parseLineup(String lineupJson) async {
    final decoded = Map<String, dynamic>.from(jsonDecode(lineupJson) as Map);

    // Merge decoded JSON's bench ids, reserve ids, and slot assignment player ids into a single set of unique player IDs
    final playerIds = <int>{
      for (final id in decoded['benchIds'] as List<dynamic>) id as int,
      for (final id in decoded['reserveIds'] as List<dynamic>) id as int,
      for (final assignment in decoded['slotAssignments'] as List<dynamic>)
        (assignment['playerId'] as int),
    };

    // Fetch player records for all unique player IDs
    final players = await playerRepository.getPlayersByIdsWithCountry(
      playerIds.toList(),
    );

    // Create a map of player ID to Player object for easy lookup
    final playerMap = {for (var p in players) p.id: p};

    return TeamLineupMapper.toDomain(decoded, playerMap);
  }

  // ----------------------
  // Normalization & validation
  // ----------------------

  NationalTeamsCompanion _normalizeAndValidateCompanion(
    NationalTeamsCompanion input,
  ) {
    // Normalize color values and require all three colors
    String normalize(String raw) {
      var s = raw.trim().toLowerCase();
      if (!s.startsWith('#')) s = '#$s';
      return s;
    }

    final primary = input.primaryColor.present
        ? normalize(input.primaryColor.value)
        : null;
    final secondary = input.secondaryColor.present
        ? normalize(input.secondaryColor.value)
        : null;
    final tertiary = input.tertiaryColor.present
        ? normalize(input.tertiaryColor.value)
        : null;

    if (primary == null || primary.isEmpty || !_isValidHex(primary)) {
      throw ArgumentError(
        'primary_color is required and must be in #rrggbb format',
      );
    }
    if (secondary == null || secondary.isEmpty || !_isValidHex(secondary)) {
      throw ArgumentError(
        'secondary_color is required and must be in #rrggbb format',
      );
    }
    if (tertiary == null || tertiary.isEmpty || !_isValidHex(tertiary)) {
      throw ArgumentError(
        'tertiary_color is required and must be in #rrggbb format',
      );
    }

    return NationalTeamsCompanion(
      id: input.id,
      countryId: input.countryId,
      name: input.name,
      lineup: input.lineup,
      tactics: input.tactics,
      primaryColor: Value(primary),
      secondaryColor: Value(secondary),
      tertiaryColor: Value(tertiary),
    );
  }

  bool _isValidHex(String v) {
    final hexReg = RegExp(r'^#[0-9a-f]{6}$');
    return hexReg.hasMatch(v);
  }
}
