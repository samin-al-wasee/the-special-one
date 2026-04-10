import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_strength_profile.freezed.dart';
part 'team_strength_profile.g.dart';

@freezed
abstract class TeamStrengthProfile with _$TeamStrengthProfile {
  const factory TeamStrengthProfile({
    required int id,
    // Build-up and core play
    required double buildUpQuality,
    required double pressResistance,
    required double wideAttack,
    required double centralCreativity,
    required double aerialThreat,
    required double defensiveCompactness,
    required double transitionThreat,
    required double pressingForce,

    // Possession control
    required double possessionSecurity,
    required double turnoverLiability,

    // Attacking output
    required double finishingQuality,
    required double shotVolumeTendency,
    required double chanceConversion,

    // Defensive structure
    required double transitionDefense,
    required double wideDefense,
    required double centralDefense,

    // Set pieces
    required double setPieceAttackStrength,
    required double setPieceDefenseStrength,

    // Discipline and goalkeeper
    required double disciplineControl,
    required double gkDistributionQuality,
    required double gkShotStopping,

    // Intangibles
    required double chemistry,
    required double morale,
  }) = _TeamStrengthProfile;

  factory TeamStrengthProfile.fromJson(Map<String, dynamic> json) =>
      _$TeamStrengthProfileFromJson(json);

  const TeamStrengthProfile._();

  String summary() {
    return 'Build-Up: ${buildUpQuality.toStringAsFixed(1)}\n'
        'Press Resistance: ${pressResistance.toStringAsFixed(1)}\n'
        'Wide Attack: ${wideAttack.toStringAsFixed(1)}\n'
        'Central Creativity: ${centralCreativity.toStringAsFixed(1)}\n'
        'Aerial Threat: ${aerialThreat.toStringAsFixed(1)}\n'
        'Defensive Compactness: ${defensiveCompactness.toStringAsFixed(1)}\n'
        'Transition Threat: ${transitionThreat.toStringAsFixed(1)}\n'
        'Pressing Force: ${pressingForce.toStringAsFixed(1)}\n'
        'Finishing Quality: ${finishingQuality.toStringAsFixed(1)}\n'
        'Shot Volume Tendency: ${shotVolumeTendency.toStringAsFixed(1)}\n'
        'Chance Conversion: ${chanceConversion.toStringAsFixed(1)}\n'
        'Transition Defense: ${transitionDefense.toStringAsFixed(1)}\n'
        'Wide Defense: ${wideDefense.toStringAsFixed(1)}\n'
        'Central Defense: ${centralDefense.toStringAsFixed(1)}\n'
        'Set Piece Attack: ${setPieceAttackStrength.toStringAsFixed(1)}\n'
        'Set Piece Defense: ${setPieceDefenseStrength.toStringAsFixed(1)}\n'
        'Possession Security: ${possessionSecurity.toStringAsFixed(1)}\n'
        'Turnover Liability: ${turnoverLiability.toStringAsFixed(1)}\n'
        'Discipline Control: ${disciplineControl.toStringAsFixed(1)}\n'
        'GK Distribution: ${gkDistributionQuality.toStringAsFixed(1)}\n'
        'GK Shot Stopping: ${gkShotStopping.toStringAsFixed(1)}\n'
        'Chemistry: ${chemistry.toStringAsFixed(1)}\n'
        'Morale: ${morale.toStringAsFixed(1)}\n';
  }

  Map<String, double> toDict() {
    return {
      // Build-up and control
      'Build-Up Quality': buildUpQuality,
      'Press Resistance': pressResistance,
      'Possession Security': possessionSecurity,
      'Turnover Liability': turnoverLiability,
      // Attacking output
      'Wide Attack': wideAttack,
      'Central Creativity': centralCreativity,
      'Aerial Threat': aerialThreat,
      'Finishing Quality': finishingQuality,
      'Shot Volume Tendency': shotVolumeTendency,
      'Chance Conversion': chanceConversion,
      // Defensive structure
      'Defensive Compactness': defensiveCompactness,
      'Pressing Force': pressingForce,
      'Transition Defense': transitionDefense,
      'Wide Defense': wideDefense,
      'Central Defense': centralDefense,
      // Transition and set pieces
      'Transition Threat': transitionThreat,
      'Set Piece Attack': setPieceAttackStrength,
      'Set Piece Defense': setPieceDefenseStrength,
      // Discipline and goalkeeper
      'Discipline Control': disciplineControl,
      'GK Distribution': gkDistributionQuality,
      'GK Shot Stopping': gkShotStopping,
      // Intangibles
      'Chemistry': chemistry,
      'Morale': morale,
    };
  }
}
