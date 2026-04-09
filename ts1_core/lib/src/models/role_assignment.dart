import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/duty.dart';
import 'package:ts1_core/src/enums/role.dart';

part 'role_assignment.freezed.dart';
part 'role_assignment.g.dart';

@freezed
abstract class RoleAssignment with _$RoleAssignment {
  /// Role intent of a starter inside a slot.
  const factory RoleAssignment({
    required int id,
    required Role roleName,
    required Duty duty,
  }) = _RoleAssignment;

  factory RoleAssignment.fromJson(Map<String, dynamic> json) =>
      _$RoleAssignmentFromJson(json);
}
