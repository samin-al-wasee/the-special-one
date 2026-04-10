// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttackState _$AttackStateFromJson(Map<String, dynamic> json) => _AttackState(
  id: (json['id'] as num).toInt(),
  route: $enumDecode(_$AttackRouteEnumMap, json['route']),
  mode: $enumDecode(_$AttackModeEnumMap, json['mode']),
  context: $enumDecode(_$AttackContextEnumMap, json['context']),
  phaseCount: (json['phaseCount'] as num?)?.toInt() ?? 0,
  intensity: (json['intensity'] as num?)?.toDouble() ?? 0.5,
);

Map<String, dynamic> _$AttackStateToJson(_AttackState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route': _$AttackRouteEnumMap[instance.route]!,
      'mode': _$AttackModeEnumMap[instance.mode]!,
      'context': _$AttackContextEnumMap[instance.context]!,
      'phaseCount': instance.phaseCount,
      'intensity': instance.intensity,
    };

const _$AttackRouteEnumMap = {
  AttackRoute.leftFlank: 'leftFlank',
  AttackRoute.rightFlank: 'rightFlank',
  AttackRoute.centralProgression: 'centralProgression',
  AttackRoute.halfSpaces: 'halfSpaces',
  AttackRoute.directCentralLane: 'directCentralLane',
};

const _$AttackModeEnumMap = {
  AttackMode.possessionBuildUp: 'possessionBuildUp',
  AttackMode.quickTransition: 'quickTransition',
  AttackMode.directPlay: 'directPlay',
  AttackMode.counterAttack: 'counterAttack',
  AttackMode.highPressAttack: 'highPressAttack',
  AttackMode.setPlayExecution: 'setPlayExecution',
};

const _$AttackContextEnumMap = {
  AttackContext.normalOpenPlay: 'normalOpenPlay',
  AttackContext.cornerKick: 'cornerKick',
  AttackContext.directFreeKick: 'directFreeKick',
  AttackContext.indirectFreeKick: 'indirectFreeKick',
  AttackContext.throwIn: 'throwIn',
  AttackContext.goalKick: 'goalKick',
  AttackContext.defensiveTransition: 'defensiveTransition',
  AttackContext.secondBallRecovery: 'secondBallRecovery',
  AttackContext.opponentsError: 'opponentsError',
  AttackContext.transitionChaos: 'transitionChaos',
  AttackContext.setpieceSequence: 'setpieceSequence',
};
