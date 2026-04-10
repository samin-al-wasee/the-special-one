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
    @Default(0.50) double riskTaking,

    // ---- Build-up / progression ----
    // 0..1: 0 = short/passive, 1 = direct/vertical
    @Default(0.50) double directnessBias,
    @Default(0.50) double verticalProgressionBias,
    @Default(0.50) double shortPassBias,

    // ---- Width / attacking preference ----
    // 0..1: 0 = very narrow, 1 = very wide
    @Default(0.50) double widthBias,

    // 0..1 each; consumers may renormalize to sum to 1
    @Default(0.33) double attackLeftBias,
    @Default(0.34) double attackCentralBias,
    @Default(0.33) double attackRightBias,

    // ---- Chance type / final third ----
    @Default(0.35) double throughBallBias,
    @Default(0.30) double crossBias,
    @Default(0.25) double cutbackBias,
    @Default(0.25) double dribbleCreationBias,
    @Default(0.20) double longShotBias,

    // 0..1: 0 = shoot quickly, 1 = patient shot selection
    @Default(0.50) double shotPatience,

    // ---- Defensive shape / pressing ----
    // 0..1: 0 = very deep, 1 = very high
    @Default(0.50) double defensiveLineHeight,

    // 0..1: 0 = very low press, 1 = very high press
    @Default(0.50) double pressIntensityBias,

    // 0..1: how often pressing triggers occur
    @Default(0.50) double pressTriggerRate,

    // 0..1: 0 = very narrow, 1 = very wide
    @Default(0.50) double defensiveWidthBias,

    // 0..1: 0 = very loose, 1 = very compact
    @Default(0.50) double compactnessBias,

    // 0..1: 0 = zonal, 1 = man-oriented
    @Default(0.00) double markingBias,

    // 0..1: 0 = cautious, 1 = aggressive
    @Default(0.50) double tacklingAggressionBias,

    // ---- Transitions ----
    // 0..1: 0 = always hold/reset, 1 = counter immediately
    @Default(0.50) double counterTriggerBias,

    // 0..1: 0 = fall back, 1 = counterpress always
    @Default(0.50) double counterpressBias,

    // 0..1: 0 = slow, 1 = very fast
    @Default(0.50) double counterSpeedBias,

    // ---- Set pieces ----
    // 0..1: 0 = short routines, 1 = delivery to box
    @Default(0.50) double setPieceAttackingBias,

    // 0..1: 0 = zonal, 1 = man-oriented
    @Default(0.00) double setPieceDefensiveBias,

    // ---- Current minute-loop engine-facing knobs ----
    // -0.20 .. +0.20 (recommended)
    @Default(0.0) double possessionTilt,

    // Multipliers applied to base event weights.
    @Default(1.0) double passWeightMult,
    @Default(1.0) double turnoverWeightMult,
    @Default(1.0) double shotWeightMult,

    // Delta applied to base goal probability (recommended -0.10 .. +0.10).
    @Default(0.0) double shotConversionDelta,
  }) = _TacticalIdentity;

  factory TacticalIdentity.fromJson(Map<String, dynamic> json) =>
      _$TacticalIdentityFromJson(json);
}
