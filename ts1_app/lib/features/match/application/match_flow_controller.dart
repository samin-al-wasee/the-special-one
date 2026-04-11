import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ts1_core/ts1_core.dart';

final matchFlowProvider = Provider<MatchFlowController>((ref) {
  return MatchFlowController.instance;
});

class MatchFlowController extends ChangeNotifier {
  MatchFlowController._() {
    resetToDefaults();
  }

  static final MatchFlowController instance = MatchFlowController._();

  TacticalPreset _homePreset = TacticalPreset.gegenpress;
  TacticalPreset _awayPreset = TacticalPreset.possessionControl;
  String _homeFormationCode = '4-3-3';
  String _awayFormationCode = '4-2-3-1';

  Team? _draftHomeTeam;
  Team? _draftAwayTeam;
  Match? _match;
  Timer? _simulationTimer;

  TacticalPreset get homePreset => _homePreset;
  TacticalPreset get awayPreset => _awayPreset;
  String get homeFormationCode => _homeFormationCode;
  String get awayFormationCode => _awayFormationCode;
  Team? get draftHomeTeam => _draftHomeTeam;
  Team? get draftAwayTeam => _draftAwayTeam;
  Match? get match => _match;

  List<TacticalPreset> get availablePresets => TacticalPresetFactory.allPresets();

  List<String> get availableFormations {
    final codes = FormationFactory.supportedCodes.toList()..sort();
    return codes;
  }

  bool get hasFinishedMatch => _match?.matchState.isFinished ?? false;
  bool get hasPreparedTeams => _draftHomeTeam != null && _draftAwayTeam != null;

  void resetToDefaults() {
    _stopSimulation();
    _homePreset = TacticalPreset.gegenpress;
    _awayPreset = TacticalPreset.possessionControl;
    _homeFormationCode = '4-3-3';
    _awayFormationCode = '4-2-3-1';
    _match = null;
    _draftHomeTeam = null;
    _draftAwayTeam = null;
    notifyListeners();
  }

  void setHomePreset(TacticalPreset preset) {
    _homePreset = preset;
    _draftHomeTeam = null;
    _draftAwayTeam = null;
    notifyListeners();
  }

  void setAwayPreset(TacticalPreset preset) {
    _awayPreset = preset;
    _draftHomeTeam = null;
    _draftAwayTeam = null;
    notifyListeners();
  }

  void setHomeFormation(String code) {
    _homeFormationCode = code;
    _draftHomeTeam = null;
    _draftAwayTeam = null;
    notifyListeners();
  }

  void setAwayFormation(String code) {
    _awayFormationCode = code;
    _draftHomeTeam = null;
    _draftAwayTeam = null;
    notifyListeners();
  }

  void prepareTeams() {
    _refreshDraftTeams();
    notifyListeners();
  }

  void startMatch() {
    if (!hasPreparedTeams) {
      _refreshDraftTeams();
    }
    final homeTeam = _draftHomeTeam;
    final awayTeam = _draftAwayTeam;
    if (homeTeam == null || awayTeam == null) {
      return;
    }

    final matchId = DateTime.now().millisecondsSinceEpoch.remainder(1000000) + 1000;
    final bootstrapped = MatchEngine.bootstrapMatch(
      id: matchId,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      kickoffAt: DateTime.now(),
      venue: 'Demo Stadium',
      weather: 'Clear',
    );

    _match = MatchEngine.kickoffMatch(bootstrapped);
    _startSimulation();
    notifyListeners();
  }

  void advanceMatchPhase() {
    final current = _match;
    if (current == null || current.matchState.isFinished) {
      return;
    }

    _match = _advanceOneStep(current);
    if (_match?.matchState.isFinished ?? false) {
      _stopSimulation();
    }
    notifyListeners();
  }

  void _startSimulation() {
    if (_simulationTimer != null) {
      return;
    }

    _simulationTimer = Timer.periodic(const Duration(milliseconds: 450), (_) {
      final current = _match;
      if (current == null || current.matchState.isFinished) {
        _stopSimulation();
        return;
      }

      final next = _advanceOneStep(current);
      if (next.matchState == current.matchState) {
        _stopSimulation();
        return;
      }

      _match = next;
      notifyListeners();

      if (next.matchState.isFinished) {
        _stopSimulation();
      }
    });
  }

  void _stopSimulation() {
    _simulationTimer?.cancel();
    _simulationTimer = null;
  }

  Match _advanceOneStep(Match current) {
    if (current.matchState.status == MatchStatus.halfTime) {
      return current.copyWith(
        matchState: current.matchState.copyWith(
          status: MatchStatus.secondHalf,
          currentPhaseType: MatchPhaseType.neutralPossession,
          currentPhaseState: MatchPhaseState.neutralPossession,
          currentInitiative: null,
          currentPossession: null,
          currentTerritoryControl: null,
        ),
      );
    }

    return MatchEngine.advanceMicroPhase(current);
  }

  @override
  void dispose() {
    _stopSimulation();
    super.dispose();
  }

  double ratingFor(TeamSide side) {
    final current = _match;
    if (current == null) {
      return 0.0;
    }

    final state = current.matchState;
    final ownStats = state.statsFor(side);
    final oppStats = state.statsFor(current.opponentOf(side));
    final ownGoals = side == TeamSide.home ? state.scoreline.home : state.scoreline.away;
    final oppGoals = side == TeamSide.home ? state.scoreline.away : state.scoreline.home;
    final scoreDiff = ownGoals - oppGoals;
    final xgDiff = ownStats.expectedGoals - oppStats.expectedGoals;
    final shotDiff = ownStats.shotsOnTarget - oppStats.shotsOnTarget;
    final possessionDiff = (ownStats.possession - oppStats.possession) / 100.0;
    final initiativeCount = state.phaseHistory.where((snapshot) {
      return snapshot.initiativeTeam == side;
    }).length;
    final initiativeShare = state.phaseHistory.isEmpty
        ? 0.0
        : initiativeCount / state.phaseHistory.length;

    final raw = 2.0 +
        (scoreDiff * 1.1) +
        (xgDiff * 1.3) +
        (shotDiff * 0.08) +
        (possessionDiff * 1.2) +
        (initiativeShare * 0.8);
    return raw.clamp(0.0, 5.0).toDouble();
  }

  int starsFor(TeamSide side) {
    return ratingFor(side).round().clamp(0, 5);
  }

  String ratingLabelFor(TeamSide side) {
    final rating = ratingFor(side);
    if (rating >= 4.5) {
      return 'Dominant';
    }
    if (rating >= 3.5) {
      return 'Strong';
    }
    if (rating >= 2.5) {
      return 'Even';
    }
    if (rating >= 1.5) {
      return 'Struggled';
    }
    return 'Rough';
  }

  void _refreshDraftTeams() {
    _draftHomeTeam = _buildTeam(
      id: 101,
      name: 'Home FC',
      formationCode: _homeFormationCode,
      preset: _homePreset,
    );
    _draftAwayTeam = _buildTeam(
      id: 202,
      name: 'Away FC',
      formationCode: _awayFormationCode,
      preset: _awayPreset,
    );
  }

  Team _buildTeam({
    required int id,
    required String name,
    required String formationCode,
    required TacticalPreset preset,
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
      count: 7,
    );
    final reserves = _buildBenchPlayers(
      teamId: id,
      teamName: name,
      startIndex: starters.length + bench.length,
      count: 4,
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

  List<Player> _buildPlayersForFormation({
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

  List<Player> _buildBenchPlayers({
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

  Player _buildPlayer({
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

  Footedness _footednessFor(int index, Position position) {
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

  double _heightFor(Position position) {
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

  double _weightFor(Position position) {
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

  Map<TechnicalAttr, int> _technicalFor(Position position) {
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

  Map<MentalAttr, int> _mentalFor(Position position) {
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

  Map<PhysicalAttr, int> _physicalFor(Position position) {
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