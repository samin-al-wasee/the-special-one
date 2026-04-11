T _enumFromLabel<T extends Enum>(
  List<T> values,
  String Function(T value) labelOf,
  String value,
  String enumName,
) {
  final normalized = value.trim();
  return values.firstWhere(
    (item) => labelOf(item) == normalized,
    orElse: () => throw ArgumentError('Unknown $enumName: $value'),
  );
}

// -------------------------
// Team Tactics: Attacking Tactics
// -------------------------
enum BuildUpStyle {
  buildFromBack('Build From Back'),
  mixedBuildUp('Mixed Build-Up'),
  directProgression('Direct Progression'),
  longBall('Long Ball'),
  counterBuildUp('Counter Build-Up');

  const BuildUpStyle(this.label);

  final String label;

  static BuildUpStyle fromLabel(String value) => _enumFromLabel(
    BuildUpStyle.values,
    (item) => item.label,
    value,
    'BuildUpStyle',
  );

  @override
  String toString() => label;
}

enum Tempo {
  veryLow('Very Low'),
  low('Low'),
  balanced('Balanced'),
  high('High'),
  veryHigh('Very High');

  const Tempo(this.label);

  final String label;

  static Tempo fromLabel(String value) =>
      _enumFromLabel(Tempo.values, (item) => item.label, value, 'Tempo');

  @override
  String toString() => label;
}

enum Width {
  veryNarrow('Very Narrow'),
  narrow('Narrow'),
  balanced('Balanced'),
  wide('Wide'),
  veryWide('Very Wide');

  const Width(this.label);

  final String label;

  static Width fromLabel(String value) =>
      _enumFromLabel(Width.values, (item) => item.label, value, 'Width');

  @override
  String toString() => label;
}

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

  static FinalThirdFocus fromLabel(String value) => _enumFromLabel(
    FinalThirdFocus.values,
    (item) => item.label,
    value,
    'FinalThirdFocus',
  );

  @override
  String toString() => label;
}

enum AttackingFocus {
  attackLeft('Attack Left'),
  attackRight('Attack Right'),
  attackCentre('Attack Centre'),
  mixed('Mixed'),
  switchFlanksOften('Switch Flanks Often'),
  targetHalfSpaces('Target Half-Spaces');

  const AttackingFocus(this.label);

  final String label;

  static AttackingFocus fromLabel(String value) => _enumFromLabel(
    AttackingFocus.values,
    (item) => item.label,
    value,
    'AttackingFocus',
  );

  @override
  String toString() => label;
}

// -------------------------
// Team Tactics: Defensive Tactics
// -------------------------
enum DefensiveLine {
  veryDeep('Very Deep'),
  deep('Deep'),
  standard('Standard'),
  high('High'),
  veryHigh('Very High');

  const DefensiveLine(this.label);

  final String label;

  static DefensiveLine fromLabel(String value) => _enumFromLabel(
    DefensiveLine.values,
    (item) => item.label,
    value,
    'DefensiveLine',
  );

  @override
  String toString() => label;
}

enum LineOfEngagement {
  lowBlock('Low Block'),
  midBlock('Mid Block'),
  highBlock('High Block'),
  fullPress('Full Press');

  const LineOfEngagement(this.label);

  final String label;

  static LineOfEngagement fromLabel(String value) => _enumFromLabel(
    LineOfEngagement.values,
    (item) => item.label,
    value,
    'LineOfEngagement',
  );

  @override
  String toString() => label;
}

enum PressingIntensity {
  veryLow('Very Low'),
  low('Low'),
  balanced('Balanced'),
  high('High'),
  extreme('Extreme');

  const PressingIntensity(this.label);

  final String label;

  static PressingIntensity fromLabel(String value) => _enumFromLabel(
    PressingIntensity.values,
    (item) => item.label,
    value,
    'PressingIntensity',
  );

  @override
  String toString() => label;
}

enum DefensiveWidth {
  veryNarrow('Very Narrow'),
  narrow('Narrow'),
  balanced('Balanced'),
  wide('Wide'),
  veryWide('Very Wide');

  const DefensiveWidth(this.label);

  final String label;

  static DefensiveWidth fromLabel(String value) => _enumFromLabel(
    DefensiveWidth.values,
    (item) => item.label,
    value,
    'DefensiveWidth',
  );

  @override
  String toString() => label;
}

enum MarkingStyle {
  zonal('Zonal'),
  mixed('Mixed'),
  tightManOriented('Tight Man-Oriented');

  const MarkingStyle(this.label);

  final String label;

  static MarkingStyle fromLabel(String value) => _enumFromLabel(
    MarkingStyle.values,
    (item) => item.label,
    value,
    'MarkingStyle',
  );

  @override
  String toString() => label;
}

enum TacklingAggression {
  stayOnFeet('Stay On Feet'),
  balanced('Balanced'),
  aggressive('Aggressive'),
  veryAggressive('Very Aggressive');

  const TacklingAggression(this.label);

  final String label;

  static TacklingAggression fromLabel(String value) => _enumFromLabel(
    TacklingAggression.values,
    (item) => item.label,
    value,
    'TacklingAggression',
  );

  @override
  String toString() => label;
}

// -------------------------
// Team Tactics: Transition Tactics
// -------------------------
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

  static TransitionOnWin fromLabel(String value) => _enumFromLabel(
    TransitionOnWin.values,
    (item) => item.label,
    value,
    'TransitionOnWin',
  );

  @override
  String toString() => label;
}

enum TransitionOnLoss {
  counterpress('Counterpress'),
  delay('Delay'),
  regroup('Regroup'),
  tacticalFoul('Tactical Foul'),
  dropDeepImmediately('Drop Deep Immediately');

  const TransitionOnLoss(this.label);

  final String label;

  static TransitionOnLoss fromLabel(String value) => _enumFromLabel(
    TransitionOnLoss.values,
    (item) => item.label,
    value,
    'TransitionOnLoss',
  );

  @override
  String toString() => label;
}

// -------------------------
// Team Tactics: Mentality / Match Approach
// -------------------------
enum TeamMentality {
  veryDefensive('Very Defensive'),
  defensive('Defensive'),
  cautious('Cautious'),
  balanced('Balanced'),
  positive('Positive'),
  attacking('Attacking'),
  veryAttacking('Very Attacking');

  const TeamMentality(this.label);

  final String label;

  static TeamMentality fromLabel(String value) => _enumFromLabel(
    TeamMentality.values,
    (item) => item.label,
    value,
    'TeamMentality',
  );

  @override
  String toString() => label;
}

// -------------------------
// Team Tactics: Risk Management
// -------------------------
enum PassingRisk {
  verySafe('Very Safe'),
  safe('Safe'),
  balanced('Balanced'),
  risky('Risky'),
  veryRisky('Very Risky');

  const PassingRisk(this.label);

  final String label;

  static PassingRisk fromLabel(String value) => _enumFromLabel(
    PassingRisk.values,
    (item) => item.label,
    value,
    'PassingRisk',
  );

  @override
  String toString() => label;
}

enum DribblingRisk {
  veryConservative('Very Conservative'),
  balanced('Balanced'),
  aggressive('Aggressive');

  const DribblingRisk(this.label);

  final String label;

  static DribblingRisk fromLabel(String value) => _enumFromLabel(
    DribblingRisk.values,
    (item) => item.label,
    value,
    'DribblingRisk',
  );

  @override
  String toString() => label;
}

enum ShootingPolicy {
  shootLess('Shoot Less'),
  balanced('Balanced'),
  shootMore('Shoot More'),
  shootAggressively('Shoot Aggressively');

  const ShootingPolicy(this.label);

  final String label;

  static ShootingPolicy fromLabel(String value) => _enumFromLabel(
    ShootingPolicy.values,
    (item) => item.label,
    value,
    'ShootingPolicy',
  );

  @override
  String toString() => label;
}

// -------------------------
// Team Tactics: Space Control
// -------------------------
enum Compactness {
  veryCompact('Very Compact'),
  compact('Compact'),
  balanced('Balanced'),
  loose('Loose'),
  veryLoose('Very Loose');

  const Compactness(this.label);

  final String label;

  static Compactness fromLabel(String value) => _enumFromLabel(
    Compactness.values,
    (item) => item.label,
    value,
    'Compactness',
  );

  @override
  String toString() => label;
}

enum VerticalStretch {
  compressed('Compressed'),
  balanced('Balanced'),
  stretched('Stretched');

  const VerticalStretch(this.label);

  final String label;

  static VerticalStretch fromLabel(String value) => _enumFromLabel(
    VerticalStretch.values,
    (item) => item.label,
    value,
    'VerticalStretch',
  );

  @override
  String toString() => label;
}

enum OverloadFocus {
  leftOverload('Left overload'),
  rightOverload('Right overload'),
  centralOverload('Central overload'),
  noSpecificOverload('No specific overload');

  const OverloadFocus(this.label);

  final String label;

  static OverloadFocus fromLabel(String value) => _enumFromLabel(
    OverloadFocus.values,
    (item) => item.label,
    value,
    'OverloadFocus',
  );

  @override
  String toString() => label;
}

// -------------------------
// Set Piece Control System
// -------------------------
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

  static SetPieceAttack fromLabel(String value) => _enumFromLabel(
    SetPieceAttack.values,
    (item) => item.label,
    value,
    'SetPieceAttack',
  );

  @override
  String toString() => label;
}

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

  static SetPieceDefense fromLabel(String value) => _enumFromLabel(
    SetPieceDefense.values,
    (item) => item.label,
    value,
    'SetPieceDefense',
  );

  @override
  String toString() => label;
}

enum FreeKickStrategy {
  shootDirect('Shoot direct'),
  crossIntoBox('Cross into box'),
  shortRoutine('Short routine'),
  fastRestart('Fast restart');

  const FreeKickStrategy(this.label);

  final String label;

  static FreeKickStrategy fromLabel(String value) => _enumFromLabel(
    FreeKickStrategy.values,
    (item) => item.label,
    value,
    'FreeKickStrategy',
  );

  @override
  String toString() => label;
}
