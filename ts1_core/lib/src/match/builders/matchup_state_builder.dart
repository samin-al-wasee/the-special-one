import 'package:ts1_core/src/match/models/context/match_context.dart';
import 'package:ts1_core/src/match/models/state/matchup_state.dart';

class MatchupStateBuilder {
  const MatchupStateBuilder._();

  /// Derives a detailed [MatchupState] from a [MatchContext].
  ///
  /// All edges are from home perspective:
  /// - positive = home advantage
  /// - negative = away advantage
  ///
  /// Uses the two directional matchup profiles to compute granular tactical edges.
  static MatchupState fromContext(MatchContext context) {
    final homeProfile = context.homeToAwayMatchupProfile;
    final awayProfile = context.awayToHomeMatchupProfile;

    return MatchupState(
      id: context.id,
      // ==================== POSSESSION and BUILD-UP ====================
      buildupEdge: _clampEdge(homeProfile.buildupEdge - awayProfile.buildupEdge),
      pressingEdge: _clampEdge(homeProfile.pressingEdge - awayProfile.pressingEdge),
      counterpressingEdge: _clampEdge(homeProfile.counterpressingEdge - awayProfile.counterpressingEdge),

      // ==================== SPACE CONTROL ====================
      compactnessEdge: _clampEdge(homeProfile.compactnessEdge - awayProfile.compactnessEdge),
      defensiveLineEdge: _clampEdge(homeProfile.defensiveLineEdge - awayProfile.defensiveLineEdge),

      // ==================== ROUTE and CHANCE CREATION ====================
      wideEdge: _clampEdge(homeProfile.wideEdge - awayProfile.wideEdge),
      centralEdge: _clampEdge(homeProfile.centralEdge - awayProfile.centralEdge),
      fullbackEdge: _clampEdge(homeProfile.fullbackEdge - awayProfile.fullbackEdge),

      // ==================== FINAL THIRD and SHOOTING ====================
      finalThirdEdge: _clampEdge(homeProfile.finalThirdEdge - awayProfile.finalThirdEdge),
      shootingRiskEdge: _clampEdge(homeProfile.shootingRiskEdge - awayProfile.shootingRiskEdge),

      // ==================== TRANSITIONS ====================
      transitionOutEdge: _clampEdge(homeProfile.transitionOutEdge - awayProfile.transitionOutEdge),
      transitionInEdge: _clampEdge(homeProfile.transitionInEdge - awayProfile.transitionInEdge),

      // ==================== SET PIECES and AERIAL ====================
      aerialEdge: _clampEdge(homeProfile.aerialEdge - awayProfile.aerialEdge),
      setpieceDefenseEdge: _clampEdge(homeProfile.setpieceDefenseEdge - awayProfile.setpieceDefenseEdge),

      // ==================== TEMPO and FATIGUE ====================
      tempoEdge: _clampEdge(homeProfile.tempoEdge - awayProfile.tempoEdge),

      // ==================== KEY PLAYER INFLUENCE ====================
      playmakerEdge: _clampEdge(homeProfile.playmakerEdge - awayProfile.playmakerEdge),
      strikerSupportEdge: _clampEdge(homeProfile.strikerSupportEdge - awayProfile.strikerSupportEdge),
    );
  }

  static double _clampEdge(double value) {
    return value.clamp(-1.0, 1.0).toDouble();
  }
}
