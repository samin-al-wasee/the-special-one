/// 🧭 ATTACK ROUTE — Spatial Layer
///
/// Represents **where on the pitch** an attacking sequence is progressing.
///
/// This is strictly positional and does NOT encode:
/// - Tactical intent (that's [AttackMode])
/// - Situational context (that's [AttackContext])
/// - Pace or philosophy (handled by AttackMode)
///
/// The spatial route describes the geometric progression of the ball toward goal.
enum AttackRoute {
  /// Ball is being progressed down the left side of the pitch.
  /// Typically involves left wingback/winger combinations.
  leftFlank,

  /// Ball is being progressed down the right side of the pitch.
  /// Typically involves right wingback/winger combinations.
  rightFlank,

  /// Ball is being progressed through the center of the pitch.
  /// Involves central midfielders and striker in vertical movement.
  centralProgression,

  /// Ball is being advanced through half-space zones.
  /// Involves playmakers moving through gaps between full-backs and center-backs.
  halfSpaces,

  /// Direct vertical lane through the center.
  /// Minimal lateral movement; emphasis on forward momentum (long balls, through balls).
  directCentralLane,
}
