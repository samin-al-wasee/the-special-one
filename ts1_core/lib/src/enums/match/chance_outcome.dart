enum ChanceOutcome {
  goal,
  save,
  block,
  offTarget,
  woodwork,
  rebound,
  deflectionCorner,
  claimedByKeeper,
  offside,
  foulWon,
  turnover,
  clearance,
}

extension ChanceOutcomeX on ChanceOutcome {
  bool get isTerminal {
    switch (this) {
      case ChanceOutcome.rebound:
      case ChanceOutcome.deflectionCorner:
        return false;
      default:
        return true;
    }
  }
}
