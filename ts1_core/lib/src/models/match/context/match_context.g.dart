// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchContext _$MatchContextFromJson(Map<String, dynamic> json) =>
    _MatchContext(
      homeTacticalIdentity: json['homeTacticalIdentity'] == null
          ? const TacticalIdentity()
          : TacticalIdentity.fromJson(
              json['homeTacticalIdentity'] as Map<String, dynamic>,
            ),
      awayTacticalIdentity: json['awayTacticalIdentity'] == null
          ? const TacticalIdentity()
          : TacticalIdentity.fromJson(
              json['awayTacticalIdentity'] as Map<String, dynamic>,
            ),
      homeStrengthProfile: json['homeStrengthProfile'] == null
          ? const TeamStrengthProfile(
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
            )
          : TeamStrengthProfile.fromJson(
              json['homeStrengthProfile'] as Map<String, dynamic>,
            ),
      awayStrengthProfile: json['awayStrengthProfile'] == null
          ? const TeamStrengthProfile(
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
            )
          : TeamStrengthProfile.fromJson(
              json['awayStrengthProfile'] as Map<String, dynamic>,
            ),
      homeStructuralProfile: json['homeStructuralProfile'] == null
          ? const StructuralProfile()
          : StructuralProfile.fromJson(
              json['homeStructuralProfile'] as Map<String, dynamic>,
            ),
      awayStructuralProfile: json['awayStructuralProfile'] == null
          ? const StructuralProfile()
          : StructuralProfile.fromJson(
              json['awayStructuralProfile'] as Map<String, dynamic>,
            ),
      homeToAwayMatchupProfile: json['homeToAwayMatchupProfile'] == null
          ? const MatchupProfile()
          : MatchupProfile.fromJson(
              json['homeToAwayMatchupProfile'] as Map<String, dynamic>,
            ),
      awayToHomeMatchupProfile: json['awayToHomeMatchupProfile'] == null
          ? const MatchupProfile()
          : MatchupProfile.fromJson(
              json['awayToHomeMatchupProfile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MatchContextToJson(_MatchContext instance) =>
    <String, dynamic>{
      'homeTacticalIdentity': instance.homeTacticalIdentity,
      'awayTacticalIdentity': instance.awayTacticalIdentity,
      'homeStrengthProfile': instance.homeStrengthProfile,
      'awayStrengthProfile': instance.awayStrengthProfile,
      'homeStructuralProfile': instance.homeStructuralProfile,
      'awayStructuralProfile': instance.awayStructuralProfile,
      'homeToAwayMatchupProfile': instance.homeToAwayMatchupProfile,
      'awayToHomeMatchupProfile': instance.awayToHomeMatchupProfile,
    };
