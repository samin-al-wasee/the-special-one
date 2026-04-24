import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum TacklingAggression {
  stayOnFeet('Stay On Feet'),
  balanced('Balanced'),
  aggressive('Aggressive'),
  veryAggressive('Very Aggressive');

  const TacklingAggression(this.label);
  final String label;
  static TacklingAggression fromLabel(String value) => enumFromLabel(
    TacklingAggression.values,
    (item) => item.label,
    value,
    'TacklingAggression',
  );
  @override
  String toString() => label;
}
