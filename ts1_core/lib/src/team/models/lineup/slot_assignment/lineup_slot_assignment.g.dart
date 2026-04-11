// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_slot_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineupSlotAssignment _$LineupSlotAssignmentFromJson(
  Map<String, dynamic> json,
) => _LineupSlotAssignment(
  id: (json['id'] as num).toInt(),
  formationSlot: FormationSlot.fromJson(
    json['formationSlot'] as Map<String, dynamic>,
  ),
  player: Player.fromJson(json['player'] as Map<String, dynamic>),
  roleAssignment: RoleAssignment.fromJson(
    json['roleAssignment'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LineupSlotAssignmentToJson(
  _LineupSlotAssignment instance,
) => <String, dynamic>{
  'id': instance.id,
  'formationSlot': instance.formationSlot,
  'player': instance.player,
  'roleAssignment': instance.roleAssignment,
};
