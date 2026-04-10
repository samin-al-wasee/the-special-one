// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_clock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchClock _$MatchClockFromJson(Map<String, dynamic> json) => _MatchClock(
  minute: (json['minute'] as num?)?.toInt() ?? 0,
  second: (json['second'] as num?)?.toInt() ?? 0,
  extraTimeFirstHalf: (json['extraTimeFirstHalf'] as num?)?.toInt() ?? 0,
  extraTimeSecondHalf: (json['extraTimeSecondHalf'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MatchClockToJson(_MatchClock instance) =>
    <String, dynamic>{
      'minute': instance.minute,
      'second': instance.second,
      'extraTimeFirstHalf': instance.extraTimeFirstHalf,
      'extraTimeSecondHalf': instance.extraTimeSecondHalf,
    };
