import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactical_identity.freezed.dart';
part 'tactical_identity.g.dart';

/// Full tactical identity modifier catalog.
///
/// This is the long-term bias layer for attack route selection, chance creation,
/// pressing behavior, transitions, and set pieces. It also includes current
/// minute-loop engine-facing knobs.
@freezed
abstract class TacticalIdentity with _$TacticalIdentity {
  const factory TacticalIdentity({
    required int id,
    // ---- Possession / risk profile ----
    // 0..1: 0 = very controlled, 1 = very chaotic/risky
    required double riskTaking,

    // ---- Build-up / progression ----
    // 0..1: 0 = short/passive, 1 = direct/vertical
    required double directnessBias,
    required double verticalProgressionBias,
    required double shortPassBias,

    // ---- Width / attacking preference ----
    // 0..1: 0 = very narrow, 1 = very wide
    required double widthBias,

    // 0..1 each; consumers may renormalize to sum to 1
    required double attackLeftBias,
    required double attackCentralBias,
    required double attackRightBias,

    // ---- Chance type / final third ----
    required double throughBallBias,
    required double crossBias,
    required double cutbackBias,
    required double dribbleCreationBias,
    required double longShotBias,

    // 0..1: 0 = shoot quickly, 1 = patient shot selection
    required double shotPatience,

    // ---- Defensive shape / pressing ----
    // 0..1: 0 = very deep, 1 = very high
    required double defensiveLineHeight,

    // 0..1: 0 = very low press, 1 = very high press
    required double pressIntensityBias,

    // 0..1: how often pressing triggers occur
    required double pressTriggerRate,

    // 0..1: 0 = very narrow, 1 = very wide
    required double defensiveWidthBias,

    // 0..1: 0 = very loose, 1 = very compact
    required double compactnessBias,

    // 0..1: 0 = zonal, 1 = man-oriented
    required double markingBias,

    // 0..1: 0 = cautious, 1 = aggressive
    required double tacklingAggressionBias,

    // ---- Transitions ----
    // 0..1: 0 = always hold/reset, 1 = counter immediately
    required double counterTriggerBias,

    // 0..1: 0 = fall back, 1 = counterpress always
    required double counterpressBias,

    // 0..1: 0 = slow, 1 = very fast
    required double counterSpeedBias,

    // ---- Set pieces ----
    // 0..1: 0 = short routines, 1 = delivery to box
    required double setPieceAttackingBias,

    // 0..1: 0 = zonal, 1 = man-oriented
    required double setPieceDefensiveBias,

    // ---- Current minute-loop engine-facing knobs ----
    // -0.20 .. +0.20 (recommended)
    required double possessionTilt,

    // Multipliers applied to base event weights.
    required double passWeightMult,
    required double turnoverWeightMult,
    required double shotWeightMult,

    // Delta applied to base goal probability (recommended -0.10 .. +0.10).
    required double shotConversionDelta,
  }) = _TacticalIdentity;

  factory TacticalIdentity.fromJson(Map<String, dynamic> json) =>
      _$TacticalIdentityFromJson(json);
}
