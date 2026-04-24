import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum Tempo {
  veryLow('Very Low'),
  low('Low'),
  balanced('Balanced'),
  high('High'),
  veryHigh('Very High');

  const Tempo(this.label);
  final String label;
  static Tempo fromLabel(String value) =>
      enumFromLabel(Tempo.values, (item) => item.label, value, 'Tempo');
  @override
  String toString() => label;
}
