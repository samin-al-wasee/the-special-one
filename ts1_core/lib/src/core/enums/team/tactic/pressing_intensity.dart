import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum PressingIntensity {
  veryLow('Very Low'),
  low('Low'),
  balanced('Balanced'),
  high('High'),
  extreme('Extreme');

  const PressingIntensity(this.label);
  final String label;
  static PressingIntensity fromLabel(String value) => enumFromLabel(
    PressingIntensity.values,
    (item) => item.label,
    value,
    'PressingIntensity',
  );
  @override
  String toString() => label;
}
