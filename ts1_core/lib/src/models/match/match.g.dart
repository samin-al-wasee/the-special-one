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
  context: MatchContext.fromJson(json['context'] as Map<String, dynamic>),
  matchState: MatchState.fromJson(json['matchState'] as Map<String, dynamic>),
  venue: json['venue'] as String? ?? 'Unknown',
  weather: json['weather'] as String? ?? 'Unknown',
  totalRegulationMinutes:
      (json['totalRegulationMinutes'] as num?)?.toInt() ?? 90,
  microPhaseSeconds: (json['microPhaseSeconds'] as num?)?.toInt() ?? 30,
);

Map<String, dynamic> _$MatchToJson(_Match instance) => <String, dynamic>{
  'id': instance.id,
  'homeTeam': instance.homeTeam,
  'awayTeam': instance.awayTeam,
  'kickoffAt': instance.kickoffAt.toIso8601String(),
  'context': instance.context,
  'matchState': instance.matchState,
  'venue': instance.venue,
  'weather': instance.weather,
  'totalRegulationMinutes': instance.totalRegulationMinutes,
  'microPhaseSeconds': instance.microPhaseSeconds,
};
