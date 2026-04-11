import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/match/pitch_zone.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';

part 'formation_slot.freezed.dart';
part 'formation_slot.g.dart';

@freezed
abstract class FormationSlot with _$FormationSlot {
  const factory FormationSlot({
    required int id,
    required String slotId,
    required PitchZone baseZone,
    required String line,
    required SlotLateralBand lateralBand,
    required SlotVerticalBand verticalBand,
    @Default([]) List<Position> preferredPositions,
    @Default([]) List<String> adjacencySlots,
    @Default([]) List<String> supportLinks,
    @Default([]) List<String> attackingLaneAccess,
    @Default([]) List<String> defensiveResponsibility,
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

enum SlotLateralBand {
  leftWide,
  leftHalfSpace,
  center,
  rightHalfSpace,
  rightWide,
}

enum SlotVerticalBand { deep, mid, high }
