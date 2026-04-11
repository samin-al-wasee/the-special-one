import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';

part 'tactical_insight.freezed.dart';
part 'tactical_insight.g.dart';

@freezed
abstract class TacticalInsight with _$TacticalInsight {
  const factory TacticalInsight({
    required int id,
    required int minute,
    required TacticalSignalLevel level,
    required String message,
    String? suggestedAction,
    TeamSide? relatedTeam,
  }) = _TacticalInsight;

  const TacticalInsight._();

  factory TacticalInsight.fromJson(Map<String, dynamic> json) =>
      _$TacticalInsightFromJson(json);
}
