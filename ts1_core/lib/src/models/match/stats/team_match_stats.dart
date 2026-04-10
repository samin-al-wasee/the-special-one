import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_match_stats.freezed.dart';
part 'team_match_stats.g.dart';

@freezed
abstract class TeamMatchStats with _$TeamMatchStats {
  const factory TeamMatchStats({
    @Default(50.0) double possession,
    @Default(0) int shots,
    @Default(0) int shotsOnTarget,
    @Default(0) int chancesCreated,
    @Default(0.0) double expectedGoals,
    @Default(0) int passesCompleted,
    @Default(0) int passesAttempted,
    @Default(0) int turnovers,
    @Default(0) int fouls,
    @Default(0) int yellowCards,
    @Default(0) int redCards,
    @Default(0) int corners,
    @Default(0) int offsides,
  }) = _TeamMatchStats;

  factory TeamMatchStats.fromJson(Map<String, dynamic> json) =>
      _$TeamMatchStatsFromJson(json);

  const TeamMatchStats._();

  TeamMatchStats addChance({double xg = 0.0}) {
    return copyWith(
      chancesCreated: chancesCreated + 1,
      expectedGoals: expectedGoals + xg,
    );
  }

  TeamMatchStats addShot({bool onTarget = false, double xg = 0.0}) {
    return copyWith(
      shots: shots + 1,
      shotsOnTarget: onTarget ? shotsOnTarget + 1 : shotsOnTarget,
      expectedGoals: expectedGoals + xg,
    );
  }
}
