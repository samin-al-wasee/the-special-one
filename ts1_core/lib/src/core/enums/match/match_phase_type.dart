/// Linear phase progression through a match simulation.
///
/// Combines both macro phase categories and granular state labels into one enum.
/// This creates a linear flow where each value represents a concrete phase state.
///
/// Typical progression (not mandatory):
/// neutralPossession -> buildUp -> progression -> finalThird -> duel -> chance
/// -> outcome -> transition -> buildUp
///
/// Or with set pieces:
/// setPiecePreparation -> setPieceDelivery -> outcome -> transition
///
/// Each value answers: "What exact phase state is happening right now?"
enum MatchPhaseType {
  /// Stable low-threat possession behavior.
  ///
  /// Example: safe midfield recycling without immediate penetration.
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

  /// Sustained presence in attacking territory.
  ///
  /// Example: probing around the edge of the area.
  finalThird,

  /// Contest-heavy moment between players/units.
  ///
  /// Example: shoulder duel, second-ball challenge, pressing clash.
  duel,

  /// A concrete scoring opportunity is formed.
  ///
  /// Example: one-v-one, cutback chance, or high-xG central shot.
  chance,

  /// Setup behavior before the ball is delivered on a set piece.
  ///
  /// Example: player positioning, decoy runs, target assignment.
  setPiecePreparation,

  /// Ball delivery/execution step of the set-piece routine.
  ///
  /// Example: corner delivery, direct free-kick strike, throw-in trigger.
  setPieceDelivery,

  /// Terminal result of the attacking action.
  ///
  /// Example: shot saved, goal scored, or chance blocked.
  outcome,

  /// Unstable post-turnover flow with fast tactical reconfiguration.
  ///
  /// Example: immediate counter window after a turnover.
  transition,

  /// Possession changes hands during or after an action.
  ///
  /// Example: interception, tackle win, or failed pass leading to counter.
  turnover,

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

  /// Referee/discipline/medical or control interruption.
  ///
  /// Example: foul management, yellow-card handling, brief stoppage control.
  intervention,

  /// Rare exceptional incidents outside regular tactical flow.
  ///
  /// Example: unusual disruption events or edge-case match incidents.
  specialIncident,
}
