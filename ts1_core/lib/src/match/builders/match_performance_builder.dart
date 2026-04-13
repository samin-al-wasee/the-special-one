import 'package:ts1_core/src/core/enums/match_enums.dart';
import 'package:ts1_core/src/match/models/insights/match_performance_summary.dart';
import 'package:ts1_core/src/match/models/match.dart';

class MatchPerformanceBuilder {
  const MatchPerformanceBuilder._();

  static MatchPerformanceSummary buildFor(Match match, TeamSide side) {
    final state = match.matchState;
    final ownStats = state.statsFor(side);
    final oppStats = state.statsFor(match.opponentOf(side));
    final ownGoals = side == TeamSide.home
        ? state.scoreline.home
        : state.scoreline.away;
    final oppGoals = side == TeamSide.home
        ? state.scoreline.away
        : state.scoreline.home;
    final scoreDiff = ownGoals - oppGoals;
    final xgDiff = ownStats.expectedGoals - oppStats.expectedGoals;
    final shotDiff = ownStats.shotsOnTarget - oppStats.shotsOnTarget;
    final possessionDiff = (ownStats.possession - oppStats.possession) / 100.0;
    final initiativeCount = state.phaseHistory.where((snapshot) {
      return snapshot.initiativeTeam == side;
    }).length;
    final initiativeShare = state.phaseHistory.isEmpty
        ? 0.0
        : initiativeCount / state.phaseHistory.length;

    final raw =
        2.0 +
        (scoreDiff * 1.1) +
        (xgDiff * 1.3) +
        (shotDiff * 0.08) +
        (possessionDiff * 1.2) +
        (initiativeShare * 0.8);
    return MatchPerformanceSummary(rating: raw.clamp(0.0, 5.0).toDouble());
  }
}
