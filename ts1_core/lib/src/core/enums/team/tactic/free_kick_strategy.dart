import '../../player/player_attribute_utils.dart';

enum FreeKickStrategy {
  shootDirect('Shoot direct'),
  crossIntoBox('Cross into box'),
  shortRoutine('Short routine'),
  fastRestart('Fast restart');

  final String label;
  const FreeKickStrategy(this.label);

  static FreeKickStrategy fromLabel(String value) => enumFromLabel(
    FreeKickStrategy.values,
    (item) => item.label,
    value,
    'FreeKickStrategy',
  );

  @override
  String toString() => label;
}
