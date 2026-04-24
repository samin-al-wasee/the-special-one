import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum SetPieceAttack {
  nearPostCorners('Near-post corners'),
  farPostCorners('Far-post corners'),
  mixedCorners('Mixed corners'),
  shortCorners('Short corners'),
  crowdGoalkeeper('Crowd goalkeeper'),
  edgeOfBoxSetup('Edge-of-box setup'),
  tallPlayerTargeting('Tall-player targeting'),
  reboundHunting('Rebound hunting');

  const SetPieceAttack(this.label);
  final String label;
  static SetPieceAttack fromLabel(String value) => enumFromLabel(
    SetPieceAttack.values,
    (item) => item.label,
    value,
    'SetPieceAttack',
  );
  @override
  String toString() => label;
}
