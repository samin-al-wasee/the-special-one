/// 🎭 ATTACK CONTEXT — Event / Situation Layer
///
/// Represents **why and where the current attacking sequence originated**.
///
/// This encodes the situational trigger or game event that initiated the current phase.
/// It answers: "What event caused this attack?"
///
/// Does NOT encode:
/// - Where the attack is progressing spatially (that's [AttackRoute])
/// - What tactical method is used (that's [AttackMode])
///
/// Instead describes the origin: a restart, a turnover, a structural breakdown, etc.
enum AttackContext {
  /// Attack initiated from normal open play.
  /// Ball was in continuous play; no restart or turnover event.
  /// Most common context.
  normalOpenPlay,

  /// Attack initiated from a corner kick restart.
  /// Ball was played from corner flag due to defensive clearance.
  cornerKick,

  /// Attack initiated from a direct free kick restart.
  /// Awarded due to opposition offense; attacking team takes free kick directly.
  directFreeKick,

  /// Attack initiated from an indirect free kick restart.
  /// Awarded due to technical offense; attacking team must pass before shot.
  indirectFreeKick,

  /// Attack initiated from a throw-in restart.
  /// Ball was out of play across side line; attacking team throws in.
  throwIn,

  /// Attack initiated from goal kick restart.
  /// Ball was cleared from goalkeeper after opposition shot/clearance.
  goalKick,

  /// Attack initiated after regaining ball through defensive action.
  /// Interception, tackle, block, or clearance led to counter-attacking phase.
  defensiveTransition,

  /// Attack initiated from a second ball / loose ball recovery.
  /// Neither team had clean possession; both competing for loose ball.
  /// Can occur from deflection, challenge, or incomplete pass.
  secondBallRecovery,

  /// Attack initiated due to opponent's structural/tactical error.
  /// Defensive misalignment, goalkeeper mistake, or failed clearance created immediate danger.
  opponentsError,

  /// Attack initiated from high-chaos phase.
  /// Rapid transitions, multiple challenges, unclear possession; attack surfaced from chaos.
  /// Harder to predict; lower tactical organization.
  transitionChaos,

  /// Attack initiated from a set-piece sequence variation (not traditional set piece).
  /// Short corner, quick free kick, throw-in combo, etc.
  /// Pre-planned or adaptive sequence from restart.
  setpieceSequence,
}
