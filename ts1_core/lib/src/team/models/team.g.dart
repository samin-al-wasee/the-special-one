// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Team _$TeamFromJson(Map<String, dynamic> json) => _Team(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  tactic: TeamTactic.fromJson(json['tactic'] as Map<String, dynamic>),
  lineup: TeamLineup.fromJson(json['lineup'] as Map<String, dynamic>),
  primaryColor: json['primaryColor'] as String,
  secondaryColor: json['secondaryColor'] as String,
  tertiaryColor: json['tertiaryColor'] as String,
  squad:
      (json['squad'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TeamToJson(_Team instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tactic': instance.tactic,
  'lineup': instance.lineup,
  'primaryColor': instance.primaryColor,
  'secondaryColor': instance.secondaryColor,
  'tertiaryColor': instance.tertiaryColor,
  'squad': instance.squad,
};
