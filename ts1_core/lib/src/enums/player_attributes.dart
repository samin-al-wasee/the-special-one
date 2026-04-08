const int defaultAttr = 50;

T _enumFromLabel<T extends Enum>(
  List<T> values,
  String Function(T value) labelOf,
  String value,
  String enumName,
) {
  final normalized = value.trim();
  return values.firstWhere(
    (item) => labelOf(item) == normalized,
    orElse: () => throw ArgumentError('Unknown $enumName: $value'),
  );
}

/// Safely get attribute value from a map
int getPlayerAttr(
  Map<String, int>? bucket,
  Object key, {
  int defaultValue = defaultAttr,
}) {
  if (bucket == null || bucket.isEmpty) return defaultValue;

  final keyStr = key.toString().trim();

  // Direct match
  if (bucket.containsKey(keyStr)) return bucket[keyStr]!;

  // Snake case conversion
  final snakeKey = keyStr
      .toLowerCase()
      .replaceAll('-', ' ')
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .join('_');
  final titleKey = snakeKey
      .split('_')
      .where((part) => part.isNotEmpty)
      .map((e) => e[0].toUpperCase() + e.substring(1))
      .join(' ');

  if (bucket.containsKey(snakeKey)) return bucket[snakeKey]!;
  if (bucket.containsKey(titleKey)) return bucket[titleKey]!;

  // Backwards compatibility: short_passing <-> passing
  if (snakeKey == 'short_passing') {
    if (bucket.containsKey('passing')) return bucket['passing']!;
    if (bucket.containsKey('Passing')) return bucket['Passing']!;
  }
  if (snakeKey == 'passing') {
    if (bucket.containsKey('short_passing')) return bucket['short_passing']!;
    if (bucket.containsKey('Short Passing')) {
      return bucket['Short Passing']!;
    }
  }

  return defaultValue;
}

enum TechnicalAttr {
  firstTouch('First Touch'),
  technique('Technique'),
  ballControl('Ball Control'),
  dribbling('Dribbling'),
  flair('Flair'),
  shortPassing('Short Passing'),
  passing('Short Passing'),
  crossing('Crossing'),
  longPassing('Long Passing'),
  setPieceDelivery('Set Piece Delivery'),
  finishing('Finishing'),
  longShots('Long Shots'),
  shotPower('Shot Power'),
  heading('Heading'),
  volleys('Volleys'),
  weakFootAccuracy('Weak Foot Accuracy'),
  tackling('Tackling'),
  marking('Marking'),
  intercepting('Intercepting'),
  gkHandling('GK Handling'),
  gkReflexes('GK Reflexes'),
  gkOneOnOnes('GK One On Ones'),
  gkKicking('GK Kicking'),
  gkCommandOfArea('GK Command Of Area'),
  gkAerialReach('GK Aerial Reach'),
  gkThrowing('GK Throwing'),
  gkPositioning('GK Positioning'),
  gkCommunication('GK Communication');

  const TechnicalAttr(this.label);

  final String label;

  static TechnicalAttr fromLabel(String value) => _enumFromLabel(
    TechnicalAttr.values,
    (item) => item.label,
    value,
    'TechnicalAttr',
  );

  @override
  String toString() => label;
}

enum MentalAttr {
  composure('Composure'),
  decisions('Decisions'),
  anticipation('Anticipation'),
  concentration('Concentration'),
  vision('Vision'),
  offBall('Off Ball'),
  creativity('Creativity'),
  positioning('Positioning'),
  teamwork('Teamwork'),
  discipline('Discipline'),
  tacticalAwareness('Tactical Awareness'),
  aggression('Aggression'),
  workRate('Work Rate'),
  leadership('Leadership'),
  bravery('Bravery'),
  determination('Determination'),
  pressResistance('Press Resistance');

  const MentalAttr(this.label);

  final String label;

  static MentalAttr fromLabel(String value) => _enumFromLabel(
    MentalAttr.values,
    (item) => item.label,
    value,
    'MentalAttr',
  );

  @override
  String toString() => label;
}

enum PhysicalAttr {
  pace('Pace'),
  acceleration('Acceleration'),
  agility('Agility'),
  balance('Balance'),
  stamina('Stamina'),
  strength('Strength'),
  jumping('Jumping'),
  naturalFitness('Natural Fitness'),
  injuryResistance('Injury Resistance'),
  recovery('Recovery');

  const PhysicalAttr(this.label);

  final String label;

  static PhysicalAttr fromLabel(String value) => _enumFromLabel(
    PhysicalAttr.values,
    (item) => item.label,
    value,
    'PhysicalAttr',
  );

  @override
  String toString() => label;
}

enum ConditionAttr {
  matchFitness('Match Fitness'),
  sharpness('Sharpness'),
  morale('Morale'),
  fatigue('Fatigue'),
  injuryRisk('Injury Risk'),
  discipline('Discipline'),
  focus('Focus');

  const ConditionAttr(this.label);

  final String label;

  static ConditionAttr fromLabel(String value) => _enumFromLabel(
    ConditionAttr.values,
    (item) => item.label,
    value,
    'ConditionAttr',
  );

  @override
  String toString() => label;
}

enum HiddenAttr {
  consistency('Consistency'),
  bigMatches('Big Matches'),
  professionalism('Professionalism'),
  ambition('Ambition'),
  adaptability('Adaptability'),
  temperament('Temperament'),
  loyalty('Loyalty'),
  injuryProneness('Injury Proneness'),
  consistencyUnderPressure('Consistency Under Pressure'),
  versatility('Versatility');

  const HiddenAttr(this.label);

  final String label;

  static HiddenAttr fromLabel(String value) => _enumFromLabel(
    HiddenAttr.values,
    (item) => item.label,
    value,
    'HiddenAttr',
  );

  @override
  String toString() => label;
}

enum Footedness {
  left('Left'),
  right('Right');

  const Footedness(this.label);

  final String label;

  String get code => label;

  static Footedness fromLabel(String value) => _enumFromLabel(
    Footedness.values,
    (item) => item.label,
    value,
    'Footedness',
  );

  static Footedness normalize(Object value) {
    if (value is Footedness) return value;
    if (value is String) {
      final v = value.trim().toLowerCase();
      switch (v) {
        case 'left':
          return left;
        case 'right':
          return right;
        default:
          throw ArgumentError('Unknown Footedness: $value');
      }
    }
    throw ArgumentError('Cannot normalize value: $value');
  }

  @override
  String toString() => label;
}
