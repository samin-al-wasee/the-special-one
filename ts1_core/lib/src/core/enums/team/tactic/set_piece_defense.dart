import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum SetPieceDefense {
  zonalMarking('Zonal marking'),
  mixedMarking('Mixed marking'),
  manMarking('Man marking'),
  leavePlayersUp('Leave players up'),
  fullRetreat('Full retreat'),
  counterSetup('Counter setup'),
  nearPostGuard('Near-post guard');

  const SetPieceDefense(this.label);
  final String label;
  static SetPieceDefense fromLabel(String value) => enumFromLabel(
    SetPieceDefense.values,
    (item) => item.label,
    value,
    'SetPieceDefense',
  );
  @override
  String toString() => label;
}
