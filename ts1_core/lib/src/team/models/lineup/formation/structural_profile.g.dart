// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structural_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StructuralProfile _$StructuralProfileFromJson(Map<String, dynamic> json) =>
    _StructuralProfile(
      id: (json['id'] as num).toInt(),
      widthCoverage: (json['widthCoverage'] as num).toDouble(),
      centralDensity: (json['centralDensity'] as num).toDouble(),
      supportNetworkQuality: (json['supportNetworkQuality'] as num).toDouble(),
      boxPresence: (json['boxPresence'] as num).toDouble(),
      restDefenseStability: (json['restDefenseStability'] as num).toDouble(),
      pressShapeCohesion: (json['pressShapeCohesion'] as num).toDouble(),
      transitionProtection: (json['transitionProtection'] as num).toDouble(),
      halfSpaceAccess: (json['halfSpaceAccess'] as num).toDouble(),
      flankIsolationRisk: (json['flankIsolationRisk'] as num).toDouble(),
      slotFitScore: (json['slotFitScore'] as num).toDouble(),
      roleCoherence: (json['roleCoherence'] as num).toDouble(),
    );

Map<String, dynamic> _$StructuralProfileToJson(_StructuralProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
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
