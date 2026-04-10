import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/match_enums.dart';

part 'shootout_score.freezed.dart';
part 'shootout_score.g.dart';

@freezed
abstract class ShootoutScore with _$ShootoutScore {
  const factory ShootoutScore({@Default(0) int home, @Default(0) int away}) =
      _ShootoutScore;

  factory ShootoutScore.fromJson(Map<String, dynamic> json) =>
      _$ShootoutScoreFromJson(json);

  const ShootoutScore._();

  bool get hasShootout => home > 0 || away > 0;

  ShootoutScore scorePenalty(TeamSide side) {
    return side == TeamSide.home
        ? copyWith(home: home + 1)
        : copyWith(away: away + 1);
  }

  @override
  String toString() => '$home-$away';
}
