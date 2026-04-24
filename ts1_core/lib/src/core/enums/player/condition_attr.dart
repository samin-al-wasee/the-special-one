import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum ConditionAttr {
  matchFitness('Match Fitness'),
  sharpness('Sharpness'),
  morale('Morale'),
  fatigue('Fatigue'),
  injuryRisk('Injury Risk'),
  discipline('Discipline'),
  focus('Focus');

  const ConditionAttr(this.label);

  final String label;

  static ConditionAttr fromLabel(String value) => enumFromLabel(
    ConditionAttr.values,
    (item) => item.label,
    value,
    'ConditionAttr',
  );
  @override
  String toString() => label;
}
