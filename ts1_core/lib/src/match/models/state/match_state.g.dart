// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchState _$MatchStateFromJson(Map<String, dynamic> json) => _MatchState(
  id: (json['id'] as num).toInt(),
  status:
      $enumDecodeNullable(_$MatchStatusEnumMap, json['status']) ??
      MatchStatus.scheduled,
  clock: json['clock'] == null
      ? const MatchClock(id: 0)
      : MatchClock.fromJson(json['clock'] as Map<String, dynamic>),
  currentPhaseIndex: (json['currentPhaseIndex'] as num?)?.toInt() ?? 0,
  currentPhaseType:
      $enumDecodeNullable(_$MatchPhaseTypeEnumMap, json['currentPhaseType']) ??
      MatchPhaseType.neutralPossession,
  scoreline: json['scoreline'] == null
      ? const Scoreline(id: 0)
      : Scoreline.fromJson(json['scoreline'] as Map<String, dynamic>),
  shootoutScore: json['shootoutScore'] == null
      ? const ShootoutScore(id: 0)
      : ShootoutScore.fromJson(json['shootoutScore'] as Map<String, dynamic>),
  currentInitiative: $enumDecodeNullable(
    _$TeamSideEnumMap,
    json['currentInitiative'],
  ),
  currentPossession: $enumDecodeNullable(
    _$TeamSideEnumMap,
    json['currentPossession'],
  ),
  currentTerritoryControl: $enumDecodeNullable(
    _$TeamSideEnumMap,
    json['currentTerritoryControl'],
  ),
  homeStats: json['homeStats'] == null
      ? const TeamMatchStats(id: 0)
      : TeamMatchStats.fromJson(json['homeStats'] as Map<String, dynamic>),
  awayStats: json['awayStats'] == null
      ? const TeamMatchStats(id: 0)
      : TeamMatchStats.fromJson(json['awayStats'] as Map<String, dynamic>),
  dynamics: MatchDynamics.fromJson(json['dynamics'] as Map<String, dynamic>),
  phaseHistory:
      (json['phaseHistory'] as List<dynamic>?)
          ?.map(
            (e) => PhaseResolutionSnapshot.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <PhaseResolutionSnapshot>[],
  eventCards:
      (json['eventCards'] as List<dynamic>?)
          ?.map((e) => MatchEventCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MatchEventCard>[],
  tacticalInsights:
      (json['tacticalInsights'] as List<dynamic>?)
          ?.map((e) => TacticalInsight.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TacticalInsight>[],
  substitutions:
      (json['substitutions'] as List<dynamic>?)
          ?.map((e) => SubstitutionRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SubstitutionRecord>[],
  interventions:
      (json['interventions'] as List<dynamic>?)
          ?.map((e) => ManagerIntervention.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ManagerIntervention>[],
);

Map<String, dynamic> _$MatchStateToJson(_MatchState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$MatchStatusEnumMap[instance.status]!,
      'clock': instance.clock,
      'currentPhaseIndex': instance.currentPhaseIndex,
      'currentPhaseType': _$MatchPhaseTypeEnumMap[instance.currentPhaseType]!,
      'scoreline': instance.scoreline,
      'shootoutScore': instance.shootoutScore,
      'currentInitiative': _$TeamSideEnumMap[instance.currentInitiative],
      'currentPossession': _$TeamSideEnumMap[instance.currentPossession],
      'currentTerritoryControl':
          _$TeamSideEnumMap[instance.currentTerritoryControl],
      'homeStats': instance.homeStats,
      'awayStats': instance.awayStats,
      'dynamics': instance.dynamics,
      'phaseHistory': instance.phaseHistory,
      'eventCards': instance.eventCards,
      'tacticalInsights': instance.tacticalInsights,
      'substitutions': instance.substitutions,
      'interventions': instance.interventions,
    };

const _$MatchStatusEnumMap = {
  MatchStatus.scheduled: 'scheduled',
  MatchStatus.postponed: 'postponed',
  MatchStatus.ready: 'ready',
  MatchStatus.firstHalf: 'firstHalf',
  MatchStatus.halfTime: 'halfTime',
  MatchStatus.secondHalf: 'secondHalf',
  MatchStatus.extraTime: 'extraTime',
  MatchStatus.extraTimeHalfTime: 'extraTimeHalfTime',
  MatchStatus.penalties: 'penalties',
  MatchStatus.paused: 'paused',
  MatchStatus.suspended: 'suspended',
  MatchStatus.fullTime: 'fullTime',
  MatchStatus.abandoned: 'abandoned',
};

const _$MatchPhaseTypeEnumMap = {
  MatchPhaseType.neutralPossession: 'neutralPossession',
  MatchPhaseType.defensiveOrganization: 'defensiveOrganization',
  MatchPhaseType.buildUp: 'buildUp',
  MatchPhaseType.progression: 'progression',
  MatchPhaseType.finalThird: 'finalThird',
  MatchPhaseType.duel: 'duel',
  MatchPhaseType.chance: 'chance',
  MatchPhaseType.setPiecePreparation: 'setPiecePreparation',
  MatchPhaseType.setPieceDelivery: 'setPieceDelivery',
  MatchPhaseType.outcome: 'outcome',
  MatchPhaseType.transition: 'transition',
  MatchPhaseType.turnover: 'turnover',
  MatchPhaseType.foulStop: 'foulStop',
  MatchPhaseType.stoppage: 'stoppage',
  MatchPhaseType.restart: 'restart',
  MatchPhaseType.intervention: 'intervention',
  MatchPhaseType.specialIncident: 'specialIncident',
};

const _$TeamSideEnumMap = {TeamSide.home: 'home', TeamSide.away: 'away'};
