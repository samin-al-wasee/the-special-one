import 'package:ts1_core/src/builders/match_context_builder.dart';
import 'package:ts1_core/src/factories/match_state_factory.dart';
import 'package:ts1_core/src/models/match/match.dart';
import 'package:ts1_core/src/models/team/team.dart';

/// Static bootstrap utility for creating [Match] objects.
class MatchEngine {
  MatchEngine._();

  static const int defaultTotalRegulationMinutes = 90;
  static const int defaultMicroPhaseSeconds = 30;

  static Match bootstrapMatch({
    required int id,
    required Team homeTeam,
    required Team awayTeam,
    required DateTime kickoffAt,
    String venue = 'Unknown',
    String weather = 'Unknown',
    int totalRegulationMinutes = defaultTotalRegulationMinutes,
    int microPhaseSeconds = defaultMicroPhaseSeconds,
  }) {
    final context = MatchContextBuilder.buildFromTeams(
      homeTeam: homeTeam,
      awayTeam: awayTeam,
    );
    final seededState = MatchStateFactory.preMatch(context: context);

    return Match(
      id: id,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      kickoffAt: kickoffAt,
      venue: venue,
      weather: weather,
      totalRegulationMinutes: totalRegulationMinutes,
      microPhaseSeconds: microPhaseSeconds,
      context: context,
      matchState: seededState,
    );
  }
}
