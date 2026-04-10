// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_dynamics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchDynamics _$MatchDynamicsFromJson(
  Map<String, dynamic> json,
) => _MatchDynamics(
  id: (json['id'] as num).toInt(),
  homeMomentum: (json['homeMomentum'] as num?)?.toDouble() ?? 0.0,
  awayMomentum: (json['awayMomentum'] as num?)?.toDouble() ?? 0.0,
  homeConfidence: (json['homeConfidence'] as num?)?.toDouble() ?? 0.5,
  awayConfidence: (json['awayConfidence'] as num?)?.toDouble() ?? 0.5,
  homeFatigue: (json['homeFatigue'] as num?)?.toDouble() ?? 0.0,
  awayFatigue: (json['awayFatigue'] as num?)?.toDouble() ?? 0.0,
  homeDisciplinePressure:
      (json['homeDisciplinePressure'] as num?)?.toDouble() ?? 0.0,
  awayDisciplinePressure:
      (json['awayDisciplinePressure'] as num?)?.toDouble() ?? 0.0,
  homeZoneDominance:
      (json['homeZoneDominance'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$PitchZoneEnumMap, k), (e as num).toDouble()),
      ) ??
      const <PitchZone, double>{},
  awayZoneDominance:
      (json['awayZoneDominance'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$PitchZoneEnumMap, k), (e as num).toDouble()),
      ) ??
      const <PitchZone, double>{},
  exploitationCounters:
      (json['exploitationCounters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const <String, int>{},
);

Map<String, dynamic> _$MatchDynamicsToJson(_MatchDynamics instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeMomentum': instance.homeMomentum,
      'awayMomentum': instance.awayMomentum,
      'homeConfidence': instance.homeConfidence,
      'awayConfidence': instance.awayConfidence,
      'homeFatigue': instance.homeFatigue,
      'awayFatigue': instance.awayFatigue,
      'homeDisciplinePressure': instance.homeDisciplinePressure,
      'awayDisciplinePressure': instance.awayDisciplinePressure,
      'homeZoneDominance': instance.homeZoneDominance.map(
        (k, e) => MapEntry(_$PitchZoneEnumMap[k]!, e),
      ),
      'awayZoneDominance': instance.awayZoneDominance.map(
        (k, e) => MapEntry(_$PitchZoneEnumMap[k]!, e),
      ),
      'exploitationCounters': instance.exploitationCounters,
    };

const _$PitchZoneEnumMap = {
  PitchZone.lw: 'lw',
  PitchZone.lhs: 'lhs',
  PitchZone.cf: 'cf',
  PitchZone.rhs: 'rhs',
  PitchZone.rw: 'rw',
  PitchZone.lm: 'lm',
  PitchZone.lcm: 'lcm',
  PitchZone.cm: 'cm',
  PitchZone.rcm: 'rcm',
  PitchZone.rm: 'rm',
  PitchZone.lb: 'lb',
  PitchZone.lcb: 'lcb',
  PitchZone.cb: 'cb',
  PitchZone.rcb: 'rcb',
  PitchZone.rb: 'rb',
};
