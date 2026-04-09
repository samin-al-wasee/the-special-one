// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lineup _$LineupFromJson(Map<String, dynamic> json) => _Lineup(
  id: (json['id'] as num).toInt(),
  formation: FormationShape.fromJson(json['formation'] as Map<String, dynamic>),
  slotAssignments:
      (json['slotAssignments'] as List<dynamic>?)
          ?.map((e) => LineupSlotAssignment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  bench:
      (json['bench'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  reserves:
      (json['reserves'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  captain: json['captain'] == null
      ? null
      : Player.fromJson(json['captain'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LineupToJson(_Lineup instance) => <String, dynamic>{
  'id': instance.id,
  'formation': instance.formation,
  'slotAssignments': instance.slotAssignments,
  'bench': instance.bench,
  'reserves': instance.reserves,
  'captain': instance.captain,
};
