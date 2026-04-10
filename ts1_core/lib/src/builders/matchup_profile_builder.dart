import 'package:ts1_core/src/models/match/matchup_profile/matchup_profile.dart';
import 'package:ts1_core/src/models/team/strength_profile/team_strength_profile.dart';
import 'package:ts1_core/src/models/team/tactic/tactical_identity/tactical_identity.dart';

double _clamp(double x, [double lo = -1.0, double hi = 1.0]) {
  return x.clamp(lo, hi).toDouble();
}

double _safeDiv(double n, double d, [double defaultValue = 0.0]) {
  return d.abs() > 1e-9 ? n / d : defaultValue;
}

double _edgeFromStrengthDiff(double a, double b, {double scale = 20.0}) {
  return _clamp(_safeDiv(a - b, scale));
}

double _shotAggressionBias(TacticalIdentity identity) {
  return _clamp(
    0.65 * identity.riskTaking + 0.35 * identity.longShotBias,
    0.0,
    1.0,
  );
}

double _defensiveCautionBias(TacticalIdentity identity) {
  return _clamp(
    0.50 * (1.0 - identity.riskTaking) +
        0.30 * identity.compactnessBias +
        0.20 * (1.0 - identity.pressIntensityBias),
    0.0,
    1.0,
  );
}

double _tempoBias(TacticalIdentity identity) {
  return _clamp(
    0.35 * identity.verticalProgressionBias +
        0.25 * identity.directnessBias +
        0.20 * identity.counterSpeedBias +
        0.20 * identity.riskTaking,
    0.0,
    1.0,
  );
}

class MatchupProfileBuilder {
  MatchupProfileBuilder._();

  /// Layer 3 - Matchup Layer.
  ///
  /// Produces per-domain matchup edges by combining:
  /// - Layer 2: TeamStrengthProfile (capability)
  /// - Layer 1: TacticalIdentity (intent/bias)
  static MatchupProfile calculate({
    required TeamStrengthProfile strengthA,
    required TacticalIdentity identityA,
    required TeamStrengthProfile strengthB,
    required TacticalIdentity identityB,
  }) {
    final shotAggrA = _shotAggressionBias(identityA);
    final shotAggrB = _shotAggressionBias(identityB);
    final defCautionA = _defensiveCautionBias(identityA);
    final defCautionB = _defensiveCautionBias(identityB);
    final tempoA = _tempoBias(identityA);
    final tempoB = _tempoBias(identityB);

    // ====================================================================
    // POSSESSION and BUILD-UP
    // ====================================================================
    final buildupEdge = _edgeFromStrengthDiff(
      strengthA.buildUpQuality,
      strengthB.pressingForce,
      scale: 18.0,
    );

    final pressingEdge = _edgeFromStrengthDiff(
      strengthA.pressingForce,
      strengthB.pressResistance,
      scale: 18.0,
    );

    final counterpressingEdge = _edgeFromStrengthDiff(
      strengthA.pressingForce * 0.8,
      strengthB.transitionThreat,
      scale: 18.0,
    );

    // ====================================================================
    // SPACE CONTROL
    // ====================================================================
    final compactnessEdge = _edgeFromStrengthDiff(
      strengthA.defensiveCompactness,
      strengthB.centralCreativity,
      scale: 18.0,
    );

    final defensiveLineEdge = _edgeFromStrengthDiff(
      strengthA.transitionDefense,
      strengthB.transitionThreat,
      scale: 18.0,
    );

    // ====================================================================
    // ROUTE and CHANCE CREATION
    // ====================================================================
    final wideEdge = _edgeFromStrengthDiff(
      strengthA.wideAttack,
      strengthB.defensiveCompactness,
      scale: 20.0,
    );

    final centralEdge = _edgeFromStrengthDiff(
      strengthA.centralCreativity,
      strengthB.defensiveCompactness,
      scale: 20.0,
    );

    final fullbackEdge = _edgeFromStrengthDiff(
      strengthA.wideAttack * 0.6 + strengthA.pressResistance * 0.4,
      strengthB.wideAttack * 0.6 + strengthB.pressResistance * 0.4,
      scale: 18.0,
    );

    // ====================================================================
    // FINAL THIRD and SHOOTING
    // ====================================================================
    final finalThirdEdge = _edgeFromStrengthDiff(
      strengthA.centralCreativity * 0.45 +
          strengthA.finishingQuality * 0.35 +
          strengthA.chanceConversion * 0.20,
      strengthB.centralDefense * 0.60 + strengthB.defensiveCompactness * 0.40,
      scale: 18.0,
    );

    final shootingRiskEdge = _edgeFromStrengthDiff(
      shotAggrA * 50,
      defCautionB * 50,
      scale: 30.0,
    );

    // ====================================================================
    // TRANSITIONS
    // ====================================================================
    final transitionOutEdge = _edgeFromStrengthDiff(
      strengthA.transitionThreat,
      strengthB.defensiveCompactness,
      scale: 20.0,
    );

    final transitionInEdge = _edgeFromStrengthDiff(
      strengthA.defensiveCompactness,
      strengthB.transitionThreat,
      scale: 20.0,
    );

    // ====================================================================
    // SET PIECES and AERIAL
    // ====================================================================
    final aerialEdge = _edgeFromStrengthDiff(
      strengthA.aerialThreat * 0.70 + strengthA.setPieceAttackStrength * 0.30,
      strengthB.aerialThreat * 0.40 + strengthB.setPieceDefenseStrength * 0.60,
      scale: 22.0,
    );

    final setpieceDefenseEdge = _edgeFromStrengthDiff(
      strengthA.setPieceDefenseStrength,
      strengthB.setPieceAttackStrength,
      scale: 22.0,
    );

    // ====================================================================
    // TEMPO and FATIGUE
    // ====================================================================
    final tempoEdge = _edgeFromStrengthDiff(
      tempoA * 40,
      tempoB * 40,
      scale: 30.0,
    );

    // ====================================================================
    // KEY PLAYER INFLUENCE
    // ====================================================================
    final playmakerEdge = _edgeFromStrengthDiff(
      strengthA.centralCreativity,
      strengthB.pressingForce,
      scale: 18.0,
    );

    final strikerSupportEdge = _edgeFromStrengthDiff(
      strengthA.centralCreativity * 0.9,
      strengthB.defensiveCompactness * 0.8,
      scale: 18.0,
    );

    var profile = MatchupProfile(
      id: 0,
      buildupEdge: buildupEdge,
      pressingEdge: pressingEdge,
      counterpressingEdge: counterpressingEdge,
      compactnessEdge: compactnessEdge,
      defensiveLineEdge: defensiveLineEdge,
      wideEdge: wideEdge,
      centralEdge: centralEdge,
      fullbackEdge: fullbackEdge,
      finalThirdEdge: finalThirdEdge,
      shootingRiskEdge: shootingRiskEdge,
      transitionOutEdge: transitionOutEdge,
      transitionInEdge: transitionInEdge,
      aerialEdge: aerialEdge,
      setpieceDefenseEdge: setpieceDefenseEdge,
      tempoEdge: tempoEdge,
      playmakerEdge: playmakerEdge,
      strikerSupportEdge: strikerSupportEdge,
    );

    // Tactical identity nudges (small, clamped).
    final pressNudge = _clamp(
      (identityA.pressIntensityBias - identityB.pressIntensityBias) * 0.30,
    );
    final triggerNudge = _clamp(
      (identityA.pressTriggerRate - identityB.pressTriggerRate) * 0.20,
    );
    profile = profile.copyWith(
      pressingEdge: _clamp(profile.pressingEdge + pressNudge + triggerNudge),
    );

    final shortVsPressPenalty =
        (identityA.shortPassBias * identityB.pressIntensityBias) * 0.15;
    profile = profile.copyWith(
      buildupEdge: _clamp(profile.buildupEdge - shortVsPressPenalty),
    );

    final wideRouteAmp = (identityA.widthBias - 0.5) * 0.20;
    final centralRouteAmp =
        (identityA.attackCentralBias - identityB.attackCentralBias) * 0.20;
    profile = profile.copyWith(
      wideEdge: _clamp(profile.wideEdge + wideRouteAmp),
      centralEdge: _clamp(profile.centralEdge + centralRouteAmp),
    );

    final fullbackTacticalAmp = (identityA.widthBias - 0.5) * 0.15;
    profile = profile.copyWith(
      fullbackEdge: _clamp(profile.fullbackEdge + fullbackTacticalAmp),
    );

    final shootAmp = (shotAggrA - defCautionB) * 0.20;
    profile = profile.copyWith(
      finalThirdEdge: _clamp(profile.finalThirdEdge + shootAmp * 0.7),
      shootingRiskEdge: _clamp(profile.shootingRiskEdge + shootAmp),
    );

    final defensiveTightness = _clamp(defCautionA - shotAggrB) * 0.20;
    profile = profile.copyWith(
      compactnessEdge: _clamp(profile.compactnessEdge + defensiveTightness),
    );

    final highLineRisk =
        (identityA.defensiveLineHeight * identityB.counterTriggerBias) * 0.15;
    profile = profile.copyWith(
      defensiveLineEdge: _clamp(profile.defensiveLineEdge - highLineRisk),
    );

    final counterpressNudge = _clamp(
      (identityA.counterpressBias - identityB.counterSpeedBias) * 0.25,
    );
    profile = profile.copyWith(
      counterpressingEdge: _clamp(
        profile.counterpressingEdge + counterpressNudge,
      ),
    );

    final tempoAmp = (tempoA - tempoB) * 0.30;
    profile = profile.copyWith(tempoEdge: _clamp(profile.tempoEdge + tempoAmp));

    final playmakerSuppress = identityB.pressIntensityBias * 0.15;
    profile = profile.copyWith(
      playmakerEdge: _clamp(profile.playmakerEdge - playmakerSuppress),
    );

    final strikerSupportAmp =
        (identityA.attackCentralBias - defCautionB) * 0.15;
    profile = profile.copyWith(
      strikerSupportEdge: _clamp(
        profile.strikerSupportEdge + strikerSupportAmp,
      ),
    );

    final counterAmp =
        (identityA.counterTriggerBias - identityB.counterpressBias) * 0.25;
    final speedAmp =
        (identityA.counterSpeedBias - identityB.counterSpeedBias) * 0.10;
    profile = profile.copyWith(
      transitionOutEdge: _clamp(
        profile.transitionOutEdge + counterAmp + speedAmp,
      ),
    );

    final recoverAmp =
        (identityA.counterpressBias - identityB.counterSpeedBias) * 0.15;
    profile = profile.copyWith(
      transitionInEdge: _clamp(profile.transitionInEdge + recoverAmp),
    );

    final spAmp =
        (identityA.setPieceAttackingBias - identityB.setPieceDefensiveBias) *
        0.20;
    profile = profile.copyWith(
      aerialEdge: _clamp(profile.aerialEdge + spAmp),
      setpieceDefenseEdge: _clamp(profile.setpieceDefenseEdge - spAmp),
    );

    return profile;
  }

  static MatchupProfile build({
    required TeamStrengthProfile strengthA,
    required TacticalIdentity identityA,
    required TeamStrengthProfile strengthB,
    required TacticalIdentity identityB,
  }) {
    return calculate(
      strengthA: strengthA,
      identityA: identityA,
      strengthB: strengthB,
      identityB: identityB,
    );
  }
}
