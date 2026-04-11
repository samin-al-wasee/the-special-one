import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';
import 'package:ts1_core/src/match/models/attack/attack_state.dart';

part 'phase_resolution_snapshot.freezed.dart';
part 'phase_resolution_snapshot.g.dart';

/// 📸 PHASE RESOLUTION SNAPSHOT — Atomic Phase Outcome Record
///
/// Captures the complete result of a single micro-phase simulation.
/// Used for phase history, replay, debugging, and analytics.
///
/// Each phase resolution contains:
/// - Temporal markers (phase index, match minute)
/// - Phase type & state (what happened, what state was entered)
/// - Tactical markers (possession, territory, initiative)
/// - Attacking information (if applicable)
/// - Outcome metrics (chance quality, if a chance occurred)
/// - Spatial information (zone information)
@freezed
abstract class PhaseResolutionSnapshot with _$PhaseResolutionSnapshot {
  const factory PhaseResolutionSnapshot({
    required int id,

    /// Sequential phase number in the match (0-indexed).
    required int phaseIndex,

    /// Match minute when phase occurred (0-120+).
    required int minute,

    /// Category of phase type (e.g., attacking, defensive, transition).
    required MatchPhaseType phaseType,

    /// Specific phase state/outcome (goal, chance missed, clearance, etc).
    required MatchPhaseState phaseState,

    /// Team with ball initiative during this phase.
    TeamSide? initiativeTeam,

    /// Team with possession during majority of this phase.
    TeamSide? possessionTeam,

    /// Team dominating territorial control during this phase.
    TeamSide? territoryTeam,

    /// Optional: Complete attack state if this was an attacking phase.
    /// INCLUDES: route (spatial), mode (tactical), context (situational).
    /// NULL if phase was not attacking (e.g., defensive organization, substitution).
    AttackState? attackState,

    /// Optional: Type of chance if a clear-cut chance occurred.
    ChanceType? chanceType,

    /// Optional: Outcome if a chance was taken (goal, saved, etc).
    ChanceOutcome? chanceOutcome,

    /// Optional: Quality metric of chance (0.0-1.0).
    double? chanceQuality,

    /// Optional: Primary pitch zone where phase activity occurred.
    PitchZone? zone,

    /// Whether this phase is marked as important for match narrative.
    @Default(false) bool isImportant,
  }) = _PhaseResolutionSnapshot;

  const PhaseResolutionSnapshot._();

  factory PhaseResolutionSnapshot.fromJson(Map<String, dynamic> json) =>
      _$PhaseResolutionSnapshotFromJson(json);
}
