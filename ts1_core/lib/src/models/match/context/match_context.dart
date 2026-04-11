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
    required TacticalIdentity homeTacticalIdentity,
    required TacticalIdentity awayTacticalIdentity,
    required TeamStrengthProfile homeStrengthProfile,
    required TeamStrengthProfile awayStrengthProfile,
    required StructuralProfile homeStructuralProfile,
    required StructuralProfile awayStructuralProfile,
    required MatchupProfile homeToAwayMatchupProfile,
    required MatchupProfile awayToHomeMatchupProfile,
  }) = _MatchContext;

  factory MatchContext.fromJson(Map<String, dynamic> json) =>
      _$MatchContextFromJson(json);
}
