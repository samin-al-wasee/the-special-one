// generators/services/physical_generator_service.dart
import 'dart:math';
import 'package:ts1_core/ts1_core.dart';
import '../models/country_culture_profile.dart';

class PhysicalGeneratorService {
  final Random _random = Random();

  double generateHeight(Position position, CountryCultureProfile culture) {
    double baseHeight;

    switch (position) {
      case Position.goalKeeper:
        baseHeight = 185 + _random.nextDouble() * 15; // 185-200
        break;
      case Position.centerBack:
        baseHeight = 180 + _random.nextDouble() * 15; // 180-195
        break;
      case Position.striker:
        baseHeight = 175 + _random.nextDouble() * 15; // 175-190
        break;
      case Position.defensiveMidfielder:
        baseHeight = 175 + _random.nextDouble() * 15; // 175-190
        break;
      default:
        baseHeight = 170 + _random.nextDouble() * 15; // 170-185
    }

    // Adjust based on country physical quality
    final adjustment = ((culture.physicalQuality - 0.75) * 5).round();
    return (baseHeight + adjustment).clamp(160, 205);
  }

  double calculateWeight(double heightCm, Map<PhysicalAttr, int> physical) {
    // Base BMI calculation (normal BMI ~22)
    double baseWeight = (heightCm / 100) * (heightCm / 100) * 22;

    // Adjust based on strength and stamina (1-20 scale)
    final strengthBonus = (physical[PhysicalAttr.strength]! - 10) * 0.6;
    final staminaBonus = (physical[PhysicalAttr.stamina]! - 10) * 0.3;
    final paceBonus = (physical[PhysicalAttr.pace]! - 10) * 0.2;

    return (baseWeight + strengthBonus + staminaBonus + paceBonus).clamp(60, 110);
  }

  Footedness generateFootedness() {
    // 80% right-footed, 20% left-footed
    return _random.nextDouble() < 0.8 ? Footedness.right : Footedness.left;
  }
}
