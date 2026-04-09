import 'package:ts1_core/src/builders/structural_profile_builder.dart';
import 'package:ts1_core/src/enums/team/tactic/tactical_attributes.dart';
import 'package:ts1_core/src/models/team/tactic/tactical_identity/tactical_identity.dart';
import 'package:ts1_core/src/models/team/tactic/team_tactic.dart';
import 'package:ts1_core/src/models/team/team.dart';

double _clamp(double x, double lo, double hi) => x.clamp(lo, hi).toDouble();
double _clamp01(double x) => _clamp(x, 0.0, 1.0);

class TacticalIdentityBuilder {
  TacticalIdentityBuilder._();

  /// Builds [TacticalIdentity] from [TeamTactic] based on tactical controls.
  static TacticalIdentity buildFull(TeamTactic tactic) {
    final engineKnobs = _computeEngineKnobs(tactic);

    final widthBias = _clamp01(
      {
        Width.veryNarrow: 0.0,
        Width.narrow: 0.25,
        Width.balanced: 0.5,
        Width.wide: 0.75,
        Width.veryWide: 1.0,
      }[tactic.width]!,
    );

    final defensiveLineHeight = _clamp01(
      {
        DefensiveLine.veryDeep: 0.0,
        DefensiveLine.deep: 0.25,
        DefensiveLine.standard: 0.5,
        DefensiveLine.high: 0.75,
        DefensiveLine.veryHigh: 1.0,
      }[tactic.defensiveLine]!,
    );

    final pressIntensityBias = _clamp01(
      {
        PressingIntensity.veryLow: 0.0,
        PressingIntensity.low: 0.25,
        PressingIntensity.balanced: 0.5,
        PressingIntensity.high: 0.75,
        PressingIntensity.extreme: 1.0,
      }[tactic.pressingIntensity]!,
    );

    final defensiveWidthBias = _clamp01(
      {
        DefensiveWidth.veryNarrow: 0.0,
        DefensiveWidth.narrow: 0.25,
        DefensiveWidth.balanced: 0.5,
        DefensiveWidth.wide: 0.75,
        DefensiveWidth.veryWide: 1.0,
      }[tactic.defensiveWidth]!,
    );

    final compactnessBias = _clamp01(
      {
        Compactness.veryLoose: 0.0,
        Compactness.loose: 0.25,
        Compactness.balanced: 0.5,
        Compactness.compact: 0.75,
        Compactness.veryCompact: 1.0,
      }[tactic.compactness]!,
    );

    final markingBias = _clamp01(
      {
        MarkingStyle.zonal: 0.0,
        MarkingStyle.mixed: 0.5,
        MarkingStyle.tightManOriented: 1.0,
      }[tactic.markingStyle]!,
    );

    final tacklingAggressionBias = _clamp01(
      {
        TacklingAggression.stayOnFeet: 0.2,
        TacklingAggression.balanced: 0.5,
        TacklingAggression.aggressive: 0.8,
        TacklingAggression.veryAggressive: 1.0,
      }[tactic.tacklingAggression]!,
    );

    final riskTaking = _clamp01(
      0.5 +
          {
            PassingRisk.verySafe: -0.25,
            PassingRisk.safe: -0.10,
            PassingRisk.balanced: 0.0,
            PassingRisk.risky: 0.12,
            PassingRisk.veryRisky: 0.22,
          }[tactic.passingRisk]! +
          {
            DribblingRisk.veryConservative: -0.08,
            DribblingRisk.balanced: 0.0,
            DribblingRisk.aggressive: 0.10,
          }[tactic.dribblingRisk]! +
          {
            TeamMentality.veryDefensive: -0.18,
            TeamMentality.defensive: -0.10,
            TeamMentality.cautious: -0.05,
            TeamMentality.balanced: 0.0,
            TeamMentality.positive: 0.05,
            TeamMentality.attacking: 0.12,
            TeamMentality.veryAttacking: 0.20,
          }[tactic.teamMentality]!,
    );

    final directnessBias = _clamp01(
      {
        BuildUpStyle.buildFromBack: 0.20,
        BuildUpStyle.mixedBuildUp: 0.50,
        BuildUpStyle.directProgression: 0.75,
        BuildUpStyle.longBall: 1.00,
        BuildUpStyle.counterBuildUp: 0.85,
      }[tactic.buildUpStyle]!,
    );

    final verticalProgressionBias = _clamp01(
      {
        Tempo.veryLow: 0.20,
        Tempo.low: 0.35,
        Tempo.balanced: 0.50,
        Tempo.high: 0.75,
        Tempo.veryHigh: 0.95,
      }[tactic.tempo]!,
    );

    final shortPassBias = _clamp01(
      1.0 - (0.70 * directnessBias + 0.30 * riskTaking),
    );

    final shotPatience = _clamp01(
      {
        ShootingPolicy.shootLess: 0.80,
        ShootingPolicy.balanced: 0.50,
        ShootingPolicy.shootMore: 0.30,
        ShootingPolicy.shootAggressively: 0.15,
      }[tactic.shootingPolicy]!,
    );

    final throughBallBias = _clamp01(
      0.25 +
          0.40 *
              (tactic.finalThirdFocus == FinalThirdFocus.throughBallFocus
                  ? 1.0
                  : 0.0) +
          0.10 *
              (tactic.attackingFocus == AttackingFocus.attackCentre
                  ? 1.0
                  : 0.0) +
          0.10 * (1.0 - widthBias),
    );

    final crossBias = _clamp01(
      0.25 +
          0.35 *
              ((tactic.finalThirdFocus == FinalThirdFocus.crossEarly ||
                      tactic.finalThirdFocus == FinalThirdFocus.overlapWide)
                  ? 1.0
                  : 0.0) +
          0.20 * widthBias,
    );

    final cutbackBias = _clamp01(
      0.20 +
          0.35 *
              (tactic.finalThirdFocus == FinalThirdFocus.underlapInside
                  ? 1.0
                  : 0.0) +
          0.10 * widthBias,
    );

    final dribbleCreationBias = _clamp01(
      0.20 +
          0.45 *
              (tactic.finalThirdFocus == FinalThirdFocus.dribbleMore
                  ? 1.0
                  : 0.0) +
          0.20 *
              {
                DribblingRisk.veryConservative: 0.0,
                DribblingRisk.balanced: 0.5,
                DribblingRisk.aggressive: 1.0,
              }[tactic.dribblingRisk]!,
    );

    final longShotBias = _clamp01(
      0.15 +
          0.45 *
              (tactic.finalThirdFocus == FinalThirdFocus.shootOnSight
                  ? 1.0
                  : 0.0) +
          0.25 * (1.0 - shotPatience),
    );

    double attackLeftBias;
    double attackCentralBias;
    double attackRightBias;
    if (tactic.attackingFocus == AttackingFocus.attackLeft) {
      attackLeftBias = 0.55;
      attackCentralBias = 0.25;
      attackRightBias = 0.20;
    } else if (tactic.attackingFocus == AttackingFocus.attackRight) {
      attackLeftBias = 0.20;
      attackCentralBias = 0.25;
      attackRightBias = 0.55;
    } else if (tactic.attackingFocus == AttackingFocus.attackCentre) {
      attackLeftBias = 0.20;
      attackCentralBias = 0.60;
      attackRightBias = 0.20;
    } else if (tactic.attackingFocus == AttackingFocus.targetHalfSpaces) {
      attackLeftBias = 0.30;
      attackCentralBias = 0.40;
      attackRightBias = 0.30;
    } else {
      attackLeftBias = 0.33;
      attackCentralBias = 0.34;
      attackRightBias = 0.33;
    }

    final pressTriggerRate = _clamp01(
      {
            TransitionOnLoss.counterpress: 0.90,
            TransitionOnLoss.delay: 0.60,
            TransitionOnLoss.regroup: 0.35,
            TransitionOnLoss.tacticalFoul: 0.75,
            TransitionOnLoss.dropDeepImmediately: 0.15,
          }[tactic.transitionOnLoss]! *
          (0.7 + 0.6 * pressIntensityBias),
    );

    final counterTriggerBias = _clamp01(
      {
        TransitionOnWin.counterImmediately: 0.90,
        TransitionOnWin.progressSafely: 0.45,
        TransitionOnWin.holdShape: 0.15,
        TransitionOnWin.feedPlaymaker: 0.55,
        TransitionOnWin.feedWinger: 0.65,
        TransitionOnWin.goLongToStriker: 0.80,
        TransitionOnWin.attackWeakSide: 0.70,
      }[tactic.transitionOnWin]!,
    );

    final counterpressBias = _clamp01(
      {
        TransitionOnLoss.counterpress: 0.95,
        TransitionOnLoss.delay: 0.60,
        TransitionOnLoss.regroup: 0.30,
        TransitionOnLoss.tacticalFoul: 0.75,
        TransitionOnLoss.dropDeepImmediately: 0.10,
      }[tactic.transitionOnLoss]!,
    );

    final counterSpeedBias = _clamp01(
      0.5 +
          0.25 *
              ((tactic.transitionOnWin == TransitionOnWin.counterImmediately ||
                      tactic.transitionOnWin == TransitionOnWin.goLongToStriker)
                  ? 1.0
                  : 0.0) +
          0.15 *
              ((tactic.tempo == Tempo.high || tactic.tempo == Tempo.veryHigh)
                  ? 1.0
                  : 0.0) -
          0.20 *
              (tactic.transitionOnWin == TransitionOnWin.holdShape ? 1.0 : 0.0),
    );

    final setPieceAttackingBias = _clamp01(
      {
        SetPieceAttack.shortCorners: 0.20,
        SetPieceAttack.mixedCorners: 0.50,
        SetPieceAttack.nearPostCorners: 0.70,
        SetPieceAttack.farPostCorners: 0.70,
        SetPieceAttack.crowdGoalkeeper: 0.80,
        SetPieceAttack.edgeOfBoxSetup: 0.45,
        SetPieceAttack.tallPlayerTargeting: 0.90,
        SetPieceAttack.reboundHunting: 0.65,
      }[tactic.setPieceAttack]!,
    );

    final setPieceDefensiveBias = _clamp01(
      {
        SetPieceDefense.zonalMarking: 0.0,
        SetPieceDefense.mixedMarking: 0.5,
        SetPieceDefense.manMarking: 1.0,
        SetPieceDefense.leavePlayersUp: 0.3,
        SetPieceDefense.fullRetreat: 0.2,
        SetPieceDefense.counterSetup: 0.4,
        SetPieceDefense.nearPostGuard: 0.3,
      }[tactic.setPieceDefense]!,
    );

    return TacticalIdentity(
      riskTaking: riskTaking,
      directnessBias: directnessBias,
      verticalProgressionBias: verticalProgressionBias,
      shortPassBias: shortPassBias,
      widthBias: widthBias,
      attackLeftBias: attackLeftBias,
      attackCentralBias: attackCentralBias,
      attackRightBias: attackRightBias,
      throughBallBias: throughBallBias,
      crossBias: crossBias,
      cutbackBias: cutbackBias,
      dribbleCreationBias: dribbleCreationBias,
      longShotBias: longShotBias,
      shotPatience: shotPatience,
      defensiveLineHeight: defensiveLineHeight,
      pressIntensityBias: pressIntensityBias,
      pressTriggerRate: pressTriggerRate,
      defensiveWidthBias: defensiveWidthBias,
      compactnessBias: compactnessBias,
      markingBias: markingBias,
      tacklingAggressionBias: tacklingAggressionBias,
      counterTriggerBias: counterTriggerBias,
      counterpressBias: counterpressBias,
      counterSpeedBias: counterSpeedBias,
      setPieceAttackingBias: setPieceAttackingBias,
      setPieceDefensiveBias: setPieceDefensiveBias,
      possessionTilt: engineKnobs.possessionTilt,
      passWeightMult: engineKnobs.passWeightMult,
      turnoverWeightMult: engineKnobs.turnoverWeightMult,
      shotWeightMult: engineKnobs.shotWeightMult,
      shotConversionDelta: engineKnobs.shotConversionDelta,
    );
  }

  /// Structure-aware tactical identity.
  ///
  /// Base identity comes from [TeamTactic] and is then adjusted by structural
  /// expression quality from lineup/formation profile.
  static TacticalIdentity buildForTeam(Team team) {
    final base = buildFull(team.tactic);
    final profile = StructuralProfileBuilder.buildFrom(
      lineup: team.lineup,
      players: team.allPlayers,
    );

    var widthBias = _clamp01(
      base.widthBias + (profile.widthCoverage - 0.5) * 0.20,
    );
    var attackCentralBias = _clamp01(
      base.attackCentralBias + (profile.centralDensity - 0.5) * 0.18,
    );
    var attackLeftBias = _clamp01(
      base.attackLeftBias + (profile.widthCoverage - 0.5) * 0.05,
    );
    var attackRightBias = _clamp01(
      base.attackRightBias + (profile.widthCoverage - 0.5) * 0.05,
    );

    final attackSum = (attackLeftBias + attackCentralBias + attackRightBias)
        .clamp(1e-9, 999.0);
    attackLeftBias /= attackSum;
    attackCentralBias /= attackSum;
    attackRightBias /= attackSum;

    final pressIntensityBias = _clamp01(
      base.pressIntensityBias + (profile.pressShapeCohesion - 0.5) * 0.20,
    );
    final counterpressBias = _clamp01(
      base.counterpressBias + (profile.transitionProtection - 0.5) * 0.25,
    );
    final defensiveLineHeight = _clamp01(
      base.defensiveLineHeight + (profile.restDefenseStability - 0.5) * 0.15,
    );
    final shotPatience = _clamp01(
      base.shotPatience - (profile.boxPresence - 0.5) * 0.12,
    );

    return base.copyWith(
      widthBias: widthBias,
      attackLeftBias: attackLeftBias,
      attackCentralBias: attackCentralBias,
      attackRightBias: attackRightBias,
      pressIntensityBias: pressIntensityBias,
      counterpressBias: counterpressBias,
      defensiveLineHeight: defensiveLineHeight,
      shotPatience: shotPatience,
    );
  }

  static _EngineKnobs _computeEngineKnobs(TeamTactic tactic) {
    var possessionTilt = 0.0;
    var passMult = 1.0;
    var turnoverMult = 1.0;
    var shotMult = 1.0;
    var shotConvDelta = 0.0;

    // Build-up style
    if (tactic.buildUpStyle == BuildUpStyle.buildFromBack) {
      possessionTilt += 0.08;
      passMult += 0.08;
      turnoverMult -= 0.03;
      shotMult -= 0.02;
    } else if (tactic.buildUpStyle == BuildUpStyle.longBall) {
      possessionTilt -= 0.10;
      passMult -= 0.06;
      turnoverMult += 0.05;
      shotMult += 0.06;
    } else if (tactic.buildUpStyle == BuildUpStyle.counterBuildUp) {
      possessionTilt -= 0.04;
      turnoverMult += 0.03;
      shotMult += 0.03;
    }

    // Tempo
    if (tactic.tempo == Tempo.veryHigh) {
      possessionTilt -= 0.05;
      turnoverMult += 0.08;
      shotMult += 0.06;
      shotConvDelta -= 0.03;
    } else if (tactic.tempo == Tempo.high) {
      possessionTilt -= 0.03;
      turnoverMult += 0.06;
      shotMult += 0.04;
      shotConvDelta -= 0.02;
    } else if (tactic.tempo == Tempo.low) {
      possessionTilt += 0.03;
      turnoverMult -= 0.05;
      passMult += 0.05;
      shotMult -= 0.02;
      shotConvDelta += 0.01;
    } else if (tactic.tempo == Tempo.veryLow) {
      possessionTilt += 0.05;
      turnoverMult -= 0.08;
      passMult += 0.07;
      shotMult -= 0.04;
      shotConvDelta += 0.02;
    }

    // Pressing intensity
    if (tactic.pressingIntensity == PressingIntensity.extreme) {
      possessionTilt += 0.06;
      turnoverMult += 0.06;
      shotMult += 0.02;
      shotConvDelta -= 0.01;
    } else if (tactic.pressingIntensity == PressingIntensity.high) {
      possessionTilt += 0.04;
      turnoverMult += 0.03;
    } else if (tactic.pressingIntensity == PressingIntensity.low) {
      possessionTilt -= 0.04;
    } else if (tactic.pressingIntensity == PressingIntensity.veryLow) {
      possessionTilt -= 0.06;
    }

    // Team mentality
    if (tactic.teamMentality == TeamMentality.veryAttacking) {
      shotMult += 0.10;
      shotConvDelta += 0.03;
      turnoverMult += 0.02;
    } else if (tactic.teamMentality == TeamMentality.attacking) {
      shotMult += 0.08;
      shotConvDelta += 0.02;
    } else if (tactic.teamMentality == TeamMentality.positive) {
      shotMult += 0.04;
      shotConvDelta += 0.01;
    } else if (tactic.teamMentality == TeamMentality.defensive) {
      shotMult -= 0.05;
      shotConvDelta -= 0.01;
      possessionTilt += 0.02;
    } else if (tactic.teamMentality == TeamMentality.veryDefensive) {
      shotMult -= 0.08;
      shotConvDelta -= 0.02;
      possessionTilt += 0.03;
    }

    // Clamp values for safe engine behavior.
    possessionTilt = _clamp(possessionTilt, -0.20, 0.20);
    passMult = _clamp(passMult, 0.80, 1.20);
    turnoverMult = _clamp(turnoverMult, 0.80, 1.20);
    shotMult = _clamp(shotMult, 0.80, 1.25);
    shotConvDelta = _clamp(shotConvDelta, -0.10, 0.10);

    return _EngineKnobs(
      possessionTilt: possessionTilt,
      passWeightMult: passMult,
      turnoverWeightMult: turnoverMult,
      shotWeightMult: shotMult,
      shotConversionDelta: shotConvDelta,
    );
  }
}

class _EngineKnobs {
  const _EngineKnobs({
    required this.possessionTilt,
    required this.passWeightMult,
    required this.turnoverWeightMult,
    required this.shotWeightMult,
    required this.shotConversionDelta,
  });

  final double possessionTilt;
  final double passWeightMult;
  final double turnoverWeightMult;
  final double shotWeightMult;
  final double shotConversionDelta;
}
