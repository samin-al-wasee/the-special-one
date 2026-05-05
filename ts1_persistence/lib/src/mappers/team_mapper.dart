import 'dart:convert';

import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';

/// Mapper for converting between [Team] domain models and database records.
///
/// This class handles transformation of national team data between the persistence layer
/// and the domain layer. It works in conjunction with [TeamLineupMapper] and relies on
/// the tactic and lineup already being reconstructed separately.
///
/// Usage:
/// ```dart
/// final team = TeamMapper.toDomain(teamRecord, tactic, lineup);
/// ```
class TeamMapper {
  // =========================
  // 🔹 DB → DOMAIN TRANSFORMATIONS
  // =========================

  /// Converts a database [NationalTeamRecord] along with reconstructed [TeamTactic] and [TeamLineup]
  /// to a domain [Team] model.
  ///
  /// Note: This mapper expects tactic and lineup to be reconstructed by their respective repositories.
  /// It does not handle those transformations directly.
  ///
  /// Parameters:
  ///   - [teamRow]: The national team record from the database
  ///   - [nationalTeamTactic]: A pre-reconstructed tactic (or default balanced tactic)
  ///   - [nationalTeamLineup]: A pre-reconstructed lineup
  ///
  /// Returns: A domain [Team] with populated tactic and lineup, and empty squad list
  static Team toDomain(
    NationalTeamRecord teamRow,
    TeamTactic nationalTeamTactic,
    TeamLineup nationalTeamLineup,
  ) {
    return Team(
      id: teamRow.id,
      name: teamRow.name,
      primaryColor: teamRow.primaryColor,
      secondaryColor: teamRow.secondaryColor,
      tertiaryColor: teamRow.tertiaryColor,
      tactic: nationalTeamTactic,
      lineup: nationalTeamLineup,
      squad: [],
    );
  }

  // =========================
  // 🔹 DOMAIN → DB TRANSFORMATIONS
  // =========================

  /// Converts a domain [Team] model to a database [NationalTeamRecord].
  ///
  /// Serializes both the team's lineup and tactics as JSON.
  ///
  /// Parameters:
  ///   - [team]: The domain team model
  ///
  /// Returns: A [NationalTeamRecord] with lineup and tactics serialized as JSON
  static NationalTeamRecord toRecord(Team team) {
    return NationalTeamRecord(
      id: team.id,
      name: team.name,
      countryId: 0,
      lineup: jsonEncode(team.lineup.toJson()),
      tactics: jsonEncode(team.tactic.toJson()),
      primaryColor: team.primaryColor,
      secondaryColor: team.secondaryColor,
      tertiaryColor: team.tertiaryColor,
    );
  }

  // =========================
  // 🔧 UTILITY METHODS
  // =========================

  /// Creates a summary map of team information for UI display.
  ///
  /// Returns:
  /// ```dart
  /// {
  ///   'name': 'France National Team',
  ///   'formation': '4-3-3',
  ///   'starters': 11,
  ///   'bench': 7,
  ///   'reserves': 4,
  ///   'mentality': 'Balanced',
  /// }
  /// ```
  static Map<String, dynamic> toSummaryMap(Team team) {
    return {
      'name': team.name,
      'formation': team.lineup.formationShape.code,
      'starters': team.lineup.slotAssignments.length,
      'bench': team.lineup.bench.length,
      'reserves': team.lineup.reserves.length,
      'mentality': team.tactic.teamMentality.toString(),
      'playStyle': team.tactic.buildUpStyle.toString(),
    };
  }

  /// Validates team integrity and lineup consistency.
  ///
  /// Checks:
  /// - Team name is not empty
  /// - Lineup has required formation
  /// - Tactic is properly initialized
  ///
  /// Throws: ArgumentError if validation fails
  static void validate(Team team) {
    if (team.name.isEmpty) {
      throw ArgumentError('Team name cannot be empty');
    }
    if (team.lineup.slotAssignments.isEmpty) {
      throw ArgumentError('Team must have at least one starting player');
    }
  }
}
