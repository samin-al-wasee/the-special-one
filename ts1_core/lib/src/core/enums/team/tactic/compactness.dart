import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum Compactness {
  veryCompact('Very Compact'),
  compact('Compact'),
  balanced('Balanced'),
  loose('Loose'),
  veryLoose('Very Loose');

  const Compactness(this.label);
  final String label;
  static Compactness fromLabel(String value) => enumFromLabel(
    Compactness.values,
    (item) => item.label,
    value,
    'Compactness',
  );
  @override
  String toString() => label;
}
