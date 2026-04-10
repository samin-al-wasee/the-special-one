// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tactical_identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TacticalIdentity _$TacticalIdentityFromJson(
  Map<String, dynamic> json,
) => _TacticalIdentity(
  id: (json['id'] as num).toInt(),
  riskTaking: (json['riskTaking'] as num?)?.toDouble() ?? 0.50,
  directnessBias: (json['directnessBias'] as num?)?.toDouble() ?? 0.50,
  verticalProgressionBias:
      (json['verticalProgressionBias'] as num?)?.toDouble() ?? 0.50,
  shortPassBias: (json['shortPassBias'] as num?)?.toDouble() ?? 0.50,
  widthBias: (json['widthBias'] as num?)?.toDouble() ?? 0.50,
  attackLeftBias: (json['attackLeftBias'] as num?)?.toDouble() ?? 0.33,
  attackCentralBias: (json['attackCentralBias'] as num?)?.toDouble() ?? 0.34,
  attackRightBias: (json['attackRightBias'] as num?)?.toDouble() ?? 0.33,
  throughBallBias: (json['throughBallBias'] as num?)?.toDouble() ?? 0.35,
  crossBias: (json['crossBias'] as num?)?.toDouble() ?? 0.30,
  cutbackBias: (json['cutbackBias'] as num?)?.toDouble() ?? 0.25,
  dribbleCreationBias:
      (json['dribbleCreationBias'] as num?)?.toDouble() ?? 0.25,
  longShotBias: (json['longShotBias'] as num?)?.toDouble() ?? 0.20,
  shotPatience: (json['shotPatience'] as num?)?.toDouble() ?? 0.50,
  defensiveLineHeight:
      (json['defensiveLineHeight'] as num?)?.toDouble() ?? 0.50,
  pressIntensityBias: (json['pressIntensityBias'] as num?)?.toDouble() ?? 0.50,
  pressTriggerRate: (json['pressTriggerRate'] as num?)?.toDouble() ?? 0.50,
  defensiveWidthBias: (json['defensiveWidthBias'] as num?)?.toDouble() ?? 0.50,
  compactnessBias: (json['compactnessBias'] as num?)?.toDouble() ?? 0.50,
  markingBias: (json['markingBias'] as num?)?.toDouble() ?? 0.00,
  tacklingAggressionBias:
      (json['tacklingAggressionBias'] as num?)?.toDouble() ?? 0.50,
  counterTriggerBias: (json['counterTriggerBias'] as num?)?.toDouble() ?? 0.50,
  counterpressBias: (json['counterpressBias'] as num?)?.toDouble() ?? 0.50,
  counterSpeedBias: (json['counterSpeedBias'] as num?)?.toDouble() ?? 0.50,
  setPieceAttackingBias:
      (json['setPieceAttackingBias'] as num?)?.toDouble() ?? 0.50,
  setPieceDefensiveBias:
      (json['setPieceDefensiveBias'] as num?)?.toDouble() ?? 0.00,
  possessionTilt: (json['possessionTilt'] as num?)?.toDouble() ?? 0.0,
  passWeightMult: (json['passWeightMult'] as num?)?.toDouble() ?? 1.0,
  turnoverWeightMult: (json['turnoverWeightMult'] as num?)?.toDouble() ?? 1.0,
  shotWeightMult: (json['shotWeightMult'] as num?)?.toDouble() ?? 1.0,
  shotConversionDelta: (json['shotConversionDelta'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$TacticalIdentityToJson(_TacticalIdentity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'riskTaking': instance.riskTaking,
      'directnessBias': instance.directnessBias,
      'verticalProgressionBias': instance.verticalProgressionBias,
      'shortPassBias': instance.shortPassBias,
      'widthBias': instance.widthBias,
      'attackLeftBias': instance.attackLeftBias,
      'attackCentralBias': instance.attackCentralBias,
      'attackRightBias': instance.attackRightBias,
      'throughBallBias': instance.throughBallBias,
      'crossBias': instance.crossBias,
      'cutbackBias': instance.cutbackBias,
      'dribbleCreationBias': instance.dribbleCreationBias,
      'longShotBias': instance.longShotBias,
      'shotPatience': instance.shotPatience,
      'defensiveLineHeight': instance.defensiveLineHeight,
      'pressIntensityBias': instance.pressIntensityBias,
      'pressTriggerRate': instance.pressTriggerRate,
      'defensiveWidthBias': instance.defensiveWidthBias,
      'compactnessBias': instance.compactnessBias,
      'markingBias': instance.markingBias,
      'tacklingAggressionBias': instance.tacklingAggressionBias,
      'counterTriggerBias': instance.counterTriggerBias,
      'counterpressBias': instance.counterpressBias,
      'counterSpeedBias': instance.counterSpeedBias,
      'setPieceAttackingBias': instance.setPieceAttackingBias,
      'setPieceDefensiveBias': instance.setPieceDefensiveBias,
      'possessionTilt': instance.possessionTilt,
      'passWeightMult': instance.passWeightMult,
      'turnoverWeightMult': instance.turnoverWeightMult,
      'shotWeightMult': instance.shotWeightMult,
      'shotConversionDelta': instance.shotConversionDelta,
    };
