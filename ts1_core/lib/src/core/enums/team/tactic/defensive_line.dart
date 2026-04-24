import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum DefensiveLine {
  veryDeep('Very Deep'),
  deep('Deep'),
  standard('Standard'),
  high('High'),
  veryHigh('Very High');

  const DefensiveLine(this.label);
  final String label;
  static DefensiveLine fromLabel(String value) => enumFromLabel(
    DefensiveLine.values,
    (item) => item.label,
    value,
    'DefensiveLine',
  );
  @override
  String toString() => label;
}
