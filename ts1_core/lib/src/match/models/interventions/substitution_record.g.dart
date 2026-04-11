// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substitution_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubstitutionRecord _$SubstitutionRecordFromJson(Map<String, dynamic> json) =>
    _SubstitutionRecord(
      id: (json['id'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      teamSide: $enumDecode(_$TeamSideEnumMap, json['teamSide']),
      playerOutId: (json['playerOutId'] as num).toInt(),
      playerInId: (json['playerInId'] as num).toInt(),
      type: $enumDecode(_$SubstitutionTypeEnumMap, json['type']),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$SubstitutionRecordToJson(_SubstitutionRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minute': instance.minute,
      'teamSide': _$TeamSideEnumMap[instance.teamSide]!,
      'playerOutId': instance.playerOutId,
      'playerInId': instance.playerInId,
      'type': _$SubstitutionTypeEnumMap[instance.type]!,
      'reason': instance.reason,
    };

const _$TeamSideEnumMap = {TeamSide.home: 'home', TeamSide.away: 'away'};

const _$SubstitutionTypeEnumMap = {
  SubstitutionType.fitness: 'fitness',
  SubstitutionType.injury: 'injury',
  SubstitutionType.tactical: 'tactical',
  SubstitutionType.matchup: 'matchup',
  SubstitutionType.emotional: 'emotional',
  SubstitutionType.protection: 'protection',
  SubstitutionType.cardRisk: 'cardRisk',
  SubstitutionType.roleRebalance: 'roleRebalance',
  SubstitutionType.gameStateControl: 'gameStateControl',
  SubstitutionType.chaos: 'chaos',
};
