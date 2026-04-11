// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_intervention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerIntervention _$ManagerInterventionFromJson(Map<String, dynamic> json) =>
    _ManagerIntervention(
      id: (json['id'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      teamSide: $enumDecode(_$TeamSideEnumMap, json['teamSide']),
      command: $enumDecode(_$MatchCommandTypeEnumMap, json['command']),
      note: json['note'] as String?,
      expiresAtMinute: (json['expiresAtMinute'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ManagerInterventionToJson(
  _ManagerIntervention instance,
) => <String, dynamic>{
  'id': instance.id,
  'minute': instance.minute,
  'teamSide': _$TeamSideEnumMap[instance.teamSide]!,
  'command': _$MatchCommandTypeEnumMap[instance.command]!,
  'note': instance.note,
  'expiresAtMinute': instance.expiresAtMinute,
};

const _$TeamSideEnumMap = {TeamSide.home: 'home', TeamSide.away: 'away'};

const _$MatchCommandTypeEnumMap = {
  MatchCommandType.demandMore: 'demandMore',
  MatchCommandType.calmDown: 'calmDown',
  MatchCommandType.focus: 'focus',
  MatchCommandType.pushHigher: 'pushHigher',
  MatchCommandType.dropBack: 'dropBack',
  MatchCommandType.pressMore: 'pressMore',
  MatchCommandType.pressLess: 'pressLess',
  MatchCommandType.keepBall: 'keepBall',
  MatchCommandType.fasterTempo: 'fasterTempo',
  MatchCommandType.lowerTempo: 'lowerTempo',
  MatchCommandType.attackFlanks: 'attackFlanks',
  MatchCommandType.attackCenter: 'attackCenter',
  MatchCommandType.targetLeft: 'targetLeft',
  MatchCommandType.targetRight: 'targetRight',
  MatchCommandType.targetHalfSpaces: 'targetHalfSpaces',
  MatchCommandType.counterPress: 'counterPress',
  MatchCommandType.regroup: 'regroup',
  MatchCommandType.holdShape: 'holdShape',
  MatchCommandType.playDirect: 'playDirect',
  MatchCommandType.workBallIntoBox: 'workBallIntoBox',
  MatchCommandType.protectLead: 'protectLead',
  MatchCommandType.goForWinner: 'goForWinner',
  MatchCommandType.stayDisciplined: 'stayDisciplined',
  MatchCommandType.wasteTime: 'wasteTime',
};
