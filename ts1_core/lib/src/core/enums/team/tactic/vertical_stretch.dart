import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum VerticalStretch {
  compressed('Compressed'),
  balanced('Balanced'),
  stretched('Stretched');

  const VerticalStretch(this.label);
  final String label;
  static VerticalStretch fromLabel(String value) => enumFromLabel(
    VerticalStretch.values,
    (item) => item.label,
    value,
    'VerticalStretch',
  );
  @override
  String toString() => label;
}
