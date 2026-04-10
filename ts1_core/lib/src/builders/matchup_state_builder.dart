import 'package:ts1_core/src/models/match/context/match_context.dart';
import 'package:ts1_core/src/models/match/matchup_profile/matchup_profile.dart';
import 'package:ts1_core/src/models/match/state/matchup_state.dart';

class MatchupStateBuilder {
  const MatchupStateBuilder._();

  static MatchupState fromContext(MatchContext context) {
    final homeProfile = context.homeToAwayMatchupProfile;
    final awayProfile = context.awayToHomeMatchupProfile;

    return MatchupState(
      homeAttackVsAwayDefense: _clampEdge(_attackEdge(homeProfile)),
      awayAttackVsHomeDefense: _clampEdge(-_attackEdge(awayProfile)),
      midfieldControlEdge: _clampEdge(
        _midfieldEdge(homeProfile) - _midfieldEdge(awayProfile),
      ),
      transitionControlEdge: _clampEdge(
        _transitionEdge(homeProfile) - _transitionEdge(awayProfile),
      ),
      wingControlEdge: _clampEdge(
        _wingEdge(homeProfile) - _wingEdge(awayProfile),
      ),
      setPieceControlEdge: _clampEdge(
        _setPieceEdge(homeProfile) - _setPieceEdge(awayProfile),
      ),
    );
  }

  static double _attackEdge(MatchupProfile profile) {
    return _average([
      profile.buildupEdge,
      profile.pressingEdge,
      profile.counterpressingEdge,
      profile.finalThirdEdge,
      profile.wideEdge,
      profile.centralEdge,
      profile.fullbackEdge,
      profile.strikerSupportEdge,
      profile.playmakerEdge,
    ]);
  }

  static double _midfieldEdge(MatchupProfile profile) {
    return _average([
      profile.compactnessEdge,
      profile.defensiveLineEdge,
      profile.tempoEdge,
      profile.playmakerEdge,
    ]);
  }

  static double _transitionEdge(MatchupProfile profile) {
    return _average([
      profile.transitionOutEdge,
      -profile.transitionInEdge,
      profile.shootingRiskEdge,
    ]);
  }

  static double _wingEdge(MatchupProfile profile) {
    return _average([profile.wideEdge, profile.fullbackEdge]);
  }

  static double _setPieceEdge(MatchupProfile profile) {
    return _average([profile.aerialEdge, -profile.setpieceDefenseEdge]);
  }

  static double _average(List<double> values) {
    if (values.isEmpty) {
      return 0.0;
    }

    return values.reduce((sum, value) => sum + value) / values.length;
  }

  static double _clampEdge(double value) {
    return value.clamp(-1.0, 1.0).toDouble();
  }
}
