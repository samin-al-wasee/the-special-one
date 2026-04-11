import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';

part 'manager_intervention.freezed.dart';
part 'manager_intervention.g.dart';

@freezed
abstract class ManagerIntervention with _$ManagerIntervention {
  const factory ManagerIntervention({
    required int id,
    required int minute,
    required TeamSide teamSide,
    required MatchCommandType command,
    String? note,
    int? expiresAtMinute,
  }) = _ManagerIntervention;

  const ManagerIntervention._();

  factory ManagerIntervention.fromJson(Map<String, dynamic> json) =>
      _$ManagerInterventionFromJson(json);
}
