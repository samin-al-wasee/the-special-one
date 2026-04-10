// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchContext _$MatchContextFromJson(Map<String, dynamic> json) =>
    _MatchContext(
      id: (json['id'] as num).toInt(),
      homeTacticalIdentity: json['homeTacticalIdentity'] == null
          ? const TacticalIdentity(id: 0)
          : TacticalIdentity.fromJson(
              json['homeTacticalIdentity'] as Map<String, dynamic>,
            ),
      awayTacticalIdentity: json['awayTacticalIdentity'] == null
          ? const TacticalIdentity(id: 0)
          : TacticalIdentity.fromJson(
              json['awayTacticalIdentity'] as Map<String, dynamic>,
            ),
      homeStrengthProfile: json['homeStrengthProfile'] == null
          ? const TeamStrengthProfile(
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
            )
          : TeamStrengthProfile.fromJson(
              json['homeStrengthProfile'] as Map<String, dynamic>,
            ),
      awayStrengthProfile: json['awayStrengthProfile'] == null
          ? const TeamStrengthProfile(
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
            )
          : TeamStrengthProfile.fromJson(
              json['awayStrengthProfile'] as Map<String, dynamic>,
            ),
      homeStructuralProfile: json['homeStructuralProfile'] == null
          ? const StructuralProfile(id: 0)
          : StructuralProfile.fromJson(
              json['homeStructuralProfile'] as Map<String, dynamic>,
            ),
      awayStructuralProfile: json['awayStructuralProfile'] == null
          ? const StructuralProfile(id: 0)
          : StructuralProfile.fromJson(
              json['awayStructuralProfile'] as Map<String, dynamic>,
            ),
      homeToAwayMatchupProfile: json['homeToAwayMatchupProfile'] == null
          ? const MatchupProfile(id: 0)
          : MatchupProfile.fromJson(
              json['homeToAwayMatchupProfile'] as Map<String, dynamic>,
            ),
      awayToHomeMatchupProfile: json['awayToHomeMatchupProfile'] == null
          ? const MatchupProfile(id: 0)
          : MatchupProfile.fromJson(
              json['awayToHomeMatchupProfile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MatchContextToJson(_MatchContext instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeTacticalIdentity': instance.homeTacticalIdentity,
      'awayTacticalIdentity': instance.awayTacticalIdentity,
      'homeStrengthProfile': instance.homeStrengthProfile,
      'awayStrengthProfile': instance.awayStrengthProfile,
      'homeStructuralProfile': instance.homeStructuralProfile,
      'awayStructuralProfile': instance.awayStructuralProfile,
      'homeToAwayMatchupProfile': instance.homeToAwayMatchupProfile,
      'awayToHomeMatchupProfile': instance.awayToHomeMatchupProfile,
    };
