/// ⚙️ ATTACK MODE — Tactical Intent Layer
///
/// Represents **how the attacking team** is trying to progress the ball
/// and create attacking opportunities.
///
/// This encodes the tactical philosophy, tempo, and style of execution.
/// It is **independent of position** and **independent of situation**.
///
/// Does NOT encode:
/// - Where on the pitch (that's [AttackRoute])
/// - Why the attack started (that's [AttackContext])
///
/// Instead describes the tactical method: tempo, spacing, ball movement style.
enum AttackMode {
  /// Methodical, patience-based approach.
  /// High possession retention, frequent lateral passing, building pressure gradually.
  /// Used to bypass defensive shape or tire defenders.
  /// Typical of possession-heavy teams or teams with technical superiority.
  possessionBuildUp,

  /// Rapid, direct attacking style after regaining the ball.
  /// Involves quick passing sequences, vertical progressions, early shot attempts.
  /// Exploits defensive disorganization before shape reforms.
  /// High tempo, lower possession percentage.
  quickTransition,

  /// Long ball, direct approach with minimal midfield involvement.
  /// Emphasizes playing over/around defensive block.
  /// Effective against deep defensive structures.
  /// Lower passing accuracy with higher reward potential.
  directPlay,

  /// Rapid counter-attacking ball movement after defensive win.
  /// Fastest tempo; exploits numerical advantage in transition.
  /// Typical of lower possession teams with speed/efficiency emphasis.
  counterAttack,

  /// Aggressive pressing high up the pitch combined with attacking.
  /// Attempts to regain ball in advanced positions for immediate shot.
  /// High risk/high reward; requires coordination between defense and attack.
  /// Typical of high-intensity pressing teams.
  highPressAttack,

  /// Set-piece specific execution (corners, free kicks, throw-ins).
  /// Choreographed movement patterns designed for dead-ball advantage.
  /// Treats attacking phase as structured routine rather than organic flow.
  setPlayExecution,
}
