import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum PhysicalAttr {
  pace('Pace'),
  acceleration('Acceleration'),
  agility('Agility'),
  balance('Balance'),
  stamina('Stamina'),
  strength('Strength'),
  jumping('Jumping'),
  naturalFitness('Natural Fitness'),
  injuryResistance('Injury Resistance'),
  recovery('Recovery');

  const PhysicalAttr(this.label);
  final String label;
  static PhysicalAttr fromLabel(String value) => enumFromLabel(
    PhysicalAttr.values,
    (item) => item.label,
    value,
    'PhysicalAttr',
  );
  @override
  String toString() => label;
}
