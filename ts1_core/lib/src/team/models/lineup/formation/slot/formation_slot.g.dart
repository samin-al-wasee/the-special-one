// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formation_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormationSlot _$FormationSlotFromJson(Map<String, dynamic> json) =>
    _FormationSlot(
      id: (json['id'] as num).toInt(),
      slotId: $enumDecode(_$FormationSlotIdEnumMap, json['slotId']),
      position: $enumDecode(_$PositionEnumMap, json['position']),
      baseZone: $enumDecode(_$PitchZoneEnumMap, json['baseZone']),
      line: $enumDecode(_$FormationLineEnumMap, json['line']),
      lateralBand: $enumDecode(_$SlotLateralBandEnumMap, json['lateralBand']),
      verticalBand: $enumDecode(
        _$SlotVerticalBandEnumMap,
        json['verticalBand'],
      ),
      preferredPositions:
          (json['preferredPositions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PositionEnumMap, e))
              .toList() ??
          const [],
      adjacencySlots:
          (json['adjacencySlots'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FormationSlotIdEnumMap, e))
              .toList() ??
          const [],
      supportLinks:
          (json['supportLinks'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FormationSlotIdEnumMap, e))
              .toList() ??
          const [],
      attackingLaneAccess:
          (json['attackingLaneAccess'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FormationAreaEnumMap, e))
              .toList() ??
          const [],
      defensiveResponsibility:
          (json['defensiveResponsibility'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FormationAreaEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FormationSlotToJson(_FormationSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slotId': _$FormationSlotIdEnumMap[instance.slotId]!,
      'position': _$PositionEnumMap[instance.position]!,
      'baseZone': _$PitchZoneEnumMap[instance.baseZone]!,
      'line': _$FormationLineEnumMap[instance.line]!,
      'lateralBand': _$SlotLateralBandEnumMap[instance.lateralBand]!,
      'verticalBand': _$SlotVerticalBandEnumMap[instance.verticalBand]!,
      'preferredPositions': instance.preferredPositions
          .map((e) => _$PositionEnumMap[e]!)
          .toList(),
      'adjacencySlots': instance.adjacencySlots
          .map((e) => _$FormationSlotIdEnumMap[e]!)
          .toList(),
      'supportLinks': instance.supportLinks
          .map((e) => _$FormationSlotIdEnumMap[e]!)
          .toList(),
      'attackingLaneAccess': instance.attackingLaneAccess
          .map((e) => _$FormationAreaEnumMap[e]!)
          .toList(),
      'defensiveResponsibility': instance.defensiveResponsibility
          .map((e) => _$FormationAreaEnumMap[e]!)
          .toList(),
    };

const _$FormationSlotIdEnumMap = {
  FormationSlotId.gk: 'gk',
  FormationSlotId.rb: 'rb',
  FormationSlotId.rcb: 'rcb',
  FormationSlotId.cb: 'cb',
  FormationSlotId.lcb: 'lcb',
  FormationSlotId.lb: 'lb',
  FormationSlotId.rdm: 'rdm',
  FormationSlotId.dm: 'dm',
  FormationSlotId.ldm: 'ldm',
  FormationSlotId.rm: 'rm',
  FormationSlotId.rcm: 'rcm',
  FormationSlotId.cm: 'cm',
  FormationSlotId.lcm: 'lcm',
  FormationSlotId.lm: 'lm',
  FormationSlotId.ram: 'ram',
  FormationSlotId.am: 'am',
  FormationSlotId.lam: 'lam',
  FormationSlotId.rw: 'rw',
  FormationSlotId.lw: 'lw',
  FormationSlotId.rst: 'rst',
  FormationSlotId.st: 'st',
  FormationSlotId.lst: 'lst',
  FormationSlotId.cam: 'cam',
};

const _$PositionEnumMap = {
  Position.goalKeeper: 'goalKeeper',
  Position.rightBack: 'rightBack',
  Position.centerBack: 'centerBack',
  Position.leftBack: 'leftBack',
  Position.defensiveMidfielder: 'defensiveMidfielder',
  Position.centralMidfielder: 'centralMidfielder',
  Position.attackingMidfielder: 'attackingMidfielder',
  Position.rightMidfielder: 'rightMidfielder',
  Position.leftMidfielder: 'leftMidfielder',
  Position.rightWinger: 'rightWinger',
  Position.leftWinger: 'leftWinger',
  Position.striker: 'striker',
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

const _$FormationLineEnumMap = {
  FormationLine.goalkeeper: 'goalkeeper',
  FormationLine.defense: 'defense',
  FormationLine.midfield: 'midfield',
  FormationLine.wingback: 'wingback',
  FormationLine.attack: 'attack',
  FormationLine.attackMid: 'attackMid',
};

const _$SlotLateralBandEnumMap = {
  SlotLateralBand.leftWide: 'leftWide',
  SlotLateralBand.leftHalfSpace: 'leftHalfSpace',
  SlotLateralBand.center: 'center',
  SlotLateralBand.rightHalfSpace: 'rightHalfSpace',
  SlotLateralBand.rightWide: 'rightWide',
};

const _$SlotVerticalBandEnumMap = {
  SlotVerticalBand.deep: 'deep',
  SlotVerticalBand.mid: 'mid',
  SlotVerticalBand.high: 'high',
};

const _$FormationAreaEnumMap = {
  FormationArea.box: 'box',
  FormationArea.counterRest: 'counterRest',
  FormationArea.firstPress: 'firstPress',
  FormationArea.leftFlank: 'leftFlank',
  FormationArea.leftHalfSpace: 'leftHalfSpace',
  FormationArea.leftPressLane: 'leftPressLane',
  FormationArea.pressShadow: 'pressShadow',
  FormationArea.rightFlank: 'rightFlank',
  FormationArea.rightHalfSpace: 'rightHalfSpace',
  FormationArea.rightPressLane: 'rightPressLane',
  FormationArea.zone14: 'zone14',
  FormationArea.centralBuild: 'centralBuild',
  FormationArea.centralChannel: 'centralChannel',
  FormationArea.halfspaces: 'halfspaces',
};
