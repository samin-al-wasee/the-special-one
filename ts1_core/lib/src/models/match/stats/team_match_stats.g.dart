// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_match_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamMatchStats _$TeamMatchStatsFromJson(Map<String, dynamic> json) =>
    _TeamMatchStats(
      id: (json['id'] as num).toInt(),
      possession: (json['possession'] as num?)?.toDouble() ?? 50.0,
      shots: (json['shots'] as num?)?.toInt() ?? 0,
      shotsOnTarget: (json['shotsOnTarget'] as num?)?.toInt() ?? 0,
      chancesCreated: (json['chancesCreated'] as num?)?.toInt() ?? 0,
      expectedGoals: (json['expectedGoals'] as num?)?.toDouble() ?? 0.0,
      passesCompleted: (json['passesCompleted'] as num?)?.toInt() ?? 0,
      passesAttempted: (json['passesAttempted'] as num?)?.toInt() ?? 0,
      turnovers: (json['turnovers'] as num?)?.toInt() ?? 0,
      fouls: (json['fouls'] as num?)?.toInt() ?? 0,
      yellowCards: (json['yellowCards'] as num?)?.toInt() ?? 0,
      redCards: (json['redCards'] as num?)?.toInt() ?? 0,
      corners: (json['corners'] as num?)?.toInt() ?? 0,
      offsides: (json['offsides'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TeamMatchStatsToJson(_TeamMatchStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'possession': instance.possession,
      'shots': instance.shots,
      'shotsOnTarget': instance.shotsOnTarget,
      'chancesCreated': instance.chancesCreated,
      'expectedGoals': instance.expectedGoals,
      'passesCompleted': instance.passesCompleted,
      'passesAttempted': instance.passesAttempted,
      'turnovers': instance.turnovers,
      'fouls': instance.fouls,
      'yellowCards': instance.yellowCards,
      'redCards': instance.redCards,
      'corners': instance.corners,
      'offsides': instance.offsides,
    };
