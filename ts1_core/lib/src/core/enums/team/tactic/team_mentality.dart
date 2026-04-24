import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum TeamMentality {
  veryDefensive('Very Defensive'),
  defensive('Defensive'),
  cautious('Cautious'),
  balanced('Balanced'),
  positive('Positive'),
  attacking('Attacking'),
  veryAttacking('Very Attacking');

  const TeamMentality(this.label);
  final String label;
  static TeamMentality fromLabel(String value) => enumFromLabel(
    TeamMentality.values,
    (item) => item.label,
    value,
    'TeamMentality',
  );
  @override
  String toString() => label;
}
