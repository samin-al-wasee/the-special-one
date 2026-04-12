/// Detailed sub-state labels within a macro [MatchPhaseType].
///
/// A [MatchPhaseState] answers: "What exactly is happening inside this phase?"
/// It is more granular than `MatchPhaseType` and is useful for event cards,
/// tactical insights, and downstream analytics.
///
/// Example mapping:
/// - phaseType: setPiece -> state: setPiecePreparation / setPieceDelivery
/// - phaseType: transition -> state: transition / duel / turnover
/// - phaseType: outcome -> state: outcome / turnover
enum MatchPhaseState {
  /// Stable low-threat possession behavior.
  ///
  /// Example: safe recycling with no immediate penetration.
  neutralPossession,

  /// Construction stage from deeper zones.
  ///
  /// Example: defenders and midfield pivot organizing first pass lanes.
  buildUp,

  /// Ball advancement through lines.
  ///
  /// Example: progressive carry or line-breaking pass sequence.
  progression,

  /// Sustained presence in attacking territory.
  ///
  /// Example: probing around the edge of the area.
  finalThird,

  /// Contest-heavy moment between players/units.
  ///
  /// Example: shoulder duel, second-ball challenge, pressing clash.
  duel,

  /// A concrete chance has formed.
  ///
  /// Example: clear shooting/crossing opportunity.
  chance,

  /// Terminal result of the attacking action.
  ///
  /// Example: shot saved, goal scored, or chance blocked.
  outcome,

  /// Unstable post-turnover flow with fast tactical reconfiguration.
  ///
  /// Example: immediate counter window before both teams reset shape.
  transition,

  /// Setup behavior before the ball is delivered on a set piece.
  ///
  /// Example: player positioning, decoy runs, target assignment.
  setPiecePreparation,

  /// Ball delivery/execution step of the set-piece routine.
  ///
  /// Example: corner delivery, direct free-kick strike, throw-in trigger.
  setPieceDelivery,

  /// Play stopped due to foul event specifically.
  ///
  /// Example: whistle for contact offense before restart is taken.
  foulStop,

  /// Generic interruption state not limited to fouls.
  ///
  /// Example: injury pause, disciplinary pause, or administrative stop.
  stoppage,

  /// Restart moment immediately after stoppage.
  ///
  /// Example: whistle resume leading back into buildUp or transition.
  restart,

  /// Possession changes hands during or after an action.
  ///
  /// Example: interception, tackle win, or failed pass leading to counter.
  turnover,
}
