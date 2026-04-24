import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

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
  static MentalAttr fromLabel(String value) => enumFromLabel(
    MentalAttr.values,
    (item) => item.label,
    value,
    'MentalAttr',
  );
  @override
  String toString() => label;
}
