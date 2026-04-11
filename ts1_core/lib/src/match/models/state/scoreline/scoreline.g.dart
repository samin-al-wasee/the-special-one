// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Scoreline _$ScorelineFromJson(Map<String, dynamic> json) => _Scoreline(
  id: (json['id'] as num).toInt(),
  home: (json['home'] as num?)?.toInt() ?? 0,
  away: (json['away'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ScorelineToJson(_Scoreline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home': instance.home,
      'away': instance.away,
    };
