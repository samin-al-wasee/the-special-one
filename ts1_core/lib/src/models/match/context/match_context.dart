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
    required int id,
    @Default(TacticalIdentity(id: 0)) TacticalIdentity homeTacticalIdentity,
    @Default(TacticalIdentity(id: 0)) TacticalIdentity awayTacticalIdentity,
    @Default(
      TeamStrengthProfile(
        id: 0,
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
        id: 0,
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
    @Default(StructuralProfile(id: 0)) StructuralProfile homeStructuralProfile,
    @Default(StructuralProfile(id: 0)) StructuralProfile awayStructuralProfile,
    @Default(MatchupProfile(id: 0)) MatchupProfile homeToAwayMatchupProfile,
    @Default(MatchupProfile(id: 0)) MatchupProfile awayToHomeMatchupProfile,
  }) = _MatchContext;

  factory MatchContext.fromJson(Map<String, dynamic> json) =>
      _$MatchContextFromJson(json);
}
