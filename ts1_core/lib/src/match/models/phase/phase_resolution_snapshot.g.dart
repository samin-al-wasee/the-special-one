// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phase_resolution_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhaseResolutionSnapshot _$PhaseResolutionSnapshotFromJson(
  Map<String, dynamic> json,
) => _PhaseResolutionSnapshot(
  id: (json['id'] as num).toInt(),
  phaseIndex: (json['phaseIndex'] as num).toInt(),
  minute: (json['minute'] as num).toInt(),
  phaseType: $enumDecode(_$MatchPhaseTypeEnumMap, json['phaseType']),
  initiativeTeam: $enumDecodeNullable(
    _$TeamSideEnumMap,
    json['initiativeTeam'],
  ),
  possessionTeam: $enumDecodeNullable(
    _$TeamSideEnumMap,
    json['possessionTeam'],
  ),
  territoryTeam: $enumDecodeNullable(_$TeamSideEnumMap, json['territoryTeam']),
  attackState: json['attackState'] == null
      ? null
      : AttackState.fromJson(json['attackState'] as Map<String, dynamic>),
  chanceType: $enumDecodeNullable(_$ChanceTypeEnumMap, json['chanceType']),
  chanceOutcome: $enumDecodeNullable(
    _$ChanceOutcomeEnumMap,
    json['chanceOutcome'],
  ),
  chanceQuality: (json['chanceQuality'] as num?)?.toDouble(),
  zone: $enumDecodeNullable(_$PitchZoneEnumMap, json['zone']),
  isImportant: json['isImportant'] as bool? ?? false,
);

Map<String, dynamic> _$PhaseResolutionSnapshotToJson(
  _PhaseResolutionSnapshot instance,
) => <String, dynamic>{
  'id': instance.id,
  'phaseIndex': instance.phaseIndex,
  'minute': instance.minute,
  'phaseType': _$MatchPhaseTypeEnumMap[instance.phaseType]!,
  'initiativeTeam': _$TeamSideEnumMap[instance.initiativeTeam],
  'possessionTeam': _$TeamSideEnumMap[instance.possessionTeam],
  'territoryTeam': _$TeamSideEnumMap[instance.territoryTeam],
  'attackState': instance.attackState,
  'chanceType': _$ChanceTypeEnumMap[instance.chanceType],
  'chanceOutcome': _$ChanceOutcomeEnumMap[instance.chanceOutcome],
  'chanceQuality': instance.chanceQuality,
  'zone': _$PitchZoneEnumMap[instance.zone],
  'isImportant': instance.isImportant,
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

const _$ChanceTypeEnumMap = {
  ChanceType.lowXgLongShot: 'lowXgLongShot',
  ChanceType.highXgCentralShot: 'highXgCentralShot',
  ChanceType.cutback: 'cutback',
  ChanceType.throughBallOneVsOne: 'throughBallOneVsOne',
  ChanceType.closeRangeTapIn: 'closeRangeTapIn',
  ChanceType.farPostHeader: 'farPostHeader',
  ChanceType.nearPostHeader: 'nearPostHeader',
  ChanceType.backPostHeader: 'backPostHeader',
  ChanceType.wideCrossHeader: 'wideCrossHeader',
  ChanceType.blockedShot: 'blockedShot',
  ChanceType.scramble: 'scramble',
  ChanceType.rebound: 'rebound',
  ChanceType.edgeOfBoxShot: 'edgeOfBoxShot',
  ChanceType.directFreeKick: 'directFreeKick',
  ChanceType.indirectFreeKick: 'indirectFreeKick',
  ChanceType.penalty: 'penalty',
  ChanceType.corner: 'corner',
  ChanceType.cornerSecondBall: 'cornerSecondBall',
  ChanceType.transitionBreakaway: 'transitionBreakaway',
  ChanceType.overloadCombination: 'overloadCombination',
  ChanceType.dribbleIsolation: 'dribbleIsolation',
};

const _$ChanceOutcomeEnumMap = {
  ChanceOutcome.goal: 'goal',
  ChanceOutcome.save: 'save',
  ChanceOutcome.block: 'block',
  ChanceOutcome.offTarget: 'offTarget',
  ChanceOutcome.woodwork: 'woodwork',
  ChanceOutcome.rebound: 'rebound',
  ChanceOutcome.deflectionCorner: 'deflectionCorner',
  ChanceOutcome.claimedByKeeper: 'claimedByKeeper',
  ChanceOutcome.offside: 'offside',
  ChanceOutcome.foulWon: 'foulWon',
  ChanceOutcome.turnover: 'turnover',
  ChanceOutcome.clearance: 'clearance',
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
