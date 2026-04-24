import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum TransitionOnLoss {
  counterpress('Counterpress'),
  delay('Delay'),
  regroup('Regroup'),
  tacticalFoul('Tactical Foul'),
  dropDeepImmediately('Drop Deep Immediately');

  const TransitionOnLoss(this.label);
  final String label;
  static TransitionOnLoss fromLabel(String value) => enumFromLabel(
    TransitionOnLoss.values,
    (item) => item.label,
    value,
    'TransitionOnLoss',
  );
  @override
  String toString() => label;
}
