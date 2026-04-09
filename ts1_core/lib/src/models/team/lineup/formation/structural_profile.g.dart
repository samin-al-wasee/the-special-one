// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structural_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StructuralProfile _$StructuralProfileFromJson(
  Map<String, dynamic> json,
) => _StructuralProfile(
  widthCoverage: (json['widthCoverage'] as num?)?.toDouble() ?? 0.5,
  centralDensity: (json['centralDensity'] as num?)?.toDouble() ?? 0.5,
  supportNetworkQuality:
      (json['supportNetworkQuality'] as num?)?.toDouble() ?? 0.5,
  boxPresence: (json['boxPresence'] as num?)?.toDouble() ?? 0.5,
  restDefenseStability:
      (json['restDefenseStability'] as num?)?.toDouble() ?? 0.5,
  pressShapeCohesion: (json['pressShapeCohesion'] as num?)?.toDouble() ?? 0.5,
  transitionProtection:
      (json['transitionProtection'] as num?)?.toDouble() ?? 0.5,
  halfSpaceAccess: (json['halfSpaceAccess'] as num?)?.toDouble() ?? 0.5,
  flankIsolationRisk: (json['flankIsolationRisk'] as num?)?.toDouble() ?? 0.5,
  slotFitScore: (json['slotFitScore'] as num?)?.toDouble() ?? 0.5,
  roleCoherence: (json['roleCoherence'] as num?)?.toDouble() ?? 0.5,
);

Map<String, dynamic> _$StructuralProfileToJson(_StructuralProfile instance) =>
    <String, dynamic>{
      'widthCoverage': instance.widthCoverage,
      'centralDensity': instance.centralDensity,
      'supportNetworkQuality': instance.supportNetworkQuality,
      'boxPresence': instance.boxPresence,
      'restDefenseStability': instance.restDefenseStability,
      'pressShapeCohesion': instance.pressShapeCohesion,
      'transitionProtection': instance.transitionProtection,
      'halfSpaceAccess': instance.halfSpaceAccess,
      'flankIsolationRisk': instance.flankIsolationRisk,
      'slotFitScore': instance.slotFitScore,
      'roleCoherence': instance.roleCoherence,
    };
