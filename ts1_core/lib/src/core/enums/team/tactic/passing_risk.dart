import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum PassingRisk {
  verySafe('Very Safe'),
  safe('Safe'),
  balanced('Balanced'),
  risky('Risky'),
  veryRisky('Very Risky');

  const PassingRisk(this.label);
  final String label;
  static PassingRisk fromLabel(String value) => enumFromLabel(
    PassingRisk.values,
    (item) => item.label,
    value,
    'PassingRisk',
  );
  @override
  String toString() => label;
}
