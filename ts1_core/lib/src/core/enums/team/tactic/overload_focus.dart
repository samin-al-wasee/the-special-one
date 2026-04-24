import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum OverloadFocus {
  leftOverload('Left overload'),
  rightOverload('Right overload'),
  centralOverload('Central overload'),
  noSpecificOverload('No specific overload');

  const OverloadFocus(this.label);
  final String label;
  static OverloadFocus fromLabel(String value) => enumFromLabel(
    OverloadFocus.values,
    (item) => item.label,
    value,
    'OverloadFocus',
  );
  @override
  String toString() => label;
}
