import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/position.dart';

part 'formation_slot.freezed.dart';
part 'formation_slot.g.dart';

@freezed
abstract class FormationSlot with _$FormationSlot {
  const factory FormationSlot({
    required int id,
    required String slotId,
    required String baseZone,
    required String line,
    required String lateralBand,
    required String verticalBand,
    @Default([]) List<Position> preferredPositions,
    @Default([]) List<String> adjacencySlots,
    @Default([]) List<String> supportLinks,
    @Default([]) List<String> attackingLaneAccess,
    @Default([]) List<String> defensiveResponsibility,
  }) = _FormationSlot;

  factory FormationSlot.fromJson(Map<String, dynamic> json) =>
      _$FormationSlotFromJson(json);
}
