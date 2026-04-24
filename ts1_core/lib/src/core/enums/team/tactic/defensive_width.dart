import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum DefensiveWidth {
  veryNarrow('Very Narrow'),
  narrow('Narrow'),
  balanced('Balanced'),
  wide('Wide'),
  veryWide('Very Wide');

  const DefensiveWidth(this.label);
  final String label;
  static DefensiveWidth fromLabel(String value) => enumFromLabel(
    DefensiveWidth.values,
    (item) => item.label,
    value,
    'DefensiveWidth',
  );
  @override
  String toString() => label;
}
