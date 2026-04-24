import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum ShootingPolicy {
  shootLess('Shoot Less'),
  balanced('Balanced'),
  shootMore('Shoot More'),
  shootAggressively('Shoot Aggressively');

  const ShootingPolicy(this.label);
  final String label;
  static ShootingPolicy fromLabel(String value) => enumFromLabel(
    ShootingPolicy.values,
    (item) => item.label,
    value,
    'ShootingPolicy',
  );
  @override
  String toString() => label;
}
