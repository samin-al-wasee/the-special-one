// generators/models/player_quality.dart
enum PlayerQuality { worldClass, good, average, poor }

extension PlayerQualityExtension on PlayerQuality {
  String get label {
    switch (this) {
      case PlayerQuality.worldClass:
        return 'World Class';
      case PlayerQuality.good:
        return 'Good';
      case PlayerQuality.average:
        return 'Average';
      case PlayerQuality.poor:
        return 'Poor';
    }
  }
}
