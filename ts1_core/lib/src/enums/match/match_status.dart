enum MatchStatus {
  scheduled,
  postponed,
  ready,

  firstHalf,
  halfTime,
  secondHalf,

  extraTime,
  extraTimeHalfTime,
  penalties,

  paused,
  suspended,

  fullTime,
  abandoned,
}

extension MatchStatusX on MatchStatus {
  bool get isLive {
    switch (this) {
      case MatchStatus.firstHalf:
      case MatchStatus.secondHalf:
      case MatchStatus.extraTime:
      case MatchStatus.penalties:
      case MatchStatus.paused:
        return true;
      default:
        return false;
    }
  }

  bool get isTerminal {
    return this == MatchStatus.fullTime || this == MatchStatus.abandoned;
  }
}
