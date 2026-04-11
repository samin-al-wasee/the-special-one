import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/team/models/lineup/slot_assignment/role_assignment/role_assignment.dart';
import 'package:ts1_core/src/team/models/lineup/formation/slot/formation_slot.dart';
import 'package:ts1_core/src/player/models/player.dart';

part 'lineup_slot_assignment.freezed.dart';
part 'lineup_slot_assignment.g.dart';

@freezed
abstract class LineupSlotAssignment with _$LineupSlotAssignment {
  /// Mapping between one formation slot and one player role assignment.
  const factory LineupSlotAssignment({
    required int id,
    required FormationSlot formationSlot,
    required Player player,
    required RoleAssignment roleAssignment,
  }) = _LineupSlotAssignment;

  factory LineupSlotAssignment.fromJson(Map<String, dynamic> json) =>
      _$LineupSlotAssignmentFromJson(json);
}
