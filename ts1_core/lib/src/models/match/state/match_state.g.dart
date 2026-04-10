// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchState _$MatchStateFromJson(Map<String, dynamic> json) => _MatchState(
  status:
      $enumDecodeNullable(_$MatchStatusEnumMap, json['status']) ??
      MatchStatus.scheduled,
  clock: json['clock'] == null
      ? const MatchClock()
      : MatchClock.fromJson(json['clock'] as Map<String, dynamic>),
  currentPhaseIndex: (json['currentPhaseIndex'] as num?)?.toInt() ?? 0,
  currentPhaseType:
      $enumDecodeNullable(_$MatchPhaseTypeEnumMap, json['currentPhaseType']) ??
      MatchPhaseType.neutralPossession,
  currentPhaseState:
      $enumDecodeNullable(
        _$MatchPhaseStateEnumMap,
        json['currentPhaseState'],
      ) ??
      MatchPhaseState.neutralPossession,
  scoreline: json['scoreline'] == null
      ? const Scoreline()
      : Scoreline.fromJson(json['scoreline'] as Map<String, dynamic>),
  shootoutScore: json['shootoutScore'] == null
      ? const ShootoutScore()
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
      ? const TeamMatchStats()
      : TeamMatchStats.fromJson(json['homeStats'] as Map<String, dynamic>),
  awayStats: json['awayStats'] == null
      ? const TeamMatchStats()
      : TeamMatchStats.fromJson(json['awayStats'] as Map<String, dynamic>),
  dynamics: json['dynamics'] == null
      ? const MatchDynamics()
      : MatchDynamics.fromJson(json['dynamics'] as Map<String, dynamic>),
  matchupState: json['matchupState'] == null
      ? const MatchupState()
      : MatchupState.fromJson(json['matchupState'] as Map<String, dynamic>),
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

Map<String, dynamic> _$MatchStateToJson(
  _MatchState instance,
) => <String, dynamic>{
  'status': _$MatchStatusEnumMap[instance.status]!,
  'clock': instance.clock,
  'currentPhaseIndex': instance.currentPhaseIndex,
  'currentPhaseType': _$MatchPhaseTypeEnumMap[instance.currentPhaseType]!,
  'currentPhaseState': _$MatchPhaseStateEnumMap[instance.currentPhaseState]!,
  'scoreline': instance.scoreline,
  'shootoutScore': instance.shootoutScore,
  'currentInitiative': _$TeamSideEnumMap[instance.currentInitiative],
  'currentPossession': _$TeamSideEnumMap[instance.currentPossession],
  'currentTerritoryControl':
      _$TeamSideEnumMap[instance.currentTerritoryControl],
  'homeStats': instance.homeStats,
  'awayStats': instance.awayStats,
  'dynamics': instance.dynamics,
  'matchupState': instance.matchupState,
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
  MatchPhaseType.chance: 'chance',
  MatchPhaseType.outcome: 'outcome',
  MatchPhaseType.transition: 'transition',
  MatchPhaseType.setPiece: 'setPiece',
  MatchPhaseType.intervention: 'intervention',
  MatchPhaseType.specialIncident: 'specialIncident',
};

const _$MatchPhaseStateEnumMap = {
  MatchPhaseState.neutralPossession: 'neutralPossession',
  MatchPhaseState.buildUp: 'buildUp',
  MatchPhaseState.progression: 'progression',
  MatchPhaseState.finalThird: 'finalThird',
  MatchPhaseState.duel: 'duel',
  MatchPhaseState.chance: 'chance',
  MatchPhaseState.outcome: 'outcome',
  MatchPhaseState.transition: 'transition',
  MatchPhaseState.setPiecePreparation: 'setPiecePreparation',
  MatchPhaseState.setPieceDelivery: 'setPieceDelivery',
  MatchPhaseState.foulStop: 'foulStop',
  MatchPhaseState.stoppage: 'stoppage',
  MatchPhaseState.restart: 'restart',
  MatchPhaseState.turnover: 'turnover',
};

const _$TeamSideEnumMap = {TeamSide.home: 'home', TeamSide.away: 'away'};
