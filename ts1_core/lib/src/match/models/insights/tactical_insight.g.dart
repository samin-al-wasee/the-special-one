// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tactical_insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TacticalInsight _$TacticalInsightFromJson(Map<String, dynamic> json) =>
    _TacticalInsight(
      id: (json['id'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      level: $enumDecode(_$TacticalSignalLevelEnumMap, json['level']),
      message: json['message'] as String,
      suggestedAction: json['suggestedAction'] as String?,
      relatedTeam: $enumDecodeNullable(_$TeamSideEnumMap, json['relatedTeam']),
    );

Map<String, dynamic> _$TacticalInsightToJson(_TacticalInsight instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minute': instance.minute,
      'level': _$TacticalSignalLevelEnumMap[instance.level]!,
      'message': instance.message,
      'suggestedAction': instance.suggestedAction,
      'relatedTeam': _$TeamSideEnumMap[instance.relatedTeam],
    };

const _$TacticalSignalLevelEnumMap = {
  TacticalSignalLevel.info: 'info',
  TacticalSignalLevel.positive: 'positive',
  TacticalSignalLevel.warning: 'warning',
  TacticalSignalLevel.critical: 'critical',
};

const _$TeamSideEnumMap = {TeamSide.home: 'home', TeamSide.away: 'away'};
