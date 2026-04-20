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
    final decoded = lineupJson;

    // In decoded replace benchIds, reserveIds, and slotAssignments' player ids with actual Player objects from the playerMap
    // First, we need to get benchIds
    final benchIds = List<int>.from(decoded['benchIds'] ?? []);
    final reserveIds = List<int>.from(decoded['reserveIds'] ?? []);
    final slotAssignments = List<Map<String, dynamic>>.from(
      decoded['slotAssignments'] ?? [],
    );

    // Replace benchIds with bench Players
    decoded['bench'] = benchIds
        .map((id) => playerMap[id])
        .whereType<Player>()
        .toList();

    // Replace reserveIds with reserve Players
    decoded['reserves'] = reserveIds
        .map((id) => playerMap[id])
        .whereType<Player>()
        .toList();

    // Replace slotAssignments' playerId with actual Player objects
    decoded['slotAssignments'] = slotAssignments.map((sa) {
      final playerId = sa['playerId'] as int;
      final player = playerMap[playerId];
      if (player == null) {
        throw Exception('Player with ID $playerId not found in playerMap');
      }
      return {...sa, 'player': player};
    }).toList();

    // Replace captainId with actual Player object
    if (decoded['captainId'] != null) {
      final captainId = decoded['captainId'] as int;
      final captain = playerMap[captainId];
      if (captain == null) {
        throw Exception('Captain with ID $captainId not found in playerMap');
      }
      decoded['captain'] = captain;
    }

    // Now we can construct the TeamLineup using the decoded JSON and the player map
    return TeamLineup.fromJson(decoded);
  }

  // =========================
  // 🔹 DOMAIN → DB
  // =========================
  static String toJson(TeamLineup lineup) {
    // We need to convert the TeamLineup to a JSON representation that can be stored in the database.
    // This means we need to replace Player objects with their IDs in the bench, reserves, and slot assignments.

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
