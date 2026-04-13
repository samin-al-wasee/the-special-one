// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formation_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormationSlot _$FormationSlotFromJson(Map<String, dynamic> json) =>
    _FormationSlot(
      id: (json['id'] as num).toInt(),
      slotId: json['slotId'] as String,
      baseZone: $enumDecode(_$PitchZoneEnumMap, json['baseZone']),
      line: json['line'] as String,
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
              ?.map((e) => e as String)
              .toList() ??
          const [],
      supportLinks:
          (json['supportLinks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attackingLaneAccess:
          (json['attackingLaneAccess'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      defensiveResponsibility:
          (json['defensiveResponsibility'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FormationSlotToJson(_FormationSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slotId': instance.slotId,
      'baseZone': _$PitchZoneEnumMap[instance.baseZone]!,
      'line': instance.line,
      'lateralBand': _$SlotLateralBandEnumMap[instance.lateralBand]!,
      'verticalBand': _$SlotVerticalBandEnumMap[instance.verticalBand]!,
      'preferredPositions': instance.preferredPositions
          .map((e) => _$PositionEnumMap[e]!)
          .toList(),
      'adjacencySlots': instance.adjacencySlots,
      'supportLinks': instance.supportLinks,
      'attackingLaneAccess': instance.attackingLaneAccess,
      'defensiveResponsibility': instance.defensiveResponsibility,
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
