// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchupProfile _$MatchupProfileFromJson(Map<String, dynamic> json) =>
    _MatchupProfile(
      id: (json['id'] as num).toInt(),
      buildupEdge: (json['buildupEdge'] as num).toDouble(),
      pressingEdge: (json['pressingEdge'] as num).toDouble(),
      counterpressingEdge: (json['counterpressingEdge'] as num).toDouble(),
      compactnessEdge: (json['compactnessEdge'] as num).toDouble(),
      defensiveLineEdge: (json['defensiveLineEdge'] as num).toDouble(),
      wideEdge: (json['wideEdge'] as num).toDouble(),
      centralEdge: (json['centralEdge'] as num).toDouble(),
      fullbackEdge: (json['fullbackEdge'] as num).toDouble(),
      finalThirdEdge: (json['finalThirdEdge'] as num).toDouble(),
      shootingRiskEdge: (json['shootingRiskEdge'] as num).toDouble(),
      transitionOutEdge: (json['transitionOutEdge'] as num).toDouble(),
      transitionInEdge: (json['transitionInEdge'] as num).toDouble(),
      aerialEdge: (json['aerialEdge'] as num).toDouble(),
      setpieceDefenseEdge: (json['setpieceDefenseEdge'] as num).toDouble(),
      tempoEdge: (json['tempoEdge'] as num).toDouble(),
      playmakerEdge: (json['playmakerEdge'] as num).toDouble(),
      strikerSupportEdge: (json['strikerSupportEdge'] as num).toDouble(),
    );

Map<String, dynamic> _$MatchupProfileToJson(_MatchupProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buildupEdge': instance.buildupEdge,
      'pressingEdge': instance.pressingEdge,
      'counterpressingEdge': instance.counterpressingEdge,
      'compactnessEdge': instance.compactnessEdge,
      'defensiveLineEdge': instance.defensiveLineEdge,
      'wideEdge': instance.wideEdge,
      'centralEdge': instance.centralEdge,
      'fullbackEdge': instance.fullbackEdge,
      'finalThirdEdge': instance.finalThirdEdge,
      'shootingRiskEdge': instance.shootingRiskEdge,
      'transitionOutEdge': instance.transitionOutEdge,
      'transitionInEdge': instance.transitionInEdge,
      'aerialEdge': instance.aerialEdge,
      'setpieceDefenseEdge': instance.setpieceDefenseEdge,
      'tempoEdge': instance.tempoEdge,
      'playmakerEdge': instance.playmakerEdge,
      'strikerSupportEdge': instance.strikerSupportEdge,
    };
