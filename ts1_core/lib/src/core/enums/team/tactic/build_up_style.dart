import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum BuildUpStyle {
  buildFromBack('Build From Back'),
  mixedBuildUp('Mixed Build-Up'),
  directProgression('Direct Progression'),
  longBall('Long Ball'),
  counterBuildUp('Counter Build-Up');

  const BuildUpStyle(this.label);
  final String label;
  static BuildUpStyle fromLabel(String value) => enumFromLabel(
    BuildUpStyle.values,
    (item) => item.label,
    value,
    'BuildUpStyle',
  );
  @override
  String toString() => label;
}
