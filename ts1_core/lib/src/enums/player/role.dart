enum Role {
  shotStopper('Shot Stopper'),
  sweeperKeeper('Sweeper Keeper'),

  fullBack('Full Back'),
  wingBack('Wing Back'),
  invertedFullBack('Inverted Full Back'),
  defensiveFullBack('Defensive Full Back'),

  centralDefender('Central Defender'),
  stopper('Stopper'),
  ballPlayingDefender('Ball Playing Defender'),
  wideBack('Wide Back'),

  anchor('Anchor (Holding Midfielder)'),
  ballWinningMidfielder('Ball-Winning Midfielder'),
  regista('Regista (Deep-Lying Playmaker)'),
  halfBack('Half Back'),

  boxToBoxMidfielder('Box-to-Box Midfielder'),
  mezzala('Mezzala (Advanced Wide Midfielder)'),
  carrilero('Carrilero (Shuttling Midfielder)'),
  boxCrasher('Box Crasher'),

  shadowStriker('Shadow Striker'),
  trequartista('Trequartista (Playmaker)'),
  enganche('Enganche (Classic Number 10)'),
  halfWinger('Half Winger (Wide Attacking Midfielder)'),

  winger('Winger'),
  invertedWinger('Inverted Winger'),
  widePlaymaker('Wide Playmaker'),
  defensiveWinger('Defensive Winger'),

  targetMan('Target Man'),
  poacher('Poacher'),
  secondaryStriker('Secondary Striker'),
  advancedForward('Advanced Forward'),
  falseNine('False Nine');

  const Role(this.label);

  final String label;

  static Role fromLabel(String value) {
    final normalized = value.trim().toLowerCase();
    return Role.values.firstWhere(
      (role) => role.label.toLowerCase() == normalized,
      orElse: () => throw ArgumentError('Unknown role: $value'),
    );
  }

  @override
  String toString() => label;
}
