enum TacticalSignalLevel { info, positive, warning, critical }

extension TacticalSignalLevelX on TacticalSignalLevel {
  bool get requiresAction {
    return this == TacticalSignalLevel.warning ||
        this == TacticalSignalLevel.critical;
  }
}
