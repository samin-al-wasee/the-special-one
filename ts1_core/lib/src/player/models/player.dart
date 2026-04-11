import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/player/player_attributes.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required int id,
    required String name,
    required DateTime dateOfBirth,
    required double heightCm,
    required double weightKg,
    required Position position,
    required Footedness footedness,
    @Default({}) Map<TechnicalAttr, int> technical,
    @Default({}) Map<MentalAttr, int> mental,
    @Default({}) Map<PhysicalAttr, int> physical,
    @Default({}) Map<HiddenAttr, int> hidden,
    @Default({}) Map<ConditionAttr, int> condition,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

extension PlayerStats on Player {
  /// Age on a given date (default: today)
  int age({DateTime? onDate}) {
    final date = onDate ?? DateTime.now();
    int age = date.year - dateOfBirth.year;
    if (date.month < dateOfBirth.month ||
        (date.month == dateOfBirth.month && date.day < dateOfBirth.day)) {
      age -= 1;
    }
    return age;
  }

  /// Height in meters
  double get heightM => double.parse((heightCm / 100).toStringAsFixed(2));

  /// Height in feet and inches
  String get heightFtInch {
    final totalInches = heightCm / 2.54;
    final feet = totalInches ~/ 12;
    final inches = totalInches % 12;
    return "${feet.toInt()}'${inches.toInt()}\"";
  }

  /// Weight in pounds
  double get weightLb => double.parse((weightKg * 2.20462).toStringAsFixed(1));
}
