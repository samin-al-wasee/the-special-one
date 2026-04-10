enum MatchCommandType {
  demandMore,
  calmDown,
  focus,
  pushHigher,
  dropBack,
  pressMore,
  pressLess,
  keepBall,
  fasterTempo,
  lowerTempo,
  attackFlanks,
  attackCenter,
  targetLeft,
  targetRight,
  targetHalfSpaces,
  counterPress,
  regroup,
  holdShape,
  playDirect,
  workBallIntoBox,
  protectLead,
  goForWinner,
  stayDisciplined,
  wasteTime,
}

extension MatchCommandTypeX on MatchCommandType {
  bool get isHighRisk {
    switch (this) {
      case MatchCommandType.goForWinner:
      case MatchCommandType.fasterTempo:
      case MatchCommandType.pressMore:
      case MatchCommandType.pushHigher:
      case MatchCommandType.counterPress:
      case MatchCommandType.playDirect:
      case MatchCommandType.targetLeft:
      case MatchCommandType.targetRight:
      case MatchCommandType.targetHalfSpaces:
      case MatchCommandType.attackCenter:
        return true;
      default:
        return false;
    }
  }
}
