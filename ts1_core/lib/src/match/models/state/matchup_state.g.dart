// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchupState _$MatchupStateFromJson(
  Map<String, dynamic> json,
) => _MatchupState(
  id: (json['id'] as num).toInt(),
  homeAttackVsAwayDefense:
      (json['homeAttackVsAwayDefense'] as num?)?.toDouble() ?? 0.0,
  awayAttackVsHomeDefense:
      (json['awayAttackVsHomeDefense'] as num?)?.toDouble() ?? 0.0,
  midfieldControlEdge: (json['midfieldControlEdge'] as num?)?.toDouble() ?? 0.0,
  transitionControlEdge:
      (json['transitionControlEdge'] as num?)?.toDouble() ?? 0.0,
  wingControlEdge: (json['wingControlEdge'] as num?)?.toDouble() ?? 0.0,
  setPieceControlEdge: (json['setPieceControlEdge'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MatchupStateToJson(_MatchupState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeAttackVsAwayDefense': instance.homeAttackVsAwayDefense,
      'awayAttackVsHomeDefense': instance.awayAttackVsHomeDefense,
      'midfieldControlEdge': instance.midfieldControlEdge,
      'transitionControlEdge': instance.transitionControlEdge,
      'wingControlEdge': instance.wingControlEdge,
      'setPieceControlEdge': instance.setPieceControlEdge,
    };
