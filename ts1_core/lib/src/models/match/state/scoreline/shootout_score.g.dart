// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shootout_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShootoutScore _$ShootoutScoreFromJson(Map<String, dynamic> json) =>
    _ShootoutScore(
      id: (json['id'] as num).toInt(),
      home: (json['home'] as num?)?.toInt() ?? 0,
      away: (json['away'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ShootoutScoreToJson(_ShootoutScore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home': instance.home,
      'away': instance.away,
    };
