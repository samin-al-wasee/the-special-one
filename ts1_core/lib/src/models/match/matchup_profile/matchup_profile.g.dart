// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchupProfile _$MatchupProfileFromJson(
  Map<String, dynamic> json,
) => _MatchupProfile(
  id: (json['id'] as num).toInt(),
  buildupEdge: (json['buildupEdge'] as num?)?.toDouble() ?? 0.0,
  pressingEdge: (json['pressingEdge'] as num?)?.toDouble() ?? 0.0,
  counterpressingEdge: (json['counterpressingEdge'] as num?)?.toDouble() ?? 0.0,
  compactnessEdge: (json['compactnessEdge'] as num?)?.toDouble() ?? 0.0,
  defensiveLineEdge: (json['defensiveLineEdge'] as num?)?.toDouble() ?? 0.0,
  wideEdge: (json['wideEdge'] as num?)?.toDouble() ?? 0.0,
  centralEdge: (json['centralEdge'] as num?)?.toDouble() ?? 0.0,
  fullbackEdge: (json['fullbackEdge'] as num?)?.toDouble() ?? 0.0,
  finalThirdEdge: (json['finalThirdEdge'] as num?)?.toDouble() ?? 0.0,
  shootingRiskEdge: (json['shootingRiskEdge'] as num?)?.toDouble() ?? 0.0,
  transitionOutEdge: (json['transitionOutEdge'] as num?)?.toDouble() ?? 0.0,
  transitionInEdge: (json['transitionInEdge'] as num?)?.toDouble() ?? 0.0,
  aerialEdge: (json['aerialEdge'] as num?)?.toDouble() ?? 0.0,
  setpieceDefenseEdge: (json['setpieceDefenseEdge'] as num?)?.toDouble() ?? 0.0,
  tempoEdge: (json['tempoEdge'] as num?)?.toDouble() ?? 0.0,
  playmakerEdge: (json['playmakerEdge'] as num?)?.toDouble() ?? 0.0,
  strikerSupportEdge: (json['strikerSupportEdge'] as num?)?.toDouble() ?? 0.0,
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
