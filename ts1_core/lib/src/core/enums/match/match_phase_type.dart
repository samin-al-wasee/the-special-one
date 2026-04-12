/// High-level simulation phase categories for the match engine.
///
/// A [MatchPhaseType] describes the macro football situation currently being
/// simulated (for example buildup, transition, or set piece). It is intended to
/// answer: "What kind of phase is this?"
///
/// Typical flow example (not mandatory):
/// neutralPossession -> buildUp -> progression -> finalThird -> chance
/// -> outcome -> transition -> buildUp
///
/// Notes:
/// - This enum models broad context.
/// - Fine-grained labels should be expressed via `MatchPhaseState`.
enum MatchPhaseType {
  /// Possession is stable and relatively low-threat.
  ///
  /// Example: midfield circulation without immediate penetration.
  neutralPossession,

  /// Team is primarily in defensive structure and shape control.
  ///
  /// Example: compact block organization after losing the ball.
  defensiveOrganization,

  /// First construction layer of attack from back or reset areas.
  ///
  /// Example: center-backs and pivot creating safe progression options.
  buildUp,

  /// Ball advances through lines toward dangerous zones.
  ///
  /// Example: vertical pass chains or carries through midfield.
  progression,

  /// Possession reaches attacking zones near/around the penalty area.
  ///
  /// Example: sustained pressure around the box before final action.
  finalThird,

  /// A concrete scoring opportunity is formed.
  ///
  /// Example: one-v-one, cutback chance, or high-xG central shot.
  chance,

  /// Resolution of a chance or dangerous action.
  ///
  /// Example: goal, save, block, clearance, or turnover outcome.
  outcome,

  /// Rapid state change after ball win/loss with unstable structure.
  ///
  /// Example: counterattack window immediately after a turnover.
  transition,

  /// Restart-driven sequence from dead-ball situations.
  ///
  /// Example: corner, free kick, throw-in, or goal-kick routine.
  setPiece,

  /// Referee/discipline/medical or control interruption.
  ///
  /// Example: foul management, yellow-card handling, brief stoppage control.
  intervention,

  /// Rare exceptional incidents outside regular tactical flow.
  ///
  /// Example: unusual disruption events or edge-case match incidents.
  specialIncident,
}
