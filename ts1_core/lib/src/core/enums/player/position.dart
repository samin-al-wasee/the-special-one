enum Position {
  goalKeeper('Goalkeeper'),
  rightBack('Right Back'),
  centerBack('Center Back'),
  leftBack('Left Back'),
  defensiveMidfielder('Defensive Midfielder'),
  centralMidfielder('Central Midfielder'),
  attackingMidfielder('Attacking Midfielder'),
  rightMidfielder('Right Midfielder'),
  leftMidfielder('Left Midfielder'),
  rightWinger('Right Winger'),
  leftWinger('Left Winger'),
  striker('Striker');

  const Position(this.label);

  final String label;

  /// Returns the canonical value for JSON or display.
  String get code => label;

  static Position fromLabel(String value) {
    final normalized = value.trim().toLowerCase();
    return Position.values.firstWhere(
      (position) => position.label.toLowerCase() == normalized,
      orElse: () => throw ArgumentError('Unknown Position: $value'),
    );
  }

  /// Normalize common aliases into canonical V1 Position.
  static Position normalize(Object value) {
    if (value is Position) return value;
    if (value is String) {
      final v = value.trim().toUpperCase();
      return _positionAliases[v] ?? fromLabel(v);
    }
    throw ArgumentError('Cannot normalize value: $value');
  }

  @override
  String toString() => label;
}

/// Optional helper for input cleanup (normalize aliases)
const Map<String, Position> _positionAliases = {
  'CDM': Position.defensiveMidfielder,
  'CAM': Position.attackingMidfielder,
  'RCM': Position.centralMidfielder,
  'LCM': Position.centralMidfielder,
  'RAM': Position.attackingMidfielder,
  'LAM': Position.attackingMidfielder,
  'RM': Position.rightMidfielder,
  'LM': Position.leftMidfielder,
  'CF': Position.striker,
  'RF': Position.striker,
  'LF': Position.striker,
  'RWB': Position.rightBack,
  'LWB': Position.leftBack,
};
