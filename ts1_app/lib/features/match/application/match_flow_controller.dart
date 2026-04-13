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

  static const int _homeTeamId = 101;
  static const int _awayTeamId = 202;
  static const String _homeTeamName = 'South American All Stars';
  static const String _awayTeamName = 'European All Stars';

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

  List<TacticalPreset> get availablePresets =>
      TacticalPresetFactory.allPresets();

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

    final matchId =
        DateTime.now().millisecondsSinceEpoch.remainder(1000000) + 1000;
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
        matchState: MatchStateFactory.secondHalfKickoff(
          current.matchState,
          kickoffSide: TeamSide.away,
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

    return MatchPerformanceBuilder.buildFor(current, side).rating;
  }

  int starsFor(TeamSide side) {
    final current = _match;
    if (current == null) {
      return 0;
    }

    return MatchPerformanceBuilder.buildFor(current, side).stars;
  }

  String ratingLabelFor(TeamSide side) {
    final current = _match;
    if (current == null) {
      return 'Rough';
    }

    return MatchPerformanceBuilder.buildFor(current, side).label;
  }

  void _refreshDraftTeams() {
    _draftHomeTeam = DraftTeamFactory.buildTeam(
      id: _homeTeamId,
      name: _homeTeamName,
      formationCode: _homeFormationCode,
      preset: _homePreset,
    );
    _draftAwayTeam = DraftTeamFactory.buildTeam(
      id: _awayTeamId,
      name: _awayTeamName,
      formationCode: _awayFormationCode,
      preset: _awayPreset,
    );
  }
}
