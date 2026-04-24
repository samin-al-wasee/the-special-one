import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum FinalThirdFocus {
  workBallIntoBox('Work Ball Into Box'),
  mixedAttacking('Mixed Attacking'),
  shootOnSight('Shoot On Sight'),
  crossEarly('Cross Early'),
  overlapWide('Overlap Wide'),
  underlapInside('Underlap Inside'),
  throughBallFocus('Through Ball Focus'),
  dribbleMore('Dribble More'),
  holdPossession('Hold Possession');

  const FinalThirdFocus(this.label);
  final String label;
  static FinalThirdFocus fromLabel(String value) => enumFromLabel(
    FinalThirdFocus.values,
    (item) => item.label,
    value,
    'FinalThirdFocus',
  );
  @override
  String toString() => label;
}
