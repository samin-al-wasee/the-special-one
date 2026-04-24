import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum Footedness {
  left('Left'),
  right('Right');

  const Footedness(this.label);

  final String label;

  String get code => label;
  static Footedness fromLabel(String value) => enumFromLabel(
    Footedness.values,
    (item) => item.label,
    value,
    'Footedness',
  );
  static Footedness normalize(Object value) {
    if (value is Footedness) return value;
    if (value is String) {
      final v = value.trim().toLowerCase();
      switch (v) {
        case 'left':
          return left;
        case 'right':
          return right;
        default:
          throw ArgumentError('Unknown Footedness: $value');
      }
    }
    throw ArgumentError('Cannot normalize value: $value');
  }

  @override
  String toString() => label;
}
