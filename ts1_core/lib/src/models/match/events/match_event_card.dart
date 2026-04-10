import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/match_enums.dart';
import 'package:ts1_core/src/models/match/attack/attack_state.dart';

part 'match_event_card.freezed.dart';
part 'match_event_card.g.dart';

/// 🎫 MATCH EVENT CARD — Discrete Match Event Record
///
/// Represents a significant event that occurred during a match phase.
/// Used for event logging, replay, and analytics.
///
/// Events are tagged with:
/// - Temporal information (minute, phase)
/// - Spatial information (zone, pitch region)
/// - Tactical information (attack state if applicable)
/// - Quality metrics (chance quality, outcome)
@freezed
abstract class MatchEventCard with _$MatchEventCard {
  const factory MatchEventCard({
    required int id,

    /// Match minute when event occurred (0-120+).
    required int minute,

    /// Event summary title (e.g., "Good Chance Missed", "Goal", "Tackle").
    required String title,

    /// Detailed description of what happened.
    required String description,

    /// Phase type during which event occurred.
    required MatchPhaseType phaseType,

    /// Team side (home or away) involved in event.
    required TeamSide teamSide,

    /// Optional: Pitch zone where event occurred.
    PitchZone? zone,

    /// Optional: Complete attack state if event is attacking action.
    /// NULL if event is not an attack (e.g., defensive error, substitution).
    /// Includes route (WHERE), mode (HOW), context (WHY).
    AttackState? attackState,

    /// Optional: Type of chance if this is a shot/chance event.
    ChanceType? chanceType,

    /// Optional: Outcome of chance (goal, saved, wide, etc).
    ChanceOutcome? chanceOutcome,

    /// Optional: Quality rating of chance (0.0-1.0; higher = more dangerous).
    double? chanceQuality,

    /// Optional: Tactical insight or analysis about the event.
    String? tacticalInsight,

    /// Whether this event is marked as major (goal, key chance, sending off, etc).
    @Default(false) bool isMajor,
  }) = _MatchEventCard;

  const MatchEventCard._();

  factory MatchEventCard.fromJson(Map<String, dynamic> json) =>
      _$MatchEventCardFromJson(json);
}
