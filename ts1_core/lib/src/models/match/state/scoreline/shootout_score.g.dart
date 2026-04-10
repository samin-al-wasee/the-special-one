// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shootout_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShootoutScore _$ShootoutScoreFromJson(Map<String, dynamic> json) =>
    _ShootoutScore(
      home: (json['home'] as num?)?.toInt() ?? 0,
      away: (json['away'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ShootoutScoreToJson(_ShootoutScore instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};
