import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum DribblingRisk {
  veryConservative('Very Conservative'),
  balanced('Balanced'),
  aggressive('Aggressive');

  const DribblingRisk(this.label);
  final String label;
  static DribblingRisk fromLabel(String value) => enumFromLabel(
    DribblingRisk.values,
    (item) => item.label,
    value,
    'DribblingRisk',
  );
  @override
  String toString() => label;
}
