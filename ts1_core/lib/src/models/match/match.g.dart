// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Match _$MatchFromJson(Map<String, dynamic> json) => _Match(
  id: (json['id'] as num).toInt(),
  homeTeam: Team.fromJson(json['homeTeam'] as Map<String, dynamic>),
  awayTeam: Team.fromJson(json['awayTeam'] as Map<String, dynamic>),
  kickoffAt: DateTime.parse(json['kickoffAt'] as String),
  venue: json['venue'] as String?,
  weather: json['weather'] as String?,
  totalRegulationMinutes:
      (json['totalRegulationMinutes'] as num?)?.toInt() ?? 90,
  microPhaseSeconds: (json['microPhaseSeconds'] as num?)?.toInt() ?? 30,
  context: json['context'] == null
      ? const MatchContext()
      : MatchContext.fromJson(json['context'] as Map<String, dynamic>),
  matchState: json['matchState'] == null
      ? const MatchState()
      : MatchState.fromJson(json['matchState'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchToJson(_Match instance) => <String, dynamic>{
  'id': instance.id,
  'homeTeam': instance.homeTeam,
  'awayTeam': instance.awayTeam,
  'kickoffAt': instance.kickoffAt.toIso8601String(),
  'venue': instance.venue,
  'weather': instance.weather,
  'totalRegulationMinutes': instance.totalRegulationMinutes,
  'microPhaseSeconds': instance.microPhaseSeconds,
  'context': instance.context,
  'matchState': instance.matchState,
};
