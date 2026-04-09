// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formation_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormationSlot _$FormationSlotFromJson(Map<String, dynamic> json) =>
    _FormationSlot(
      id: (json['id'] as num).toInt(),
      slotId: json['slotId'] as String,
      baseZone: json['baseZone'] as String,
      line: json['line'] as String,
      lateralBand: json['lateralBand'] as String,
      verticalBand: json['verticalBand'] as String,
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
      'baseZone': instance.baseZone,
      'line': instance.line,
      'lateralBand': instance.lateralBand,
      'verticalBand': instance.verticalBand,
      'preferredPositions': instance.preferredPositions
          .map((e) => _$PositionEnumMap[e]!)
          .toList(),
      'adjacencySlots': instance.adjacencySlots,
      'supportLinks': instance.supportLinks,
      'attackingLaneAccess': instance.attackingLaneAccess,
      'defensiveResponsibility': instance.defensiveResponsibility,
    };

const _$PositionEnumMap = {
  Position.goalKeeper: 'goalKeeper',
  Position.rightBack: 'rightBack',
  Position.centerBack: 'centerBack',
  Position.leftBack: 'leftBack',
  Position.defensiveMidfielder: 'defensiveMidfielder',
  Position.centralMidfielder: 'centralMidfielder',
  Position.attackingMidfielder: 'attackingMidfielder',
  Position.rightWinger: 'rightWinger',
  Position.leftWinger: 'leftWinger',
  Position.striker: 'striker',
};
