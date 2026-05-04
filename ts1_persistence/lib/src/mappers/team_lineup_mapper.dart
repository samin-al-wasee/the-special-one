import 'dart:convert';

import 'package:ts1_core/ts1_core.dart';

class TeamLineupMapper {
  // =========================
  // 🔹 DB → DOMAIN
  // =========================
  static TeamLineup toDomain(
    Map<String, dynamic> lineupJson,
    Map<int, Player> playerMap,
  ) {
    // The lineupJson is expected to have the structure of TeamLineup's JSON representation.
    // We will use the provided list of players to resolve player references in the lineup.
    final decoded = Map<String, dynamic>.from(lineupJson);

    // In decoded replace benchIds, reserveIds, and slotAssignments' player ids with actual Player objects from the playerMap
    // First, we need to get benchIds
    final benchIds = List<int>.from(decoded['benchIds'] ?? []);
    final reserveIds = List<int>.from(decoded['reserveIds'] ?? []);
    final slotAssignments = (decoded['slotAssignments'] as List<dynamic>? ?? [])
        .map((entry) => Map<String, dynamic>.from(entry as Map))
        .toList();

    // Replace benchIds with bench Players
    decoded['bench'] = benchIds
        .map((id) => playerMap[id])
        .whereType<Player>()
        .map((player) => player.toJson())
        .toList();

    // Replace reserveIds with reserve Players
    decoded['reserves'] = reserveIds
        .map((id) => playerMap[id])
        .whereType<Player>()
        .map((player) => player.toJson())
        .toList();

    // Replace slotAssignments' playerId with actual Player objects
    decoded['slotAssignments'] = slotAssignments.map((sa) {
      final playerId = sa['playerId'] as int;
      final player = playerMap[playerId];
      if (player == null) {
        throw Exception('Player with ID $playerId not found in playerMap');
      }
      return {...sa, 'player': player.toJson()};
    }).toList();

    // Replace captainId with actual Player object
    if (decoded['captainId'] != null) {
      final captainId = decoded['captainId'] as int;
      final captain = playerMap[captainId];
      if (captain == null) {
        throw Exception('Captain with ID $captainId not found in playerMap');
      }
      decoded['captain'] = captain.toJson();
    }

    // Now we can construct the TeamLineup using the decoded JSON and the player map
    return TeamLineup.fromJson(decoded);
  }

  // =========================
  // 🔹 DOMAIN → DB TRANSFORMATIONS
  // =========================

  /// Converts a domain [TeamLineup] to a JSON string for database storage.
  ///
  /// The method replaces all Player objects with their IDs and serializes
  /// the lineup structure for storage in the database.
  ///
  /// Handles:
  /// - Converting bench Players to benchIds list
  /// - Converting reserve Players to reserveIds list
  /// - Extracting player IDs from slot assignments
  /// - Storing captain as captainId
  ///
  /// Parameters:
  ///   - [lineup]: The domain lineup model with Player objects
  ///
  /// Returns: A JSON string suitable for database storage
  static String toJson(TeamLineup lineup) {
    final lineupJson = lineup.toJson();

    // Replace bench Players with their IDs
    lineupJson['benchIds'] = (lineup.bench).map((p) => p.id).toList();

    // Replace reserve Players with their IDs
    lineupJson['reserveIds'] = (lineup.reserves).map((p) => p.id).toList();

    // Replace slotAssignments' player with playerId
    lineupJson['slotAssignments'] = (lineup.slotAssignments).map((sa) {
      final player = sa.player;
      return {...sa.toJson(), 'playerId': player.id}..remove(
        'player',
      ); // Remove the 'player' key since we are replacing it with 'playerId'
    }).toList();

    // Replace captain Player with captainId
    if (lineup.captain != null) {
      lineupJson['captainId'] = lineup.captain!.id;
      lineupJson.remove(
        'captain',
      ); // Remove the 'captain' key since we are replacing it with 'captainId'
    }

    return jsonEncode(lineupJson);
  }
}
