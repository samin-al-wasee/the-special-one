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
    final allStarRoster = _allStarRosterFor(name);

    final starters = allStarRoster != null
        ? _buildPlayersForFormationFromRoster(
            teamId: id,
            formation: formation.slotDefinitions,
            roster: allStarRoster,
          )
        : _buildPlayersForFormation(
            teamId: id,
            teamName: name,
            formation: formation.slotDefinitions,
          );

    final usedStarterNames = starters.map((player) => player.name).toSet();

    final bench = allStarRoster != null
        ? _buildBenchFromRoster(
            teamId: id,
            roster: allStarRoster,
            usedNames: usedStarterNames,
            startIndex: starters.length,
            count: benchCount,
          )
        : _buildBenchPlayers(
            teamId: id,
            teamName: name,
            startIndex: starters.length,
            count: benchCount,
          );

    final usedBenchNames = {...usedStarterNames, ...bench.map((p) => p.name)};

    final reserves = allStarRoster != null
        ? _buildBenchFromRoster(
            teamId: id,
            roster: allStarRoster,
            usedNames: usedBenchNames,
            startIndex: starters.length + bench.length,
            count: reserveCount,
          )
        : _buildBenchPlayers(
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

  static List<_PlayerSeed>? _allStarRosterFor(String teamName) {
    final lowered = teamName.toLowerCase();
    if (lowered.contains('south american')) {
      return _southAmericanAllStars;
    }
    if (lowered.contains('european')) {
      return _europeanAllStars;
    }
    return null;
  }

  static List<Player> _buildPlayersForFormationFromRoster({
    required int teamId,
    required List<FormationSlot> formation,
    required List<_PlayerSeed> roster,
  }) {
    final available = List<_PlayerSeed>.from(roster);
    final players = <Player>[];

    for (var index = 0; index < formation.length; index++) {
      final slot = formation[index];
      final preferred = slot.preferredPositions.isNotEmpty
          ? slot.preferredPositions
          : const [Position.centralMidfielder];

      var chosen = _takeFirstMatching(available, preferred);
      chosen ??= _takeFirstMatching(available, _fallbacksFor(preferred.first));
      chosen ??= available.isNotEmpty ? available.removeAt(0) : null;

      if (chosen == null) {
        break;
      }

      players.add(
        _buildPlayerFromSeed(
          teamId: teamId,
          index: index,
          seed: chosen,
          slotLabel: slot.slotId,
          isStarter: true,
        ),
      );
    }

    return players;
  }

  static List<Player> _buildBenchFromRoster({
    required int teamId,
    required List<_PlayerSeed> roster,
    required Set<String> usedNames,
    required int startIndex,
    required int count,
  }) {
    final pool = roster.where((seed) => !usedNames.contains(seed.name)).toList();
    final players = <Player>[];

    for (var i = 0; i < count; i++) {
      if (pool.isEmpty) {
        break;
      }
      final seed = pool.removeAt(0);
      players.add(
        _buildPlayerFromSeed(
          teamId: teamId,
          index: startIndex + i,
          seed: seed,
          slotLabel: 'Bench ${i + 1}',
          isStarter: false,
        ),
      );
    }

    return players;
  }

  static _PlayerSeed? _takeFirstMatching(
    List<_PlayerSeed> available,
    List<Position> positions,
  ) {
    final index = available.indexWhere((seed) => positions.contains(seed.position));
    if (index < 0) {
      return null;
    }
    return available.removeAt(index);
  }

  static List<Position> _fallbacksFor(Position position) {
    switch (position) {
      case Position.goalKeeper:
        return const [Position.goalKeeper];
      case Position.centerBack:
        return const [
          Position.centerBack,
          Position.defensiveMidfielder,
          Position.leftBack,
          Position.rightBack,
        ];
      case Position.leftBack:
        return const [Position.leftBack, Position.leftMidfielder, Position.centerBack];
      case Position.rightBack:
        return const [
          Position.rightBack,
          Position.rightMidfielder,
          Position.centerBack,
        ];
      case Position.defensiveMidfielder:
        return const [Position.defensiveMidfielder, Position.centralMidfielder];
      case Position.centralMidfielder:
        return const [
          Position.centralMidfielder,
          Position.attackingMidfielder,
          Position.defensiveMidfielder,
        ];
      case Position.rightMidfielder:
        return const [Position.rightMidfielder, Position.rightWinger, Position.centralMidfielder];
      case Position.leftMidfielder:
        return const [Position.leftMidfielder, Position.leftWinger, Position.centralMidfielder];
      case Position.attackingMidfielder:
        return const [
          Position.attackingMidfielder,
          Position.centralMidfielder,
          Position.striker,
        ];
      case Position.rightWinger:
        return const [Position.rightWinger, Position.rightMidfielder, Position.striker];
      case Position.leftWinger:
        return const [Position.leftWinger, Position.leftMidfielder, Position.striker];
      case Position.striker:
        return const [Position.striker, Position.attackingMidfielder];
    }
  }

  static Player _buildPlayerFromSeed({
    required int teamId,
    required int index,
    required _PlayerSeed seed,
    required String slotLabel,
    required bool isStarter,
  }) {
    return Player(
      id: (teamId * 1000) + index + 1,
      name: seed.name,
      dateOfBirth: seed.dateOfBirth,
      country: seed.country,
      heightCm: seed.heightCm,
      weightKg: seed.weightKg,
      position: seed.position,
      footedness: seed.footedness,
      technical: _technicalForSeed(seed),
      mental: _mentalForSeed(seed),
      physical: _physicalForSeed(seed),
    );
  }

  static Map<TechnicalAttr, int> _technicalForSeed(_PlayerSeed seed) {
    final values = <TechnicalAttr, int>{..._technicalFor(seed.position)};
    final overrides = _technicalOverridesByPlayer[seed.name];
    if (overrides != null) {
      values.addAll(overrides);
    }
    return values;
  }

  static Map<MentalAttr, int> _mentalForSeed(_PlayerSeed seed) {
    final values = <MentalAttr, int>{..._mentalFor(seed.position)};
    final overrides = _mentalOverridesByPlayer[seed.name];
    if (overrides != null) {
      values.addAll(overrides);
    }
    return values;
  }

  static Map<PhysicalAttr, int> _physicalForSeed(_PlayerSeed seed) {
    final values = <PhysicalAttr, int>{..._physicalFor(seed.position)};
    final overrides = _physicalOverridesByPlayer[seed.name];
    if (overrides != null) {
      values.addAll(overrides);
    }
    return values;
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
      Position.leftMidfielder,
      Position.rightMidfielder,
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
      country: "Brazil",
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
      case Position.rightMidfielder:
      case Position.leftBack:
      case Position.leftWinger:
        return Footedness.left;
      case Position.leftMidfielder:
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
      case Position.rightMidfielder:
      case Position.leftMidfielder:
        return 178;
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
      case Position.rightMidfielder:
      case Position.leftMidfielder:
        return 73;
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
      case Position.rightMidfielder:
      case Position.leftMidfielder:
        return const {
          TechnicalAttr.passing: 79,
          TechnicalAttr.crossing: 78,
          TechnicalAttr.dribbling: 77,
          TechnicalAttr.firstTouch: 79,
        };
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
      case Position.rightMidfielder:
      case Position.leftMidfielder:
        return const {
          MentalAttr.decisions: 78,
          MentalAttr.vision: 79,
          MentalAttr.workRate: 80,
          MentalAttr.positioning: 77,
        };
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
      case Position.rightMidfielder:
      case Position.leftMidfielder:
        return const {
          PhysicalAttr.pace: 80,
          PhysicalAttr.acceleration: 79,
          PhysicalAttr.stamina: 81,
          PhysicalAttr.balance: 77,
        };
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

  static const Map<String, Map<TechnicalAttr, int>> _technicalOverridesByPlayer = {
    'Lionel Messi': {TechnicalAttr.dribbling: 95, TechnicalAttr.passing: 93, TechnicalAttr.finishing: 90, TechnicalAttr.firstTouch: 94},
    'Neymar': {TechnicalAttr.dribbling: 93, TechnicalAttr.technique: 92, TechnicalAttr.crossing: 85, TechnicalAttr.finishing: 86},
    'Ronaldinho': {TechnicalAttr.dribbling: 95, TechnicalAttr.technique: 96, TechnicalAttr.passing: 90, TechnicalAttr.finishing: 84},
    'Garrincha': {TechnicalAttr.dribbling: 94, TechnicalAttr.crossing: 88, TechnicalAttr.technique: 91, TechnicalAttr.firstTouch: 89},
    'Pele': {TechnicalAttr.finishing: 95, TechnicalAttr.dribbling: 90, TechnicalAttr.heading: 88, TechnicalAttr.technique: 92},
    'Ronaldo Nazario': {TechnicalAttr.finishing: 94, TechnicalAttr.dribbling: 92, TechnicalAttr.firstTouch: 91, TechnicalAttr.technique: 89},
    'Romario': {TechnicalAttr.finishing: 93, TechnicalAttr.firstTouch: 92, TechnicalAttr.dribbling: 87, TechnicalAttr.technique: 88},
    'Gabriel Batistuta': {TechnicalAttr.finishing: 92, TechnicalAttr.heading: 90, TechnicalAttr.firstTouch: 86, TechnicalAttr.technique: 84},
    'Zico': {TechnicalAttr.passing: 92, TechnicalAttr.technique: 93, TechnicalAttr.dribbling: 89, TechnicalAttr.finishing: 86},
    'Juan Roman Riquelme': {TechnicalAttr.passing: 93, TechnicalAttr.technique: 92, TechnicalAttr.firstTouch: 91, TechnicalAttr.dribbling: 84},
    'Socrates': {TechnicalAttr.passing: 90, TechnicalAttr.technique: 90, TechnicalAttr.firstTouch: 88, TechnicalAttr.finishing: 82},
    'Carlos Valderrama': {TechnicalAttr.passing: 94, TechnicalAttr.technique: 90, TechnicalAttr.firstTouch: 89, TechnicalAttr.dribbling: 82},
    'Fernando Redondo': {TechnicalAttr.passing: 89, TechnicalAttr.technique: 88, TechnicalAttr.tackling: 85, TechnicalAttr.firstTouch: 87},
    'Javier Mascherano': {TechnicalAttr.tackling: 89, TechnicalAttr.passing: 83, TechnicalAttr.marking: 88, TechnicalAttr.firstTouch: 80},
    'Roberto Carlos': {TechnicalAttr.crossing: 90, TechnicalAttr.tackling: 84, TechnicalAttr.dribbling: 82, TechnicalAttr.technique: 87},
    'Cafu': {TechnicalAttr.crossing: 87, TechnicalAttr.tackling: 83, TechnicalAttr.passing: 82, TechnicalAttr.dribbling: 80},
    'Carlos Alberto Torres': {TechnicalAttr.crossing: 86, TechnicalAttr.tackling: 85, TechnicalAttr.passing: 84, TechnicalAttr.firstTouch: 83},
    'Nilton Santos': {TechnicalAttr.tackling: 86, TechnicalAttr.passing: 82, TechnicalAttr.crossing: 81, TechnicalAttr.firstTouch: 82},
    'Daniel Passarella': {TechnicalAttr.tackling: 88, TechnicalAttr.heading: 90, TechnicalAttr.marking: 87, TechnicalAttr.passing: 78},
    'Elias Figueroa': {TechnicalAttr.tackling: 87, TechnicalAttr.heading: 88, TechnicalAttr.marking: 89, TechnicalAttr.passing: 79},
    'Thiago Silva': {TechnicalAttr.tackling: 89, TechnicalAttr.heading: 87, TechnicalAttr.marking: 90, TechnicalAttr.passing: 82},
    'Lucio': {TechnicalAttr.tackling: 86, TechnicalAttr.heading: 88, TechnicalAttr.marking: 85, TechnicalAttr.passing: 80},
    'Dida': {TechnicalAttr.gkReflexes: 90, TechnicalAttr.gkHandling: 86, TechnicalAttr.gkPositioning: 85, TechnicalAttr.gkOneOnOnes: 87},
    'Claudio Taffarel': {TechnicalAttr.gkReflexes: 87, TechnicalAttr.gkHandling: 85, TechnicalAttr.gkPositioning: 86, TechnicalAttr.gkOneOnOnes: 84},
    'Cristiano Ronaldo': {TechnicalAttr.finishing: 93, TechnicalAttr.heading: 90, TechnicalAttr.dribbling: 88, TechnicalAttr.technique: 89},
    'Thierry Henry': {TechnicalAttr.finishing: 91, TechnicalAttr.dribbling: 89, TechnicalAttr.firstTouch: 88, TechnicalAttr.passing: 83},
    'Luis Figo': {TechnicalAttr.crossing: 91, TechnicalAttr.dribbling: 88, TechnicalAttr.technique: 89, TechnicalAttr.passing: 86},
    'George Best': {TechnicalAttr.dribbling: 92, TechnicalAttr.firstTouch: 90, TechnicalAttr.technique: 91, TechnicalAttr.finishing: 86},
    'Marco van Basten': {TechnicalAttr.finishing: 94, TechnicalAttr.firstTouch: 91, TechnicalAttr.heading: 89, TechnicalAttr.technique: 90},
    'Gerd Muller': {TechnicalAttr.finishing: 95, TechnicalAttr.firstTouch: 90, TechnicalAttr.heading: 84, TechnicalAttr.technique: 84},
    'Robert Lewandowski': {TechnicalAttr.finishing: 93, TechnicalAttr.firstTouch: 90, TechnicalAttr.heading: 87, TechnicalAttr.technique: 88},
    'Karim Benzema': {TechnicalAttr.finishing: 90, TechnicalAttr.firstTouch: 92, TechnicalAttr.technique: 90, TechnicalAttr.passing: 86},
    'Zinedine Zidane': {TechnicalAttr.passing: 93, TechnicalAttr.technique: 95, TechnicalAttr.dribbling: 90, TechnicalAttr.firstTouch: 94},
    'Johan Cruyff': {TechnicalAttr.dribbling: 92, TechnicalAttr.passing: 90, TechnicalAttr.finishing: 88, TechnicalAttr.technique: 93},
    'Luka Modric': {TechnicalAttr.passing: 92, TechnicalAttr.technique: 91, TechnicalAttr.firstTouch: 90, TechnicalAttr.dribbling: 86},
    'Andres Iniesta': {TechnicalAttr.dribbling: 91, TechnicalAttr.passing: 91, TechnicalAttr.technique: 93, TechnicalAttr.firstTouch: 92},
    'Claude Makelele': {TechnicalAttr.tackling: 88, TechnicalAttr.marking: 89, TechnicalAttr.passing: 83, TechnicalAttr.firstTouch: 80},
    'Sergio Busquets': {TechnicalAttr.passing: 89, TechnicalAttr.firstTouch: 88, TechnicalAttr.tackling: 84, TechnicalAttr.marking: 85},
    'Paolo Maldini': {TechnicalAttr.tackling: 92, TechnicalAttr.marking: 93, TechnicalAttr.heading: 86, TechnicalAttr.passing: 82},
    'Ashley Cole': {TechnicalAttr.tackling: 87, TechnicalAttr.marking: 86, TechnicalAttr.crossing: 80, TechnicalAttr.passing: 79},
    'Philipp Lahm': {TechnicalAttr.passing: 88, TechnicalAttr.tackling: 85, TechnicalAttr.firstTouch: 87, TechnicalAttr.crossing: 82},
    'Dani Carvajal': {TechnicalAttr.crossing: 84, TechnicalAttr.tackling: 84, TechnicalAttr.passing: 81, TechnicalAttr.firstTouch: 81},
    'Franz Beckenbauer': {TechnicalAttr.passing: 90, TechnicalAttr.tackling: 87, TechnicalAttr.technique: 88, TechnicalAttr.marking: 86},
    'Franco Baresi': {TechnicalAttr.tackling: 91, TechnicalAttr.marking: 93, TechnicalAttr.passing: 84, TechnicalAttr.heading: 83},
    'Sergio Ramos': {TechnicalAttr.tackling: 88, TechnicalAttr.heading: 91, TechnicalAttr.marking: 85, TechnicalAttr.passing: 80},
    'Fabio Cannavaro': {TechnicalAttr.tackling: 90, TechnicalAttr.marking: 91, TechnicalAttr.heading: 86, TechnicalAttr.passing: 78},
    'Gianluigi Buffon': {TechnicalAttr.gkReflexes: 92, TechnicalAttr.gkHandling: 90, TechnicalAttr.gkPositioning: 91, TechnicalAttr.gkOneOnOnes: 89},
    'Manuel Neuer': {TechnicalAttr.gkReflexes: 91, TechnicalAttr.gkHandling: 89, TechnicalAttr.gkPositioning: 90, TechnicalAttr.gkKicking: 90},
  };

  static const Map<String, Map<MentalAttr, int>> _mentalOverridesByPlayer = {
    'Lionel Messi': {MentalAttr.decisions: 94, MentalAttr.vision: 94, MentalAttr.offBall: 93, MentalAttr.composure: 92},
    'Neymar': {MentalAttr.creativity: 92, MentalAttr.offBall: 88, MentalAttr.decisions: 86, MentalAttr.composure: 85},
    'Ronaldinho': {MentalAttr.creativity: 95, MentalAttr.vision: 90, MentalAttr.offBall: 88, MentalAttr.decisions: 84},
    'Garrincha': {MentalAttr.creativity: 90, MentalAttr.offBall: 87, MentalAttr.decisions: 82, MentalAttr.workRate: 76},
    'Pele': {MentalAttr.composure: 94, MentalAttr.offBall: 94, MentalAttr.decisions: 91, MentalAttr.creativity: 89},
    'Ronaldo Nazario': {MentalAttr.composure: 91, MentalAttr.offBall: 92, MentalAttr.decisions: 88, MentalAttr.anticipation: 89},
    'Romario': {MentalAttr.composure: 92, MentalAttr.offBall: 93, MentalAttr.decisions: 87, MentalAttr.anticipation: 90},
    'Gabriel Batistuta': {MentalAttr.composure: 89, MentalAttr.offBall: 90, MentalAttr.decisions: 86, MentalAttr.workRate: 82},
    'Zico': {MentalAttr.vision: 92, MentalAttr.decisions: 90, MentalAttr.creativity: 91, MentalAttr.composure: 88},
    'Juan Roman Riquelme': {MentalAttr.vision: 94, MentalAttr.decisions: 91, MentalAttr.composure: 89, MentalAttr.workRate: 74},
    'Socrates': {MentalAttr.vision: 90, MentalAttr.decisions: 90, MentalAttr.composure: 88, MentalAttr.creativity: 89},
    'Carlos Valderrama': {MentalAttr.vision: 95, MentalAttr.decisions: 90, MentalAttr.creativity: 92, MentalAttr.workRate: 76},
    'Fernando Redondo': {MentalAttr.decisions: 90, MentalAttr.positioning: 89, MentalAttr.composure: 90, MentalAttr.anticipation: 88},
    'Javier Mascherano': {MentalAttr.positioning: 90, MentalAttr.workRate: 91, MentalAttr.decisions: 86, MentalAttr.anticipation: 89},
    'Roberto Carlos': {MentalAttr.workRate: 88, MentalAttr.decisions: 82, MentalAttr.offBall: 83, MentalAttr.positioning: 78},
    'Cafu': {MentalAttr.workRate: 90, MentalAttr.decisions: 85, MentalAttr.offBall: 84, MentalAttr.positioning: 82},
    'Carlos Alberto Torres': {MentalAttr.decisions: 88, MentalAttr.positioning: 86, MentalAttr.workRate: 84, MentalAttr.vision: 80},
    'Nilton Santos': {MentalAttr.positioning: 87, MentalAttr.decisions: 85, MentalAttr.workRate: 84, MentalAttr.anticipation: 86},
    'Daniel Passarella': {MentalAttr.positioning: 89, MentalAttr.decisions: 87, MentalAttr.anticipation: 88, MentalAttr.workRate: 83},
    'Elias Figueroa': {MentalAttr.positioning: 91, MentalAttr.decisions: 88, MentalAttr.anticipation: 89, MentalAttr.composure: 86},
    'Thiago Silva': {MentalAttr.positioning: 90, MentalAttr.decisions: 88, MentalAttr.anticipation: 89, MentalAttr.composure: 87},
    'Lucio': {MentalAttr.positioning: 85, MentalAttr.decisions: 82, MentalAttr.anticipation: 84, MentalAttr.workRate: 86},
    'Dida': {MentalAttr.decisions: 84, MentalAttr.composure: 85, MentalAttr.positioning: 84, MentalAttr.anticipation: 83},
    'Claudio Taffarel': {MentalAttr.decisions: 85, MentalAttr.composure: 84, MentalAttr.positioning: 85, MentalAttr.anticipation: 84},
    'Cristiano Ronaldo': {MentalAttr.offBall: 93, MentalAttr.composure: 91, MentalAttr.decisions: 89, MentalAttr.workRate: 86},
    'Thierry Henry': {MentalAttr.offBall: 91, MentalAttr.composure: 88, MentalAttr.decisions: 87, MentalAttr.anticipation: 89},
    'Luis Figo': {MentalAttr.creativity: 90, MentalAttr.decisions: 88, MentalAttr.vision: 87, MentalAttr.offBall: 85},
    'George Best': {MentalAttr.creativity: 92, MentalAttr.decisions: 85, MentalAttr.offBall: 88, MentalAttr.composure: 86},
    'Marco van Basten': {MentalAttr.composure: 91, MentalAttr.offBall: 92, MentalAttr.decisions: 88, MentalAttr.anticipation: 90},
    'Gerd Muller': {MentalAttr.offBall: 94, MentalAttr.composure: 92, MentalAttr.decisions: 88, MentalAttr.anticipation: 93},
    'Robert Lewandowski': {MentalAttr.composure: 92, MentalAttr.offBall: 91, MentalAttr.decisions: 90, MentalAttr.workRate: 86},
    'Karim Benzema': {MentalAttr.composure: 90, MentalAttr.offBall: 89, MentalAttr.decisions: 90, MentalAttr.vision: 86},
    'Zinedine Zidane': {MentalAttr.vision: 93, MentalAttr.decisions: 91, MentalAttr.composure: 92, MentalAttr.creativity: 94},
    'Johan Cruyff': {MentalAttr.vision: 92, MentalAttr.decisions: 91, MentalAttr.offBall: 92, MentalAttr.creativity: 93},
    'Luka Modric': {MentalAttr.vision: 92, MentalAttr.decisions: 91, MentalAttr.workRate: 89, MentalAttr.composure: 90},
    'Andres Iniesta': {MentalAttr.vision: 91, MentalAttr.decisions: 91, MentalAttr.composure: 90, MentalAttr.creativity: 92},
    'Claude Makelele': {MentalAttr.positioning: 92, MentalAttr.anticipation: 90, MentalAttr.workRate: 91, MentalAttr.decisions: 87},
    'Sergio Busquets': {MentalAttr.positioning: 91, MentalAttr.decisions: 90, MentalAttr.vision: 88, MentalAttr.composure: 90},
    'Paolo Maldini': {MentalAttr.positioning: 94, MentalAttr.decisions: 92, MentalAttr.anticipation: 92, MentalAttr.composure: 90},
    'Ashley Cole': {MentalAttr.positioning: 86, MentalAttr.decisions: 84, MentalAttr.workRate: 88, MentalAttr.anticipation: 85},
    'Philipp Lahm': {MentalAttr.decisions: 91, MentalAttr.positioning: 90, MentalAttr.workRate: 89, MentalAttr.composure: 89},
    'Dani Carvajal': {MentalAttr.workRate: 87, MentalAttr.decisions: 84, MentalAttr.positioning: 83, MentalAttr.anticipation: 84},
    'Franz Beckenbauer': {MentalAttr.decisions: 92, MentalAttr.positioning: 91, MentalAttr.vision: 88, MentalAttr.composure: 91},
    'Franco Baresi': {MentalAttr.positioning: 93, MentalAttr.decisions: 91, MentalAttr.anticipation: 92, MentalAttr.composure: 90},
    'Sergio Ramos': {MentalAttr.positioning: 86, MentalAttr.decisions: 82, MentalAttr.anticipation: 85, MentalAttr.workRate: 88},
    'Fabio Cannavaro': {MentalAttr.positioning: 91, MentalAttr.anticipation: 91, MentalAttr.decisions: 88, MentalAttr.composure: 87},
    'Gianluigi Buffon': {MentalAttr.decisions: 90, MentalAttr.composure: 91, MentalAttr.positioning: 90, MentalAttr.anticipation: 89},
    'Manuel Neuer': {MentalAttr.decisions: 91, MentalAttr.composure: 90, MentalAttr.positioning: 91, MentalAttr.anticipation: 90},
  };

  static const Map<String, Map<PhysicalAttr, int>> _physicalOverridesByPlayer = {
    'Lionel Messi': {PhysicalAttr.pace: 86, PhysicalAttr.acceleration: 91, PhysicalAttr.agility: 94, PhysicalAttr.balance: 95},
    'Neymar': {PhysicalAttr.pace: 89, PhysicalAttr.acceleration: 90, PhysicalAttr.agility: 93, PhysicalAttr.balance: 88},
    'Ronaldinho': {PhysicalAttr.pace: 83, PhysicalAttr.acceleration: 84, PhysicalAttr.agility: 90, PhysicalAttr.balance: 87},
    'Garrincha': {PhysicalAttr.pace: 90, PhysicalAttr.acceleration: 92, PhysicalAttr.agility: 94, PhysicalAttr.balance: 89},
    'Pele': {PhysicalAttr.pace: 90, PhysicalAttr.acceleration: 90, PhysicalAttr.jumping: 91, PhysicalAttr.balance: 88},
    'Ronaldo Nazario': {PhysicalAttr.pace: 92, PhysicalAttr.acceleration: 94, PhysicalAttr.strength: 86, PhysicalAttr.balance: 87},
    'Romario': {PhysicalAttr.pace: 86, PhysicalAttr.acceleration: 89, PhysicalAttr.agility: 90, PhysicalAttr.balance: 88},
    'Gabriel Batistuta': {PhysicalAttr.pace: 80, PhysicalAttr.strength: 88, PhysicalAttr.jumping: 85, PhysicalAttr.balance: 82},
    'Zico': {PhysicalAttr.agility: 84, PhysicalAttr.balance: 84, PhysicalAttr.stamina: 82, PhysicalAttr.pace: 78},
    'Juan Roman Riquelme': {PhysicalAttr.pace: 66, PhysicalAttr.acceleration: 67, PhysicalAttr.balance: 82, PhysicalAttr.stamina: 74},
    'Socrates': {PhysicalAttr.strength: 84, PhysicalAttr.stamina: 84, PhysicalAttr.balance: 81, PhysicalAttr.agility: 76},
    'Carlos Valderrama': {PhysicalAttr.pace: 68, PhysicalAttr.acceleration: 69, PhysicalAttr.balance: 82, PhysicalAttr.stamina: 77},
    'Fernando Redondo': {PhysicalAttr.strength: 84, PhysicalAttr.stamina: 83, PhysicalAttr.balance: 83, PhysicalAttr.agility: 78},
    'Javier Mascherano': {PhysicalAttr.stamina: 88, PhysicalAttr.strength: 82, PhysicalAttr.balance: 83, PhysicalAttr.pace: 74},
    'Roberto Carlos': {PhysicalAttr.pace: 94, PhysicalAttr.acceleration: 93, PhysicalAttr.stamina: 90, PhysicalAttr.strength: 83},
    'Cafu': {PhysicalAttr.pace: 89, PhysicalAttr.acceleration: 88, PhysicalAttr.stamina: 93, PhysicalAttr.agility: 84},
    'Carlos Alberto Torres': {PhysicalAttr.pace: 84, PhysicalAttr.acceleration: 82, PhysicalAttr.stamina: 85, PhysicalAttr.strength: 80},
    'Nilton Santos': {PhysicalAttr.pace: 80, PhysicalAttr.acceleration: 78, PhysicalAttr.stamina: 84, PhysicalAttr.balance: 81},
    'Daniel Passarella': {PhysicalAttr.strength: 86, PhysicalAttr.jumping: 88, PhysicalAttr.balance: 79, PhysicalAttr.pace: 74},
    'Elias Figueroa': {PhysicalAttr.strength: 85, PhysicalAttr.jumping: 86, PhysicalAttr.balance: 81, PhysicalAttr.pace: 73},
    'Thiago Silva': {PhysicalAttr.pace: 80, PhysicalAttr.acceleration: 80, PhysicalAttr.strength: 83, PhysicalAttr.jumping: 84},
    'Lucio': {PhysicalAttr.pace: 82, PhysicalAttr.acceleration: 80, PhysicalAttr.strength: 87, PhysicalAttr.jumping: 86},
    'Dida': {PhysicalAttr.jumping: 88, PhysicalAttr.strength: 84, PhysicalAttr.agility: 80, PhysicalAttr.balance: 78},
    'Claudio Taffarel': {PhysicalAttr.jumping: 85, PhysicalAttr.strength: 80, PhysicalAttr.agility: 82, PhysicalAttr.balance: 79},
    'Cristiano Ronaldo': {PhysicalAttr.pace: 90, PhysicalAttr.acceleration: 89, PhysicalAttr.jumping: 96, PhysicalAttr.strength: 90},
    'Thierry Henry': {PhysicalAttr.pace: 92, PhysicalAttr.acceleration: 91, PhysicalAttr.agility: 88, PhysicalAttr.balance: 84},
    'Luis Figo': {PhysicalAttr.pace: 84, PhysicalAttr.acceleration: 83, PhysicalAttr.stamina: 85, PhysicalAttr.balance: 84},
    'George Best': {PhysicalAttr.pace: 87, PhysicalAttr.acceleration: 89, PhysicalAttr.agility: 92, PhysicalAttr.balance: 86},
    'Marco van Basten': {PhysicalAttr.pace: 84, PhysicalAttr.acceleration: 83, PhysicalAttr.strength: 84, PhysicalAttr.jumping: 86},
    'Gerd Muller': {PhysicalAttr.pace: 78, PhysicalAttr.acceleration: 83, PhysicalAttr.balance: 88, PhysicalAttr.strength: 82},
    'Robert Lewandowski': {PhysicalAttr.pace: 82, PhysicalAttr.acceleration: 80, PhysicalAttr.strength: 88, PhysicalAttr.jumping: 87},
    'Karim Benzema': {PhysicalAttr.pace: 80, PhysicalAttr.acceleration: 79, PhysicalAttr.strength: 84, PhysicalAttr.balance: 84},
    'Zinedine Zidane': {PhysicalAttr.balance: 87, PhysicalAttr.agility: 84, PhysicalAttr.strength: 82, PhysicalAttr.stamina: 83},
    'Johan Cruyff': {PhysicalAttr.pace: 88, PhysicalAttr.acceleration: 87, PhysicalAttr.agility: 90, PhysicalAttr.stamina: 86},
    'Luka Modric': {PhysicalAttr.stamina: 90, PhysicalAttr.agility: 87, PhysicalAttr.balance: 85, PhysicalAttr.pace: 78},
    'Andres Iniesta': {PhysicalAttr.agility: 90, PhysicalAttr.balance: 90, PhysicalAttr.acceleration: 84, PhysicalAttr.stamina: 82},
    'Claude Makelele': {PhysicalAttr.stamina: 90, PhysicalAttr.strength: 80, PhysicalAttr.balance: 84, PhysicalAttr.pace: 79},
    'Sergio Busquets': {PhysicalAttr.stamina: 84, PhysicalAttr.strength: 80, PhysicalAttr.balance: 82, PhysicalAttr.pace: 67},
    'Paolo Maldini': {PhysicalAttr.pace: 85, PhysicalAttr.acceleration: 83, PhysicalAttr.stamina: 88, PhysicalAttr.strength: 84},
    'Ashley Cole': {PhysicalAttr.pace: 87, PhysicalAttr.acceleration: 86, PhysicalAttr.stamina: 89, PhysicalAttr.balance: 83},
    'Philipp Lahm': {PhysicalAttr.pace: 84, PhysicalAttr.acceleration: 84, PhysicalAttr.stamina: 88, PhysicalAttr.balance: 86},
    'Dani Carvajal': {PhysicalAttr.pace: 83, PhysicalAttr.acceleration: 84, PhysicalAttr.stamina: 87, PhysicalAttr.balance: 82},
    'Franz Beckenbauer': {PhysicalAttr.pace: 82, PhysicalAttr.acceleration: 80, PhysicalAttr.strength: 84, PhysicalAttr.balance: 83},
    'Franco Baresi': {PhysicalAttr.pace: 80, PhysicalAttr.acceleration: 79, PhysicalAttr.strength: 80, PhysicalAttr.balance: 84},
    'Sergio Ramos': {PhysicalAttr.pace: 80, PhysicalAttr.acceleration: 79, PhysicalAttr.strength: 87, PhysicalAttr.jumping: 90},
    'Fabio Cannavaro': {PhysicalAttr.pace: 79, PhysicalAttr.acceleration: 80, PhysicalAttr.jumping: 92, PhysicalAttr.balance: 86},
    'Gianluigi Buffon': {PhysicalAttr.jumping: 89, PhysicalAttr.strength: 84, PhysicalAttr.agility: 82, PhysicalAttr.balance: 80},
    'Manuel Neuer': {PhysicalAttr.jumping: 88, PhysicalAttr.strength: 86, PhysicalAttr.agility: 84, PhysicalAttr.balance: 81},
  };

  static final List<_PlayerSeed> _southAmericanAllStars = [
    _PlayerSeed('Dida', Position.goalKeeper, Footedness.right, DateTime(1973, 10, 7), "Brazil", 195, 85),
    _PlayerSeed('Claudio Taffarel', Position.goalKeeper, Footedness.right, DateTime(1966, 5, 8), "Brazil", 181, 79),
    _PlayerSeed('Carlos Alberto Torres', Position.rightBack, Footedness.right, DateTime(1944, 7, 17), "Brazil", 180, 75),
    _PlayerSeed('Cafu', Position.rightBack, Footedness.right, DateTime(1970, 6, 7), "Brazil", 176, 73),
    _PlayerSeed('Roberto Carlos', Position.leftBack, Footedness.left, DateTime(1973, 4, 10), "Brazil", 168, 70),
    _PlayerSeed('Nilton Santos', Position.leftBack, Footedness.left, DateTime(1925, 5, 16), "Brazil", 181, 74),
    _PlayerSeed('Daniel Passarella', Position.centerBack, Footedness.right, DateTime(1953, 5, 25), "Italy", 174, 73),
    _PlayerSeed('Elias Figueroa', Position.centerBack, Footedness.right, DateTime(1946, 10, 25), "Chile", 182, 78),
    _PlayerSeed('Thiago Silva', Position.centerBack, Footedness.right, DateTime(1984, 9, 22), "Brazil", 183, 79),
    _PlayerSeed('Lucio', Position.centerBack, Footedness.right, DateTime(1978, 5, 8), "Brazil", 188, 84),
    _PlayerSeed('Javier Mascherano', Position.defensiveMidfielder, Footedness.right, DateTime(1984, 6, 8), "Argentina", 174, 73),
    _PlayerSeed('Fernando Redondo', Position.defensiveMidfielder, Footedness.left, DateTime(1969, 6, 6), "Colombia", 186, 80),
    _PlayerSeed('Socrates', Position.centralMidfielder, Footedness.right, DateTime(1954, 2, 19), "Brazil", 192, 84),
    _PlayerSeed('Carlos Valderrama', Position.centralMidfielder, Footedness.right, DateTime(1961, 9, 2), "Colombia", 175, 74),
    _PlayerSeed('Zico', Position.attackingMidfielder, Footedness.right, DateTime(1953, 3, 3), "Brazil", 172, 70),
    _PlayerSeed('Juan Roman Riquelme', Position.attackingMidfielder, Footedness.right, DateTime(1978, 6, 24), "Argentina", 182, 78),
    _PlayerSeed('Lionel Messi', Position.rightWinger, Footedness.left, DateTime(1987, 6, 24), "Argentina", 170, 72),
    _PlayerSeed('Garrincha', Position.rightWinger, Footedness.right, DateTime(1933, 10, 28), "Brazil", 169, 69),
    _PlayerSeed('Neymar', Position.leftWinger, Footedness.right, DateTime(1992, 2, 5), "Brazil", 175, 68),
    _PlayerSeed('Ronaldinho', Position.leftWinger, Footedness.right, DateTime(1980, 3, 21), "Brazil", 181, 80),
    _PlayerSeed('Pele', Position.striker, Footedness.right, DateTime(1940, 10, 23), "Brazil", 173, 70),
    _PlayerSeed('Ronaldo Nazario', Position.striker, Footedness.right, DateTime(1976, 9, 18), "Brazil", 183, 82),
    _PlayerSeed('Romario', Position.striker, Footedness.right, DateTime(1966, 1, 29), "Brazil", 169, 72),
    _PlayerSeed('Gabriel Batistuta', Position.striker, Footedness.right, DateTime(1969, 2, 1), "Argentina", 185, 80),
  ];

  static final List<_PlayerSeed> _europeanAllStars = [
    _PlayerSeed('Gianluigi Buffon', Position.goalKeeper, Footedness.right, DateTime(1978, 1, 28), "Italy", 191, 83),
    _PlayerSeed('Manuel Neuer', Position.goalKeeper, Footedness.right, DateTime(1986, 3, 27), "Germany", 193, 92),
    _PlayerSeed('Philipp Lahm', Position.rightBack, Footedness.right, DateTime(1983, 11, 11), "Germany", 170, 66),
    _PlayerSeed('Dani Carvajal', Position.rightBack, Footedness.right, DateTime(1992, 1, 11), "Spain", 173, 73),
    _PlayerSeed('Paolo Maldini', Position.leftBack, Footedness.left, DateTime(1968, 6, 26), "Italy", 186, 80),
    _PlayerSeed('Ashley Cole', Position.leftBack, Footedness.left, DateTime(1980, 12, 20), "England", 176, 66),
    _PlayerSeed('Franz Beckenbauer', Position.centerBack, Footedness.right, DateTime(1945, 9, 11), "Germany", 181, 76),
    _PlayerSeed('Franco Baresi', Position.centerBack, Footedness.right, DateTime(1960, 5, 8), "Italy", 176, 70),
    _PlayerSeed('Sergio Ramos', Position.centerBack, Footedness.right, DateTime(1986, 3, 30), "Spain", 184, 82),
    _PlayerSeed('Fabio Cannavaro', Position.centerBack, Footedness.right, DateTime(1973, 9, 13), "Italy", 176, 75),
    _PlayerSeed('Claude Makelele', Position.defensiveMidfielder, Footedness.right, DateTime(1973, 2, 18), "France", 174, 70),
    _PlayerSeed('Sergio Busquets', Position.defensiveMidfielder, Footedness.right, DateTime(1988, 7, 16), "Spain", 189, 76),
    _PlayerSeed('Luka Modric', Position.centralMidfielder, Footedness.right, DateTime(1985, 9, 9), "Croatia", 172, 67),
    _PlayerSeed('Andres Iniesta', Position.centralMidfielder, Footedness.right, DateTime(1984, 5, 11), "Spain", 171, 68),
    _PlayerSeed('Zinedine Zidane', Position.attackingMidfielder, Footedness.right, DateTime(1972, 6, 23), "France", 185, 80),
    _PlayerSeed('Johan Cruyff', Position.attackingMidfielder, Footedness.right, DateTime(1947, 4, 25), "Netherlands", 180, 71),
    _PlayerSeed('Luis Figo', Position.rightWinger, Footedness.right, DateTime(1972, 11, 4), "Portugal", 180, 75),
    _PlayerSeed('George Best', Position.rightWinger, Footedness.right, DateTime(1946, 5, 22), "Northern Ireland", 175, 72),
    _PlayerSeed('Cristiano Ronaldo', Position.leftWinger, Footedness.right, DateTime(1985, 2, 5), "Portugal", 187, 84),
    _PlayerSeed('Thierry Henry', Position.leftWinger, Footedness.right, DateTime(1977, 8, 17), "France", 188, 83),
    _PlayerSeed('Marco van Basten', Position.striker, Footedness.right, DateTime(1964, 10, 31), "Netherlands", 188, 80),
    _PlayerSeed('Gerd Muller', Position.striker, Footedness.right, DateTime(1945, 11, 3), "Germany", 176, 75),
    _PlayerSeed('Robert Lewandowski', Position.striker, Footedness.right, DateTime(1988, 8, 21), "Poland", 185, 81),
    _PlayerSeed('Karim Benzema', Position.striker, Footedness.right, DateTime(1987, 12, 19), "France", 185, 81)
    ];
}

class _PlayerSeed {
  const _PlayerSeed(
    this.name,
    this.position,
    this.footedness,
    this.dateOfBirth,
    this.country,
    this.heightCm,
    this.weightKg,
  );

  final String name;
  final Position position;
  final Footedness footedness;
  final DateTime dateOfBirth;
  final String country;
  final double heightCm;
  final double weightKg;
}
