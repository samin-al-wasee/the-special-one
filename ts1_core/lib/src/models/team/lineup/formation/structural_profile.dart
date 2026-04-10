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
    @Default(0.5) double widthCoverage,
    @Default(0.5) double centralDensity,
    @Default(0.5) double supportNetworkQuality,
    @Default(0.5) double boxPresence,
    @Default(0.5) double restDefenseStability,
    @Default(0.5) double pressShapeCohesion,
    @Default(0.5) double transitionProtection,
    @Default(0.5) double halfSpaceAccess,
    @Default(0.5) double flankIsolationRisk,
    @Default(0.5) double slotFitScore,
    @Default(0.5) double roleCoherence,
  }) = _StructuralProfile;

  factory StructuralProfile.fromJson(Map<String, dynamic> json) =>
      _$StructuralProfileFromJson(json);
}
