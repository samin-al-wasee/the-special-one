import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum MarkingStyle {
  zonal('Zonal'),
  mixed('Mixed'),
  tightManOriented('Tight Man-Oriented');

  const MarkingStyle(this.label);
  final String label;
  static MarkingStyle fromLabel(String value) => enumFromLabel(
    MarkingStyle.values,
    (item) => item.label,
    value,
    'MarkingStyle',
  );
  @override
  String toString() => label;
}
