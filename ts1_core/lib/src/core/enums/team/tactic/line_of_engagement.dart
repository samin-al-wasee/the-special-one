import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum LineOfEngagement {
  lowBlock('Low Block'),
  midBlock('Mid Block'),
  highBlock('High Block'),
  fullPress('Full Press');

  const LineOfEngagement(this.label);
  final String label;
  static LineOfEngagement fromLabel(String value) => enumFromLabel(
    LineOfEngagement.values,
    (item) => item.label,
    value,
    'LineOfEngagement',
  );
  @override
  String toString() => label;
}
