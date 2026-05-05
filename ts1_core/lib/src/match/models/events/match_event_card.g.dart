// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_event_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchEventCard _$MatchEventCardFromJson(Map<String, dynamic> json) =>
    _MatchEventCard(
      id: (json['id'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      phaseType: $enumDecode(_$MatchPhaseTypeEnumMap, json['phaseType']),
      teamSide: $enumDecode(_$TeamSideEnumMap, json['teamSide']),
      zone: $enumDecodeNullable(_$PitchZoneEnumMap, json['zone']),
      attackState: json['attackState'] == null
          ? null
          : AttackState.fromJson(json['attackState'] as Map<String, dynamic>),
      chanceType: $enumDecodeNullable(_$ChanceTypeEnumMap, json['chanceType']),
      chanceOutcome: $enumDecodeNullable(
        _$ChanceOutcomeEnumMap,
        json['chanceOutcome'],
      ),
      chanceQuality: (json['chanceQuality'] as num?)?.toDouble(),
      tacticalInsight: json['tacticalInsight'] as String?,
      isMajor: json['isMajor'] as bool? ?? false,
    );

Map<String, dynamic> _$MatchEventCardToJson(_MatchEventCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minute': instance.minute,
      'title': instance.title,
      'description': instance.description,
      'phaseType': _$MatchPhaseTypeEnumMap[instance.phaseType]!,
      'teamSide': _$TeamSideEnumMap[instance.teamSide]!,
      'zone': _$PitchZoneEnumMap[instance.zone],
      'attackState': instance.attackState,
      'chanceType': _$ChanceTypeEnumMap[instance.chanceType],
      'chanceOutcome': _$ChanceOutcomeEnumMap[instance.chanceOutcome],
      'chanceQuality': instance.chanceQuality,
      'tacticalInsight': instance.tacticalInsight,
      'isMajor': instance.isMajor,
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
