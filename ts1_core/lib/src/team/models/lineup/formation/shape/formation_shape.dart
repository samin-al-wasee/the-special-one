import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/team/models/lineup/formation/slot/formation_slot.dart';

part 'formation_shape.freezed.dart';
part 'formation_shape.g.dart';

@freezed
abstract class FormationShape with _$FormationShape {
  const factory FormationShape({
    required int id,
    required String code,
    required List<FormationSlot> slotDefinitions,
    @Default({}) Map<String, double> structuralTags,
  }) = _FormationShape;

  factory FormationShape.fromJson(Map<String, dynamic> json) =>
      _$FormationShapeFromJson(json);

  const FormationShape._();

  /// Get all slot IDs in this formation.
  List<FormationSlotId> slotIds() => [
    for (final slot in slotDefinitions) slot.slotId,
  ];

  /// Get a slot by its ID, or null if not found.
  FormationSlot? slotById(FormationSlotId slotId) {
    for (final slot in slotDefinitions) {
      if (slot.slotId == slotId) {
        return slot;
      }
    }
    return null;
  }
}
