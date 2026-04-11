// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchContext _$MatchContextFromJson(Map<String, dynamic> json) =>
    _MatchContext(
      id: (json['id'] as num).toInt(),
      homeTacticalIdentity: TacticalIdentity.fromJson(
        json['homeTacticalIdentity'] as Map<String, dynamic>,
      ),
      awayTacticalIdentity: TacticalIdentity.fromJson(
        json['awayTacticalIdentity'] as Map<String, dynamic>,
      ),
      homeStrengthProfile: TeamStrengthProfile.fromJson(
        json['homeStrengthProfile'] as Map<String, dynamic>,
      ),
      awayStrengthProfile: TeamStrengthProfile.fromJson(
        json['awayStrengthProfile'] as Map<String, dynamic>,
      ),
      homeStructuralProfile: StructuralProfile.fromJson(
        json['homeStructuralProfile'] as Map<String, dynamic>,
      ),
      awayStructuralProfile: StructuralProfile.fromJson(
        json['awayStructuralProfile'] as Map<String, dynamic>,
      ),
      homeToAwayMatchupProfile: MatchupProfile.fromJson(
        json['homeToAwayMatchupProfile'] as Map<String, dynamic>,
      ),
      awayToHomeMatchupProfile: MatchupProfile.fromJson(
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
