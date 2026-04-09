// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_tactic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamTactic _$TeamTacticFromJson(Map<String, dynamic> json) => _TeamTactic(
  id: (json['id'] as num).toInt(),
  buildUpStyle: $enumDecode(_$BuildUpStyleEnumMap, json['buildUpStyle']),
  tempo: $enumDecode(_$TempoEnumMap, json['tempo']),
  width: $enumDecode(_$WidthEnumMap, json['width']),
  finalThirdFocus: $enumDecode(
    _$FinalThirdFocusEnumMap,
    json['finalThirdFocus'],
  ),
  attackingFocus: $enumDecode(_$AttackingFocusEnumMap, json['attackingFocus']),
  defensiveLine: $enumDecode(_$DefensiveLineEnumMap, json['defensiveLine']),
  lineOfEngagement: $enumDecode(
    _$LineOfEngagementEnumMap,
    json['lineOfEngagement'],
  ),
  pressingIntensity: $enumDecode(
    _$PressingIntensityEnumMap,
    json['pressingIntensity'],
  ),
  defensiveWidth: $enumDecode(_$DefensiveWidthEnumMap, json['defensiveWidth']),
  markingStyle: $enumDecode(_$MarkingStyleEnumMap, json['markingStyle']),
  tacklingAggression: $enumDecode(
    _$TacklingAggressionEnumMap,
    json['tacklingAggression'],
  ),
  transitionOnWin: $enumDecode(
    _$TransitionOnWinEnumMap,
    json['transitionOnWin'],
  ),
  transitionOnLoss: $enumDecode(
    _$TransitionOnLossEnumMap,
    json['transitionOnLoss'],
  ),
  teamMentality: $enumDecode(_$TeamMentalityEnumMap, json['teamMentality']),
  passingRisk: $enumDecode(_$PassingRiskEnumMap, json['passingRisk']),
  dribblingRisk: $enumDecode(_$DribblingRiskEnumMap, json['dribblingRisk']),
  shootingPolicy: $enumDecode(_$ShootingPolicyEnumMap, json['shootingPolicy']),
  compactness: $enumDecode(_$CompactnessEnumMap, json['compactness']),
  verticalStretch: $enumDecode(
    _$VerticalStretchEnumMap,
    json['verticalStretch'],
  ),
  overloadFocus: $enumDecode(_$OverloadFocusEnumMap, json['overloadFocus']),
  setPieceAttack: $enumDecode(_$SetPieceAttackEnumMap, json['setPieceAttack']),
  setPieceDefense: $enumDecode(
    _$SetPieceDefenseEnumMap,
    json['setPieceDefense'],
  ),
  freeKickStrategy: $enumDecode(
    _$FreeKickStrategyEnumMap,
    json['freeKickStrategy'],
  ),
);

Map<String, dynamic> _$TeamTacticToJson(
  _TeamTactic instance,
) => <String, dynamic>{
  'id': instance.id,
  'buildUpStyle': _$BuildUpStyleEnumMap[instance.buildUpStyle]!,
  'tempo': _$TempoEnumMap[instance.tempo]!,
  'width': _$WidthEnumMap[instance.width]!,
  'finalThirdFocus': _$FinalThirdFocusEnumMap[instance.finalThirdFocus]!,
  'attackingFocus': _$AttackingFocusEnumMap[instance.attackingFocus]!,
  'defensiveLine': _$DefensiveLineEnumMap[instance.defensiveLine]!,
  'lineOfEngagement': _$LineOfEngagementEnumMap[instance.lineOfEngagement]!,
  'pressingIntensity': _$PressingIntensityEnumMap[instance.pressingIntensity]!,
  'defensiveWidth': _$DefensiveWidthEnumMap[instance.defensiveWidth]!,
  'markingStyle': _$MarkingStyleEnumMap[instance.markingStyle]!,
  'tacklingAggression':
      _$TacklingAggressionEnumMap[instance.tacklingAggression]!,
  'transitionOnWin': _$TransitionOnWinEnumMap[instance.transitionOnWin]!,
  'transitionOnLoss': _$TransitionOnLossEnumMap[instance.transitionOnLoss]!,
  'teamMentality': _$TeamMentalityEnumMap[instance.teamMentality]!,
  'passingRisk': _$PassingRiskEnumMap[instance.passingRisk]!,
  'dribblingRisk': _$DribblingRiskEnumMap[instance.dribblingRisk]!,
  'shootingPolicy': _$ShootingPolicyEnumMap[instance.shootingPolicy]!,
  'compactness': _$CompactnessEnumMap[instance.compactness]!,
  'verticalStretch': _$VerticalStretchEnumMap[instance.verticalStretch]!,
  'overloadFocus': _$OverloadFocusEnumMap[instance.overloadFocus]!,
  'setPieceAttack': _$SetPieceAttackEnumMap[instance.setPieceAttack]!,
  'setPieceDefense': _$SetPieceDefenseEnumMap[instance.setPieceDefense]!,
  'freeKickStrategy': _$FreeKickStrategyEnumMap[instance.freeKickStrategy]!,
};

const _$BuildUpStyleEnumMap = {
  BuildUpStyle.buildFromBack: 'buildFromBack',
  BuildUpStyle.mixedBuildUp: 'mixedBuildUp',
  BuildUpStyle.directProgression: 'directProgression',
  BuildUpStyle.longBall: 'longBall',
  BuildUpStyle.counterBuildUp: 'counterBuildUp',
};

const _$TempoEnumMap = {
  Tempo.veryLow: 'veryLow',
  Tempo.low: 'low',
  Tempo.balanced: 'balanced',
  Tempo.high: 'high',
  Tempo.veryHigh: 'veryHigh',
};

const _$WidthEnumMap = {
  Width.veryNarrow: 'veryNarrow',
  Width.narrow: 'narrow',
  Width.balanced: 'balanced',
  Width.wide: 'wide',
  Width.veryWide: 'veryWide',
};

const _$FinalThirdFocusEnumMap = {
  FinalThirdFocus.workBallIntoBox: 'workBallIntoBox',
  FinalThirdFocus.mixedAttacking: 'mixedAttacking',
  FinalThirdFocus.shootOnSight: 'shootOnSight',
  FinalThirdFocus.crossEarly: 'crossEarly',
  FinalThirdFocus.overlapWide: 'overlapWide',
  FinalThirdFocus.underlapInside: 'underlapInside',
  FinalThirdFocus.throughBallFocus: 'throughBallFocus',
  FinalThirdFocus.dribbleMore: 'dribbleMore',
  FinalThirdFocus.holdPossession: 'holdPossession',
};

const _$AttackingFocusEnumMap = {
  AttackingFocus.attackLeft: 'attackLeft',
  AttackingFocus.attackRight: 'attackRight',
  AttackingFocus.attackCentre: 'attackCentre',
  AttackingFocus.mixed: 'mixed',
  AttackingFocus.switchFlanksOften: 'switchFlanksOften',
  AttackingFocus.targetHalfSpaces: 'targetHalfSpaces',
};

const _$DefensiveLineEnumMap = {
  DefensiveLine.veryDeep: 'veryDeep',
  DefensiveLine.deep: 'deep',
  DefensiveLine.standard: 'standard',
  DefensiveLine.high: 'high',
  DefensiveLine.veryHigh: 'veryHigh',
};

const _$LineOfEngagementEnumMap = {
  LineOfEngagement.lowBlock: 'lowBlock',
  LineOfEngagement.midBlock: 'midBlock',
  LineOfEngagement.highBlock: 'highBlock',
  LineOfEngagement.fullPress: 'fullPress',
};

const _$PressingIntensityEnumMap = {
  PressingIntensity.veryLow: 'veryLow',
  PressingIntensity.low: 'low',
  PressingIntensity.balanced: 'balanced',
  PressingIntensity.high: 'high',
  PressingIntensity.extreme: 'extreme',
};

const _$DefensiveWidthEnumMap = {
  DefensiveWidth.veryNarrow: 'veryNarrow',
  DefensiveWidth.narrow: 'narrow',
  DefensiveWidth.balanced: 'balanced',
  DefensiveWidth.wide: 'wide',
  DefensiveWidth.veryWide: 'veryWide',
};

const _$MarkingStyleEnumMap = {
  MarkingStyle.zonal: 'zonal',
  MarkingStyle.mixed: 'mixed',
  MarkingStyle.tightManOriented: 'tightManOriented',
};

const _$TacklingAggressionEnumMap = {
  TacklingAggression.stayOnFeet: 'stayOnFeet',
  TacklingAggression.balanced: 'balanced',
  TacklingAggression.aggressive: 'aggressive',
  TacklingAggression.veryAggressive: 'veryAggressive',
};

const _$TransitionOnWinEnumMap = {
  TransitionOnWin.counterImmediately: 'counterImmediately',
  TransitionOnWin.progressSafely: 'progressSafely',
  TransitionOnWin.holdShape: 'holdShape',
  TransitionOnWin.feedPlaymaker: 'feedPlaymaker',
  TransitionOnWin.feedWinger: 'feedWinger',
  TransitionOnWin.goLongToStriker: 'goLongToStriker',
  TransitionOnWin.attackWeakSide: 'attackWeakSide',
};

const _$TransitionOnLossEnumMap = {
  TransitionOnLoss.counterpress: 'counterpress',
  TransitionOnLoss.delay: 'delay',
  TransitionOnLoss.regroup: 'regroup',
  TransitionOnLoss.tacticalFoul: 'tacticalFoul',
  TransitionOnLoss.dropDeepImmediately: 'dropDeepImmediately',
};

const _$TeamMentalityEnumMap = {
  TeamMentality.veryDefensive: 'veryDefensive',
  TeamMentality.defensive: 'defensive',
  TeamMentality.cautious: 'cautious',
  TeamMentality.balanced: 'balanced',
  TeamMentality.positive: 'positive',
  TeamMentality.attacking: 'attacking',
  TeamMentality.veryAttacking: 'veryAttacking',
};

const _$PassingRiskEnumMap = {
  PassingRisk.verySafe: 'verySafe',
  PassingRisk.safe: 'safe',
  PassingRisk.balanced: 'balanced',
  PassingRisk.risky: 'risky',
  PassingRisk.veryRisky: 'veryRisky',
};

const _$DribblingRiskEnumMap = {
  DribblingRisk.veryConservative: 'veryConservative',
  DribblingRisk.balanced: 'balanced',
  DribblingRisk.aggressive: 'aggressive',
};

const _$ShootingPolicyEnumMap = {
  ShootingPolicy.shootLess: 'shootLess',
  ShootingPolicy.balanced: 'balanced',
  ShootingPolicy.shootMore: 'shootMore',
  ShootingPolicy.shootAggressively: 'shootAggressively',
};

const _$CompactnessEnumMap = {
  Compactness.veryCompact: 'veryCompact',
  Compactness.compact: 'compact',
  Compactness.balanced: 'balanced',
  Compactness.loose: 'loose',
  Compactness.veryLoose: 'veryLoose',
};

const _$VerticalStretchEnumMap = {
  VerticalStretch.compressed: 'compressed',
  VerticalStretch.balanced: 'balanced',
  VerticalStretch.stretched: 'stretched',
};

const _$OverloadFocusEnumMap = {
  OverloadFocus.leftOverload: 'leftOverload',
  OverloadFocus.rightOverload: 'rightOverload',
  OverloadFocus.centralOverload: 'centralOverload',
  OverloadFocus.noSpecificOverload: 'noSpecificOverload',
};

const _$SetPieceAttackEnumMap = {
  SetPieceAttack.nearPostCorners: 'nearPostCorners',
  SetPieceAttack.farPostCorners: 'farPostCorners',
  SetPieceAttack.mixedCorners: 'mixedCorners',
  SetPieceAttack.shortCorners: 'shortCorners',
  SetPieceAttack.crowdGoalkeeper: 'crowdGoalkeeper',
  SetPieceAttack.edgeOfBoxSetup: 'edgeOfBoxSetup',
  SetPieceAttack.tallPlayerTargeting: 'tallPlayerTargeting',
  SetPieceAttack.reboundHunting: 'reboundHunting',
};

const _$SetPieceDefenseEnumMap = {
  SetPieceDefense.zonalMarking: 'zonalMarking',
  SetPieceDefense.mixedMarking: 'mixedMarking',
  SetPieceDefense.manMarking: 'manMarking',
  SetPieceDefense.leavePlayersUp: 'leavePlayersUp',
  SetPieceDefense.fullRetreat: 'fullRetreat',
  SetPieceDefense.counterSetup: 'counterSetup',
  SetPieceDefense.nearPostGuard: 'nearPostGuard',
};

const _$FreeKickStrategyEnumMap = {
  FreeKickStrategy.shootDirect: 'shootDirect',
  FreeKickStrategy.crossIntoBox: 'crossIntoBox',
  FreeKickStrategy.shortRoutine: 'shortRoutine',
  FreeKickStrategy.fastRestart: 'fastRestart',
};
