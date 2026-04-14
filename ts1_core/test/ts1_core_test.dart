import 'package:test/test.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';
import 'package:ts1_core/src/match/builders/match_context_builder.dart';
import 'package:ts1_core/src/match/engines/match_engine.dart';
import 'package:ts1_core/src/match/models/match.dart';
import 'package:ts1_core/src/team/factories/draft_team_factory.dart';
import 'package:ts1_core/src/team/factories/tactical_preset_factory.dart';

void main() {
  group('Formation Variant Separation', () {
    test('4-2-3-1 narrow and wide separate route profile in simulation', () {
      final wideMatch = _buildKickoffMatch(
        homeFormationCode: '4-2-3-1',
        awayFormationCode: '4-4-2',
      );
      final narrowMatch = _buildKickoffMatch(
        homeFormationCode: '4-2-3-1-narrow',
        awayFormationCode: '4-4-2',
      );

      final wideResult = MatchEngine.simulateMatch(
        wideMatch,
        maxMicroPhases: 220,
      );
      final narrowResult = MatchEngine.simulateMatch(
        narrowMatch,
        maxMicroPhases: 220,
      );

      final wideStats = _homeRouteShares(wideResult);
      final narrowStats = _homeRouteShares(narrowResult);

      expect(
        narrowStats.centralShare,
        greaterThan(wideStats.centralShare + 0.04),
      );
      expect(wideStats.flankShare, greaterThan(narrowStats.flankShare + 0.04));
    });

    test('4-3-3 defensive and attacking separate structural profile', () {
      final away = DraftTeamFactory.buildTeam(
        id: 801,
        name: 'Away Baseline',
        formationCode: '4-4-2',
        preset: TacticalPreset.balanced,
      );

      final defensiveHome = DraftTeamFactory.buildTeam(
        id: 701,
        name: 'Home 433 Defensive',
        formationCode: '4-3-3-defensive',
        preset: TacticalPreset.balanced,
      );

      final attackingHome = DraftTeamFactory.buildTeam(
        id: 702,
        name: 'Home 433 Attacking',
        formationCode: '4-3-3-attacking',
        preset: TacticalPreset.balanced,
      );

      final defensiveContext = MatchContextBuilder.buildFromTeams(
        homeTeam: defensiveHome,
        awayTeam: away,
      );
      final attackingContext = MatchContextBuilder.buildFromTeams(
        homeTeam: attackingHome,
        awayTeam: away,
      );

      expect(
        defensiveContext.homeStructuralProfile.restDefenseStability,
        greaterThan(
          attackingContext.homeStructuralProfile.restDefenseStability,
        ),
      );
      expect(
        attackingContext.homeStructuralProfile.boxPresence,
        greaterThan(defensiveContext.homeStructuralProfile.boxPresence),
      );
    });
  });
}

({double flankShare, double centralShare}) _homeRouteShares(Match match) {
  var leftFlank = 0;
  var rightFlank = 0;
  var centralProgression = 0;
  var halfSpaces = 0;
  var directCentral = 0;

  for (final snapshot in match.matchState.phaseHistory) {
    if (snapshot.initiativeTeam != TeamSide.home ||
        snapshot.attackState == null) {
      continue;
    }

    switch (snapshot.attackState!.route) {
      case AttackRoute.leftFlank:
        leftFlank += 1;
        break;
      case AttackRoute.rightFlank:
        rightFlank += 1;
        break;
      case AttackRoute.centralProgression:
        centralProgression += 1;
        break;
      case AttackRoute.halfSpaces:
        halfSpaces += 1;
        break;
      case AttackRoute.directCentralLane:
        directCentral += 1;
        break;
    }
  }

  final total =
      leftFlank + rightFlank + centralProgression + halfSpaces + directCentral;
  if (total == 0) {
    return (flankShare: 0.0, centralShare: 0.0);
  }

  final flankShare = (leftFlank + rightFlank) / total;
  final centralShare =
      (centralProgression + halfSpaces + directCentral) / total;
  return (flankShare: flankShare, centralShare: centralShare);
}

Match _buildKickoffMatch({
  required String homeFormationCode,
  required String awayFormationCode,
}) {
  final home = DraftTeamFactory.buildTeam(
    id: 501,
    name: 'Home Side',
    formationCode: homeFormationCode,
    preset: TacticalPreset.balanced,
  );
  final away = DraftTeamFactory.buildTeam(
    id: 502,
    name: 'Away Side',
    formationCode: awayFormationCode,
    preset: TacticalPreset.balanced,
  );

  final bootstrapped = MatchEngine.bootstrapMatch(
    id: 9001,
    homeTeam: home,
    awayTeam: away,
    kickoffAt: DateTime.utc(2026, 1, 1),
  );
  return MatchEngine.kickoffMatch(bootstrapped, kickoffSide: TeamSide.home);
}
