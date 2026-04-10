import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_clock.freezed.dart';
part 'match_clock.g.dart';

@freezed
abstract class MatchClock with _$MatchClock {
  const factory MatchClock({
    @Default(0) int minute,
    @Default(0) int second,
    @Default(0) int extraTimeFirstHalf,
    @Default(0) int extraTimeSecondHalf,
  }) = _MatchClock;

  factory MatchClock.fromJson(Map<String, dynamic> json) =>
      _$MatchClockFromJson(json);

  const MatchClock._();

  int get totalElapsedSeconds => (minute * 60) + second;

  bool hasReachedMinute(int targetMinute) => minute >= targetMinute;

  bool get isHalfTimeWindow => minute >= 45 && minute < 46;
  bool get isFullTimeWindow => minute >= 90;

  MatchClock addSeconds(int value) {
    if (value <= 0) {
      return this;
    }
    final total = totalElapsedSeconds + value;
    return copyWith(minute: total ~/ 60, second: total % 60);
  }

  MatchClock withExtraTimeCounters({
    required int regulationMinutes,
    required int extraTimeMinutesPerHalf,
  }) {
    final regulationSeconds = regulationMinutes * 60;
    final extraTimeTotalSeconds = extraTimeMinutesPerHalf * 2 * 60;
    final elapsedExtraTimeSeconds = (totalElapsedSeconds - regulationSeconds)
        .clamp(0, extraTimeTotalSeconds);
    final elapsedExtraTimeMinutes = elapsedExtraTimeSeconds ~/ 60;
    final firstHalfMinutes = elapsedExtraTimeMinutes.clamp(
      0,
      extraTimeMinutesPerHalf,
    );
    final secondHalfMinutes = (elapsedExtraTimeMinutes - firstHalfMinutes)
        .clamp(0, extraTimeMinutesPerHalf);

    return copyWith(
      extraTimeFirstHalf: firstHalfMinutes,
      extraTimeSecondHalf: secondHalfMinutes,
    );
  }

  @override
  String toString() {
    final mm = minute.toString().padLeft(2, '0');
    final ss = second.toString().padLeft(2, '0');
    return '$mm:$ss';
  }
}
