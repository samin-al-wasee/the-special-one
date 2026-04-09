// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleAssignment _$RoleAssignmentFromJson(Map<String, dynamic> json) =>
    _RoleAssignment(
      id: (json['id'] as num).toInt(),
      roleName: $enumDecode(_$RoleEnumMap, json['roleName']),
      duty: $enumDecode(_$DutyEnumMap, json['duty']),
    );

Map<String, dynamic> _$RoleAssignmentToJson(_RoleAssignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roleName': _$RoleEnumMap[instance.roleName]!,
      'duty': _$DutyEnumMap[instance.duty]!,
    };

const _$RoleEnumMap = {
  Role.shotStopper: 'shotStopper',
  Role.sweeperKeeper: 'sweeperKeeper',
  Role.fullBack: 'fullBack',
  Role.wingBack: 'wingBack',
  Role.invertedFullBack: 'invertedFullBack',
  Role.defensiveFullBack: 'defensiveFullBack',
  Role.centralDefender: 'centralDefender',
  Role.stopper: 'stopper',
  Role.ballPlayingDefender: 'ballPlayingDefender',
  Role.wideBack: 'wideBack',
  Role.anchor: 'anchor',
  Role.ballWinningMidfielder: 'ballWinningMidfielder',
  Role.regista: 'regista',
  Role.halfBack: 'halfBack',
  Role.boxToBoxMidfielder: 'boxToBoxMidfielder',
  Role.mezzala: 'mezzala',
  Role.carrilero: 'carrilero',
  Role.boxCrasher: 'boxCrasher',
  Role.shadowStriker: 'shadowStriker',
  Role.trequartista: 'trequartista',
  Role.enganche: 'enganche',
  Role.halfWinger: 'halfWinger',
  Role.winger: 'winger',
  Role.invertedWinger: 'invertedWinger',
  Role.widePlaymaker: 'widePlaymaker',
  Role.defensiveWinger: 'defensiveWinger',
  Role.targetMan: 'targetMan',
  Role.poacher: 'poacher',
  Role.secondaryStriker: 'secondaryStriker',
  Role.advancedForward: 'advancedForward',
  Role.falseNine: 'falseNine',
};

const _$DutyEnumMap = {
  Duty.defend: 'defend',
  Duty.support: 'support',
  Duty.attack: 'attack',
  Duty.balanced: 'balanced',
};
