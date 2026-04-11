// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_lineup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamLineup _$TeamLineupFromJson(Map<String, dynamic> json) => _TeamLineup(
  id: (json['id'] as num).toInt(),
  formationShape: FormationShape.fromJson(
    json['formationShape'] as Map<String, dynamic>,
  ),
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

Map<String, dynamic> _$TeamLineupToJson(_TeamLineup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'formationShape': instance.formationShape,
      'slotAssignments': instance.slotAssignments,
      'bench': instance.bench,
      'reserves': instance.reserves,
      'captain': instance.captain,
    };
