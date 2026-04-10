import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/match_enums.dart';

part 'scoreline.freezed.dart';
part 'scoreline.g.dart';

@freezed
abstract class Scoreline with _$Scoreline {
  const factory Scoreline({
    required int id,
    @Default(0) int home,
    @Default(0) int away,
  }) = _Scoreline;

  factory Scoreline.fromJson(Map<String, dynamic> json) =>
      _$ScorelineFromJson(json);

  const Scoreline._();

  bool get isLevel => home == away;

  int goalDiffFor(TeamSide side) {
    return side == TeamSide.home ? home - away : away - home;
  }

  Scoreline scoreGoal(TeamSide side) {
    return side == TeamSide.home
        ? copyWith(home: home + 1)
        : copyWith(away: away + 1);
  }

  @override
  String toString() => '$home-$away';
}
