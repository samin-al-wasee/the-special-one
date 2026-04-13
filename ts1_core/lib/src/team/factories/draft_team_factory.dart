import 'package:ts1_core/src/core/enums/player/player_attributes.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';
// ignore: unused_import
import 'package:ts1_core/src/core/enums/team/tactic/tactical_attributes.dart';
import 'package:ts1_core/src/player/models/player.dart';
import 'package:ts1_core/src/team/factories/formation_factory.dart';
import 'package:ts1_core/src/team/factories/tactical_preset_factory.dart';
import 'package:ts1_core/src/team/models/lineup/formation/slot/formation_slot.dart';
import 'package:ts1_core/src/team/models/lineup/team_lineup.dart';
import 'package:ts1_core/src/team/models/team.dart';

class DraftTeamFactory {
  const DraftTeamFactory._();

  static Team buildTeam({
    required int id,
    required String name,
    required String formationCode,
    required TacticalPreset preset,
    int benchCount = 7,
    int reserveCount = 4,
  }) {
    final formation = FormationFactory.byCode(formationCode);
    final starters = _buildPlayersForFormation(
      teamId: id,
      teamName: name,
      formation: formation.slotDefinitions,
    );
    final bench = _buildBenchPlayers(
      teamId: id,
      teamName: name,
      startIndex: starters.length,
      count: benchCount,
    );
    final reserves = _buildBenchPlayers(
      teamId: id,
      teamName: name,
      startIndex: starters.length + bench.length,
      count: reserveCount,
    );
    final captain = starters.firstWhere(
      (player) => player.position == Position.centralMidfielder,
      orElse: () => starters.first,
    );

    final lineup = TeamLineup.fromPlayers(
      formation: formation,
      players: starters,
      bench: bench,
      reserves: reserves,
      captain: captain,
    );

    return Team(
      id: id,
      name: name,
      tactic: TacticalPresetFactory.create(preset, id: id),
      lineup: lineup,
      squad: [...starters, ...bench, ...reserves],
    );
  }

  static List<Player> _buildPlayersForFormation({
    required int teamId,
    required String teamName,
    required List<FormationSlot> formation,
  }) {
    final players = <Player>[];

    for (var index = 0; index < formation.length; index++) {
      final slot = formation[index];
      final position = slot.preferredPositions.isNotEmpty
          ? slot.preferredPositions.first
          : Position.centralMidfielder;
      players.add(
        _buildPlayer(
          teamId: teamId,
          teamName: teamName,
          index: index,
          position: position,
          slotLabel: slot.slotId,
          isStarter: true,
        ),
      );
    }

    return players;
  }

  static List<Player> _buildBenchPlayers({
    required int teamId,
    required String teamName,
    required int startIndex,
    required int count,
  }) {
    const positions = <Position>[
      Position.goalKeeper,
      Position.centerBack,
      Position.leftBack,
      Position.rightBack,
      Position.defensiveMidfielder,
      Position.centralMidfielder,
      Position.attackingMidfielder,
      Position.leftWinger,
      Position.rightWinger,
      Position.striker,
    ];

    final players = <Player>[];
    for (var index = 0; index < count; index++) {
      final position = positions[(startIndex + index) % positions.length];
      players.add(
        _buildPlayer(
          teamId: teamId,
          teamName: teamName,
          index: startIndex + index,
          position: position,
          slotLabel: 'Bench ${index + 1}',
          isStarter: false,
        ),
      );
    }

    return players;
  }

  static Player _buildPlayer({
    required int teamId,
    required String teamName,
    required int index,
    required Position position,
    required String slotLabel,
    required bool isStarter,
  }) {
    return Player(
      id: (teamId * 1000) + index + 1,
      name: '$teamName ${isStarter ? 'P' : 'S'}${index + 1} $slotLabel',
      dateOfBirth: DateTime(
        1993 + (index % 9),
        (index % 12) + 1,
        (index % 28) + 1,
      ),
      heightCm: _heightFor(position),
      weightKg: _weightFor(position),
      position: position,
      footedness: _footednessFor(index, position),
      technical: _technicalFor(position),
      mental: _mentalFor(position),
      physical: _physicalFor(position),
    );
  }

  static Footedness _footednessFor(int index, Position position) {
    switch (position) {
      case Position.leftBack:
      case Position.leftWinger:
        return Footedness.left;
      case Position.rightBack:
      case Position.rightWinger:
        return Footedness.right;
      case Position.centerBack:
      case Position.goalKeeper:
      case Position.defensiveMidfielder:
      case Position.centralMidfielder:
      case Position.attackingMidfielder:
      case Position.striker:
        return index.isEven ? Footedness.right : Footedness.left;
    }
  }

  static double _heightFor(Position position) {
    switch (position) {
      case Position.goalKeeper:
        return 192;
      case Position.centerBack:
        return 188;
      case Position.striker:
        return 184;
      case Position.defensiveMidfielder:
        return 182;
      case Position.centralMidfielder:
      case Position.attackingMidfielder:
        return 179;
      case Position.rightBack:
      case Position.leftBack:
        return 178;
      case Position.rightWinger:
      case Position.leftWinger:
        return 176;
    }
  }

  static double _weightFor(Position position) {
    switch (position) {
      case Position.goalKeeper:
        return 86;
      case Position.centerBack:
        return 82;
      case Position.striker:
        return 79;
      case Position.defensiveMidfielder:
        return 78;
      case Position.centralMidfielder:
      case Position.attackingMidfielder:
        return 75;
      case Position.rightBack:
      case Position.leftBack:
        return 74;
      case Position.rightWinger:
      case Position.leftWinger:
        return 71;
    }
  }

  static Map<TechnicalAttr, int> _technicalFor(Position position) {
    switch (position) {
      case Position.goalKeeper:
        return const {
          TechnicalAttr.firstTouch: 68,
          TechnicalAttr.passing: 70,
          TechnicalAttr.technique: 69,
        };
      case Position.centerBack:
        return const {
          TechnicalAttr.passing: 72,
          TechnicalAttr.heading: 80,
          TechnicalAttr.tackling: 81,
        };
      case Position.rightBack:
      case Position.leftBack:
        return const {
          TechnicalAttr.passing: 74,
          TechnicalAttr.crossing: 76,
          TechnicalAttr.tackling: 77,
        };
      case Position.defensiveMidfielder:
        return const {
          TechnicalAttr.passing: 78,
          TechnicalAttr.tackling: 78,
          TechnicalAttr.firstTouch: 76,
        };
      case Position.centralMidfielder:
        return const {
          TechnicalAttr.passing: 81,
          TechnicalAttr.firstTouch: 79,
          TechnicalAttr.technique: 78,
        };
      case Position.attackingMidfielder:
        return const {
          TechnicalAttr.passing: 82,
          TechnicalAttr.dribbling: 80,
          TechnicalAttr.technique: 80,
        };
      case Position.rightWinger:
      case Position.leftWinger:
        return const {
          TechnicalAttr.dribbling: 82,
          TechnicalAttr.crossing: 79,
          TechnicalAttr.firstTouch: 80,
        };
      case Position.striker:
        return const {
          TechnicalAttr.finishing: 83,
          TechnicalAttr.firstTouch: 80,
          TechnicalAttr.heading: 77,
        };
    }
  }

  static Map<MentalAttr, int> _mentalFor(Position position) {
    switch (position) {
      case Position.goalKeeper:
        return const {MentalAttr.decisions: 77, MentalAttr.composure: 76};
      case Position.centerBack:
        return const {MentalAttr.positioning: 80, MentalAttr.decisions: 78};
      case Position.rightBack:
      case Position.leftBack:
        return const {MentalAttr.workRate: 79, MentalAttr.decisions: 75};
      case Position.defensiveMidfielder:
        return const {MentalAttr.anticipation: 79, MentalAttr.decisions: 79};
      case Position.centralMidfielder:
        return const {MentalAttr.vision: 80, MentalAttr.decisions: 79};
      case Position.attackingMidfielder:
        return const {MentalAttr.vision: 82, MentalAttr.creativity: 79};
      case Position.rightWinger:
      case Position.leftWinger:
        return const {MentalAttr.creativity: 81, MentalAttr.offBall: 79};
      case Position.striker:
        return const {MentalAttr.composure: 81, MentalAttr.offBall: 82};
    }
  }

  static Map<PhysicalAttr, int> _physicalFor(Position position) {
    switch (position) {
      case Position.goalKeeper:
        return const {PhysicalAttr.jumping: 82, PhysicalAttr.strength: 80};
      case Position.centerBack:
        return const {PhysicalAttr.strength: 82, PhysicalAttr.jumping: 81};
      case Position.rightBack:
      case Position.leftBack:
        return const {PhysicalAttr.pace: 78, PhysicalAttr.stamina: 80};
      case Position.defensiveMidfielder:
        return const {PhysicalAttr.stamina: 80, PhysicalAttr.strength: 77};
      case Position.centralMidfielder:
        return const {PhysicalAttr.stamina: 81, PhysicalAttr.balance: 77};
      case Position.attackingMidfielder:
        return const {PhysicalAttr.agility: 80, PhysicalAttr.balance: 79};
      case Position.rightWinger:
      case Position.leftWinger:
        return const {PhysicalAttr.pace: 84, PhysicalAttr.agility: 83};
      case Position.striker:
        return const {PhysicalAttr.pace: 81, PhysicalAttr.strength: 80};
    }
  }
}
