import 'package:freezed_annotation/freezed_annotation.dart';

part 'structural_profile.freezed.dart';
part 'structural_profile.g.dart';

/// Engine-facing structural summary derived from formation + lineup + role expression.
///
/// All fields are normalized to 0..1.
@freezed
abstract class StructuralProfile with _$StructuralProfile {
  const factory StructuralProfile({
    required int id,
    required double widthCoverage,
    required double centralDensity,
    required double supportNetworkQuality,
    required double boxPresence,
    required double restDefenseStability,
    required double pressShapeCohesion,
    required double transitionProtection,
    required double halfSpaceAccess,
    required double flankIsolationRisk,
    required double slotFitScore,
    required double roleCoherence,
  }) = _StructuralProfile;

  factory StructuralProfile.fromJson(Map<String, dynamic> json) =>
      _$StructuralProfileFromJson(json);
}
