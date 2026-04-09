import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/tactical_attributes.dart';

part 'tactic.freezed.dart';
part 'tactic.g.dart';

@freezed
abstract class Tactic with _$Tactic {
  const factory Tactic({
    required int id,
    // Team Tactics: Attacking Tactics (SPEC Part 2.A)
    required BuildUpStyle buildUpStyle,
    required Tempo tempo,
    required Width width,
    required FinalThirdFocus finalThirdFocus,
    required AttackingFocus attackingFocus,

    // Team Tactics: Defensive Tactics (SPEC Part 2.B)
    required DefensiveLine defensiveLine,
    required LineOfEngagement lineOfEngagement,
    required PressingIntensity pressingIntensity,
    required DefensiveWidth defensiveWidth,
    required MarkingStyle markingStyle,
    required TacklingAggression tacklingAggression,

    // Team Tactics: Transition Tactics (SPEC Part 2.C)
    required TransitionOnWin transitionOnWin,
    required TransitionOnLoss transitionOnLoss,

    // Team Tactics: Mentality / Match Approach (SPEC Part 2.D)
    required TeamMentality teamMentality,

    // Team Tactics: Risk Management (SPEC Part 2.E)
    required PassingRisk passingRisk,
    required DribblingRisk dribblingRisk,
    required ShootingPolicy shootingPolicy,

    // Team Tactics: Space Control (SPEC Part 2.F)
    required Compactness compactness,
    required VerticalStretch verticalStretch,
    required OverloadFocus overloadFocus,

    // Set Piece Control System (SPEC Part 5)
    required SetPieceAttack setPieceAttack,
    required SetPieceDefense setPieceDefense,
    required FreeKickStrategy freeKickStrategy,
  }) = _Tactic;

  factory Tactic.fromJson(Map<String, dynamic> json) => _$TacticFromJson(json);

  const Tactic._();

  String summary() {
    return 'Build-Up Style: $buildUpStyle\n'
        'Tempo: $tempo\n'
        'Width: $width\n'
        'Final Third Focus: $finalThirdFocus\n'
        'Attacking Focus: $attackingFocus\n'
        'Defensive Line: $defensiveLine\n'
        'Line of Engagement: $lineOfEngagement\n'
        'Pressing Intensity: $pressingIntensity\n'
        'Defensive Width: $defensiveWidth\n'
        'Marking Style: $markingStyle\n'
        'Tackling Aggression: $tacklingAggression\n'
        'Transition on Win: $transitionOnWin\n'
        'Transition on Loss: $transitionOnLoss\n'
        'Team Mentality: $teamMentality\n'
        'Passing Risk: $passingRisk\n'
        'Dribbling Risk: $dribblingRisk\n'
        'Shooting Policy: $shootingPolicy\n'
        'Compactness: $compactness\n'
        'Vertical Stretch: $verticalStretch\n'
        'Overload Focus: $overloadFocus\n'
        'Set Piece Attack: $setPieceAttack\n'
        'Set Piece Defense: $setPieceDefense\n'
        'Free Kick Strategy: $freeKickStrategy';
  }
}
