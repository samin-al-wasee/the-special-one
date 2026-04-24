import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum Width {
  veryNarrow('Very Narrow'),
  narrow('Narrow'),
  balanced('Balanced'),
  wide('Wide'),
  veryWide('Very Wide');

  const Width(this.label);
  final String label;
  static Width fromLabel(String value) =>
      enumFromLabel(Width.values, (item) => item.label, value, 'Width');
  @override
  String toString() => label;
}
