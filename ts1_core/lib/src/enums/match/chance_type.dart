enum ChanceType {
  lowXgLongShot,
  highXgCentralShot,
  cutback,
  throughBallOneVsOne,
  closeRangeTapIn,
  farPostHeader,
  nearPostHeader,
  backPostHeader,
  wideCrossHeader,
  blockedShot,
  scramble,
  rebound,
  edgeOfBoxShot,
  directFreeKick,
  indirectFreeKick,
  penalty,
  corner,
  cornerSecondBall,
  transitionBreakaway,
  overloadCombination,
  dribbleIsolation,
}

extension ChanceTypeX on ChanceType {
  bool get isSetPieceDerived {
    switch (this) {
      case ChanceType.directFreeKick:
      case ChanceType.indirectFreeKick:
      case ChanceType.corner:
      case ChanceType.cornerSecondBall:
      case ChanceType.penalty:
        return true;
      default:
        return false;
    }
  }
}
