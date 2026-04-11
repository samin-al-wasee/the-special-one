import 'package:ts1_core/src/match/builders/matchup_profile_builder.dart';
import 'package:ts1_core/src/team/builders/structural_profile_builder.dart';
import 'package:ts1_core/src/team/builders/tactical_identity_builder.dart';
import 'package:ts1_core/src/team/builders/team_strength_profile_builder.dart';
import 'package:ts1_core/src/match/models/context/match_context.dart';
import 'package:ts1_core/src/match/models/match.dart';
import 'package:ts1_core/src/team/models/team.dart';

/// Builds a fully-derived [MatchContext] from a [Match] entity.
///
/// It composes all lower-level builders so callers only need the match object.
class MatchContextBuilder {
  const MatchContextBuilder._();

  static MatchContext buildFromMatch(Match match) {
    return buildFromTeams(homeTeam: match.homeTeam, awayTeam: match.awayTeam);
  }

  static MatchContext buildFromTeams({
    required Team homeTeam,
    required Team awayTeam,
  }) {
    final homeTacticalIdentity = TacticalIdentityBuilder.buildForTeam(homeTeam);
    final awayTacticalIdentity = TacticalIdentityBuilder.buildForTeam(awayTeam);

    final homeStrengthProfile = TeamStrengthProfileBuilder.build(homeTeam);
    final awayStrengthProfile = TeamStrengthProfileBuilder.build(awayTeam);

    final homeStructuralProfile = StructuralProfileBuilder.buildFrom(
      lineup: homeTeam.lineup,
      players: homeTeam.allPlayers,
    );
    final awayStructuralProfile = StructuralProfileBuilder.buildFrom(
      lineup: awayTeam.lineup,
      players: awayTeam.allPlayers,
    );

    final homeToAwayMatchupProfile = MatchupProfileBuilder.build(
      strengthA: homeStrengthProfile,
      identityA: homeTacticalIdentity,
      strengthB: awayStrengthProfile,
      identityB: awayTacticalIdentity,
    );

    final awayToHomeMatchupProfile = MatchupProfileBuilder.build(
      strengthA: awayStrengthProfile,
      identityA: awayTacticalIdentity,
      strengthB: homeStrengthProfile,
      identityB: homeTacticalIdentity,
    );

    return MatchContext(
      id: (homeTeam.id * 1000003) + awayTeam.id,
      homeTacticalIdentity: homeTacticalIdentity,
      awayTacticalIdentity: awayTacticalIdentity,
      homeStrengthProfile: homeStrengthProfile,
      awayStrengthProfile: awayStrengthProfile,
      homeStructuralProfile: homeStructuralProfile,
      awayStructuralProfile: awayStructuralProfile,
      homeToAwayMatchupProfile: homeToAwayMatchupProfile,
      awayToHomeMatchupProfile: awayToHomeMatchupProfile,
    );
  }

  static Match withBuiltContext(Match match) {
    return match.copyWith(context: buildFromMatch(match));
  }
}
