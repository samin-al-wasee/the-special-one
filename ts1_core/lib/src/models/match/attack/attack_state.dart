import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/match_enums.dart';

part 'attack_state.freezed.dart';
part 'attack_state.g.dart';

/// 🎯 ATTACK STATE — Composite Attack System Model
///
/// Represents a **complete snapshot of an attacking phase** combining
/// all three layers of the attack system.
///
/// This model is used during match simulation to track how an attack
/// is progressing in terms of spatial position, tactical method, and
/// situational origin.
///
/// ## Architecture
///
/// **Three-Layer Design:**
/// 1. **Route** — Spatial Layer (WHERE on pitch)
/// 2. **Mode** — Tactical Intent Layer (HOW team is attacking)
/// 3. **Context** — Event/Situation Layer (WHY attack started)
///
/// ## Usage in Simulation
///
/// Per phase tick, the match engine:
/// - Evaluates attacking team's tactical identity
/// - Matches against defending profile
/// - Resolves into AttackState (route + mode + context)
/// - Calculates outcome probability (shot, pass, turnover, foul)
/// - Updates match state
///
/// ## Integration Points
///
/// - **PhaseResolutionSnapshot.attackState** — stores phase outcome
/// - **MatchEventCard.attackState** — records attacking event
/// - **Match simulation engine** — evaluates & updates per tick
/// - **Tactical AI** — recommends mode/route for next phase
/// - **Analytics** — identifies attacking patterns & efficiency
///
/// ## Mutability
///
/// AttackState is immutable (Freezed). Updates via copyWith pattern.
@freezed
abstract class AttackState with _$AttackState {
  const factory AttackState({
    /// Where the ball is progressing spatially.
    /// Determines pitch zones available for play.
    required AttackRoute route,

    /// How the attacking team is executing tactically.
    /// Determines tempo, passing style, and risk appetite.
    required AttackMode mode,

    /// Why/where the attack originated from.
    /// Determines defensive organization level and tactical expectations.
    required AttackContext context,

    /// Optional: How many phases has this attack sequence lasted?
    /// Useful for tracking attack breakdown/continuation.
    @Default(0) int phaseCount,

    /// Optional: Intensity/quality rating of the attack (0.0 to 1.0).
    /// Higher means more dangerous, better positioned, higher shot probability.
    @Default(0.5) double intensity,
  }) = _AttackState;

  const AttackState._();

  factory AttackState.fromJson(Map<String, dynamic> json) =>
      _$AttackStateFromJson(json);

  /// Display summary of the attack state.
  /// Format: "LEFT_FLANK + POSSESSION_BUILD + OPEN_PLAY (2 phases, 0.7 intensity)"
  String summary() {
    final routeStr = route.toString().split('.').last;
    final modeStr = mode.toString().split('.').last;
    final contextStr = context.toString().split('.').last;
    return '$routeStr + $modeStr + $contextStr ($phaseCount phases, ${intensity.toStringAsFixed(2)} intensity)';
  }
}
