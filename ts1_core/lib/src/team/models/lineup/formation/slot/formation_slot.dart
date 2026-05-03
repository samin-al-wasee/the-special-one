import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/match/pitch_zone.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';
import 'package:ts1_core/src/core/enums/team/formation/formation_area.dart';
import 'package:ts1_core/src/core/enums/team/formation/formation_line.dart';
import 'package:ts1_core/src/core/enums/team/formation/formation_slot_id.dart';
import 'package:ts1_core/src/core/enums/team/formation/slot_lateral_band.dart';
import 'package:ts1_core/src/core/enums/team/formation/slot_vertical_band.dart';

export 'package:ts1_core/src/core/enums/team/formation/formation_area.dart';
export 'package:ts1_core/src/core/enums/team/formation/formation_line.dart';
export 'package:ts1_core/src/core/enums/team/formation/formation_slot_id.dart';
export 'package:ts1_core/src/core/enums/team/formation/slot_lateral_band.dart';
export 'package:ts1_core/src/core/enums/team/formation/slot_vertical_band.dart';

part 'formation_slot.freezed.dart';
part 'formation_slot.g.dart';

/// A slot in a formation, representing a tactical position (e.g., LB, ST).
/// The `position` field is the intended tactical role for this slot (e.g., Position.leftBack).
@freezed
abstract class FormationSlot with _$FormationSlot {
  const factory FormationSlot({
    required int id,
    required FormationSlotId slotId,
    required Position position, // NEW: tactical position for this slot
    required PitchZone baseZone,
    required FormationLine line,
    required SlotLateralBand lateralBand,
    required SlotVerticalBand verticalBand,
    @Default([]) List<Position> preferredPositions,
    @Default([]) List<FormationSlotId> adjacencySlots,
    @Default([]) List<FormationSlotId> supportLinks,
    @Default([]) List<FormationArea> attackingLaneAccess,
    @Default([]) List<FormationArea> defensiveResponsibility,
  }) = _FormationSlot;

  factory FormationSlot.fromJson(Map<String, dynamic> json) =>
      _$FormationSlotFromJson(json);

  const FormationSlot._();

  /// Canonical mapping from base pitch zone to lateral band.
  static SlotLateralBand lateralBandForZone(PitchZone zone) {
    switch (zone) {
      case PitchZone.lw:
      case PitchZone.lm:
      case PitchZone.lb:
        return SlotLateralBand.leftWide;
      case PitchZone.lhs:
      case PitchZone.lcm:
      case PitchZone.lcb:
        return SlotLateralBand.leftHalfSpace;
      case PitchZone.cf:
      case PitchZone.cm:
      case PitchZone.cb:
        return SlotLateralBand.center;
      case PitchZone.rhs:
      case PitchZone.rcm:
      case PitchZone.rcb:
        return SlotLateralBand.rightHalfSpace;
      case PitchZone.rw:
      case PitchZone.rm:
      case PitchZone.rb:
        return SlotLateralBand.rightWide;
    }
  }

  /// Canonical mapping from base pitch zone to vertical band.
  static SlotVerticalBand verticalBandForZone(PitchZone zone) {
    switch (zone) {
      case PitchZone.lw:
      case PitchZone.lhs:
      case PitchZone.cf:
      case PitchZone.rhs:
      case PitchZone.rw:
        return SlotVerticalBand.high;
      case PitchZone.lm:
      case PitchZone.lcm:
      case PitchZone.cm:
      case PitchZone.rcm:
      case PitchZone.rm:
        return SlotVerticalBand.mid;
      case PitchZone.lb:
      case PitchZone.lcb:
      case PitchZone.cb:
      case PitchZone.rcb:
      case PitchZone.rb:
        return SlotVerticalBand.deep;
    }
  }

  bool hasCanonicalBandMapping() {
    return lateralBand == lateralBandForZone(baseZone) &&
        verticalBand == verticalBandForZone(baseZone);
  }
}
