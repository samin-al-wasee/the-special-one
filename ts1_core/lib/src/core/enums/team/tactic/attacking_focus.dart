import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum AttackingFocus {
  attackLeft('Attack Left'),
  attackRight('Attack Right'),
  attackCentre('Attack Centre'),
  mixed('Mixed'),
  switchFlanksOften('Switch Flanks Often'),
  targetHalfSpaces('Target Half-Spaces');

  const AttackingFocus(this.label);
  final String label;
  static AttackingFocus fromLabel(String value) => enumFromLabel(
    AttackingFocus.values,
    (item) => item.label,
    value,
    'AttackingFocus',
  );
  @override
  String toString() => label;
}
