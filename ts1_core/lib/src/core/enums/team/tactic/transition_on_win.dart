import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum TransitionOnWin {
  counterImmediately('Counter Immediately'),
  progressSafely('Progress Safely'),
  holdShape('Hold Shape'),
  feedPlaymaker('Feed Playmaker'),
  feedWinger('Feed Winger'),
  goLongToStriker('Go Long To Striker'),
  attackWeakSide('Attack Weak Side');

  const TransitionOnWin(this.label);
  final String label;
  static TransitionOnWin fromLabel(String value) => enumFromLabel(
    TransitionOnWin.values,
    (item) => item.label,
    value,
    'TransitionOnWin',
  );
  @override
  String toString() => label;
}
