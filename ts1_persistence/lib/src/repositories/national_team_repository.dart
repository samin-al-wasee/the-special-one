import 'dart:convert';

import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/daos/national_team_dao.dart';
import 'package:ts1_persistence/src/repositories/player_repository.dart';
import 'national_team_tactic_repository.dart';
import '../mappers/team_mapper.dart';
import '../mappers/team_lineup_mapper.dart';

class NationalTeamRepository {
  final NationalTeamDao dao;
  final NationalTeamTacticRepository tacticRepository;
  final PlayerRepository playerRepository;

  NationalTeamRepository(
    this.dao,
    this.tacticRepository,
    this.playerRepository,
  );

  Future<List<Team>> getAllTeamsWithTactics() async {
    final teamRows = await dao.getAllTeamsWithTactics();

    List<Team> teams = [];
    for (var row in teamRows) {
      final teamRecord = row['team'] as NationalTeamRecord;
      final tacticRecord = row['tactic'] as NationalTeamTacticRecord?;

      TeamTactic? tactic;
      if (tacticRecord != null) {
        tactic = TeamTactic.fromJson(tacticRecord.toJson());
      } else {
        tactic = TacticalPresetFactory.create(
          TacticalPreset.balanced,
        ); // Default tactic
      }

      final lineup = await _parseLineup(teamRecord.lineup);

      teams.add(TeamMapper.toDomain(teamRecord, tactic, lineup));
    }
    return teams;
  }

  // Private function that converts a lineup Stringified JSON to a TeamLineup object
  // JSON Shape:
  // {
  //   "captainId": 123,
  //   "bench": [playerID, ...],
  //   "reserves": [playerID, ...],
  //   "slotAssignments": [
  //     {
  //       "playerId": 123,
  //       "roleAssignment": {
  //         "role": "Shadow Striker",
  //         "duty": "attack",
  //       },
  //       "formationSlot": {
  //         "slotId": "RCM",
  //         "preferredPositions": ["AMR", "AML"],
  //         "line": "attackMid",
  //         "adjacencySlots": ["RW", "ST"],
  //         "supportLinks": ["RW", "ST"],
  //         "attackingLaneAccess": ["centralBuild"],
  //         "defensiveResponsibility": ["zone14"],
  //         "position": "AMR",
  //         "baseZone": "CM",
  //         "lateralBand": "rightHalfSpace",
  //         "verticalBand": "mid",
  //       }
  //     },
  //     ...
  //   ],
  //   "formationShape": {
  //     "code": "4-3-3",
  //     "slotDefinitions": [
  //       {
  //         "slotId": "GK",
  //         "preferredPositions": ["GK"],
  //         "line": "GK",
  //         "adjacencySlots": ["DR", "DL"],
  //         "supportLinks": ["DR", "DL"],
  //         "attackingLaneAccess": [],
  //         "defensiveResponsibility": ["center"],
  //         "position": "GK",
  //         "baseZone": "GK",
  //         "lateralBand": "center",
  //         "verticalBand": "defensive",
  //       },
  //       ...
  //     ],
  //     "structuralTags": {
  //       "defensive": 0.8,
  //       "possession": 0.5,
  //     }
  //   }
  // }

  Future<TeamLineup> _parseLineup(String lineupJson) async {
    final decoded = Map<String, dynamic>.from(
      jsonDecode(lineupJson) as Map,
    );

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
}
