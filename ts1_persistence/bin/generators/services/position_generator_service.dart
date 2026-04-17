// generators/services/position_generator_service.dart
import 'dart:math';
import 'package:ts1_core/ts1_core.dart';
import '../models/country_culture_profile.dart';

class PositionGeneratorService {
  final Random _random = Random();

  Position generatePosition(CountryCultureProfile culture) {
    // Weighted position selection based on country preferences
    final weights = <Position, double>{
      Position.goalKeeper: 0.08,
      Position.rightBack: 0.09,
      Position.leftBack: 0.09,
      Position.centerBack: 0.12,
      Position.defensiveMidfielder: 0.10,
      Position.centralMidfielder: 0.14,
      Position.attackingMidfielder: 0.10,
      Position.rightMidfielder: 0.07,
      Position.leftMidfielder: 0.07,
      Position.rightWinger: 0.07,
      Position.leftWinger: 0.07,
      Position.striker: 0.10,
    };

    // Adjust weights based on preferred positions
    for (final preferred in culture.preferredPositions) {
      final position = _stringToPosition(preferred);
      if (position != null) {
        weights[position] = (weights[position] ?? 0.08) + 0.04;
      }
    }

    // Normalize weights
    double total = weights.values.reduce((a, b) => a + b);
    final rand = _random.nextDouble() * total;
    double cumulative = 0;

    for (final entry in weights.entries) {
      cumulative += entry.value;
      if (rand <= cumulative) {
        return entry.key;
      }
    }

    return Position.centralMidfielder;
  }

  Position? _stringToPosition(String str) {
    switch (str.toLowerCase()) {
      case 'goalkeeper':
        return Position.goalKeeper;
      case 'right back':
        return Position.rightBack;
      case 'left back':
        return Position.leftBack;
      case 'center back':
        return Position.centerBack;
      case 'defensive midfielder':
        return Position.defensiveMidfielder;
      case 'central midfielder':
        return Position.centralMidfielder;
      case 'attacking midfielder':
        return Position.attackingMidfielder;
      case 'right midfielder':
        return Position.rightMidfielder;
      case 'left midfielder':
        return Position.leftMidfielder;
      case 'right winger':
        return Position.rightWinger;
      case 'left winger':
        return Position.leftWinger;
      case 'striker':
        return Position.striker;
      default:
        return null;
    }
  }
}
