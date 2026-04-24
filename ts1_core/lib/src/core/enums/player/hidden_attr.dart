import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

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

  static HiddenAttr fromLabel(String value) => enumFromLabel(
    HiddenAttr.values,
    (item) => item.label,
    value,
    'HiddenAttr',
  );
  @override
  String toString() => label;
}
