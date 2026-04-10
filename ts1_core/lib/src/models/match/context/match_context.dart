import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/models/match/matchup_profile/matchup_profile.dart';
import 'package:ts1_core/src/models/team/lineup/formation/structural_profile.dart';
import 'package:ts1_core/src/models/team/strength_profile/team_strength_profile.dart';
import 'package:ts1_core/src/models/team/tactic/tactical_identity/tactical_identity.dart';

part 'match_context.freezed.dart';
part 'match_context.g.dart';

@freezed
abstract class MatchContext with _$MatchContext {
  const factory MatchContext({
    @Default(TacticalIdentity()) TacticalIdentity homeTacticalIdentity,
    @Default(TacticalIdentity()) TacticalIdentity awayTacticalIdentity,
    @Default(
      TeamStrengthProfile(
        buildUpQuality: 50,
        pressResistance: 50,
        wideAttack: 50,
        centralCreativity: 50,
        aerialThreat: 50,
        defensiveCompactness: 50,
        transitionThreat: 50,
        pressingForce: 50,
        possessionSecurity: 50,
        turnoverLiability: 50,
        finishingQuality: 50,
        shotVolumeTendency: 50,
        chanceConversion: 50,
        transitionDefense: 50,
        wideDefense: 50,
        centralDefense: 50,
        setPieceAttackStrength: 50,
        setPieceDefenseStrength: 50,
        disciplineControl: 50,
        gkDistributionQuality: 50,
        gkShotStopping: 50,
        chemistry: 50,
        morale: 50,
      ),
    )
    TeamStrengthProfile homeStrengthProfile,
    @Default(
      TeamStrengthProfile(
        buildUpQuality: 50,
        pressResistance: 50,
        wideAttack: 50,
        centralCreativity: 50,
        aerialThreat: 50,
        defensiveCompactness: 50,
        transitionThreat: 50,
        pressingForce: 50,
        possessionSecurity: 50,
        turnoverLiability: 50,
        finishingQuality: 50,
        shotVolumeTendency: 50,
        chanceConversion: 50,
        transitionDefense: 50,
        wideDefense: 50,
        centralDefense: 50,
        setPieceAttackStrength: 50,
        setPieceDefenseStrength: 50,
        disciplineControl: 50,
        gkDistributionQuality: 50,
        gkShotStopping: 50,
        chemistry: 50,
        morale: 50,
      ),
    )
    TeamStrengthProfile awayStrengthProfile,
    @Default(StructuralProfile()) StructuralProfile homeStructuralProfile,
    @Default(StructuralProfile()) StructuralProfile awayStructuralProfile,
    @Default(MatchupProfile()) MatchupProfile homeToAwayMatchupProfile,
    @Default(MatchupProfile()) MatchupProfile awayToHomeMatchupProfile,
  }) = _MatchContext;

  factory MatchContext.fromJson(Map<String, dynamic> json) =>
      _$MatchContextFromJson(json);
}
