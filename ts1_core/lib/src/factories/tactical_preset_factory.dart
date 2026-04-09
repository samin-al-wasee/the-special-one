import 'package:ts1_core/src/enums/team/tactic/tactical_attributes.dart';
import 'package:ts1_core/src/models/team/tactic/team_tactic.dart';

enum TacticalPreset {
  possessionControl('Possession Control'),
  verticalAttack('Vertical Attack'),
  counterAttack('Counter-Attack'),
  wingPlay('Wing Play'),
  highPress('High Press'),
  lowBlock('Low Block'),
  directFootball('Direct Football'),
  balanced('Balanced'),
  setPieceFocus('Set-Piece Focus'),
  tikiTaka('Tiki-Taka'),
  gegenpress('Gegenpress'),
  catenaccio('Catenaccio'),
  routeOne('Route One'),
  totalFootball('Total Football'),
  jogaBonito('Joga Bonito'),
  compactTransitions('Compact Transitions'),
  positionalPress('Positional Press');

  const TacticalPreset(this.label);

  final String label;
}

String _normalizePreset(String value) {
  return value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
}

TeamTactic _baseTactic(int id) {
  return TeamTactic(
    id: id,
    buildUpStyle: BuildUpStyle.mixedBuildUp,
    tempo: Tempo.balanced,
    width: Width.balanced,
    finalThirdFocus: FinalThirdFocus.mixedAttacking,
    attackingFocus: AttackingFocus.mixed,
    defensiveLine: DefensiveLine.standard,
    lineOfEngagement: LineOfEngagement.midBlock,
    pressingIntensity: PressingIntensity.balanced,
    defensiveWidth: DefensiveWidth.balanced,
    markingStyle: MarkingStyle.mixed,
    tacklingAggression: TacklingAggression.balanced,
    transitionOnWin: TransitionOnWin.progressSafely,
    transitionOnLoss: TransitionOnLoss.regroup,
    teamMentality: TeamMentality.balanced,
    passingRisk: PassingRisk.balanced,
    dribblingRisk: DribblingRisk.balanced,
    shootingPolicy: ShootingPolicy.balanced,
    compactness: Compactness.balanced,
    verticalStretch: VerticalStretch.balanced,
    overloadFocus: OverloadFocus.noSpecificOverload,
    setPieceAttack: SetPieceAttack.mixedCorners,
    setPieceDefense: SetPieceDefense.mixedMarking,
    freeKickStrategy: FreeKickStrategy.crossIntoBox,
  );
}

class TacticalPresetFactory {
  static const List<TacticalPreset> _genericPresets = [
    TacticalPreset.possessionControl,
    TacticalPreset.verticalAttack,
    TacticalPreset.counterAttack,
    TacticalPreset.wingPlay,
    TacticalPreset.highPress,
    TacticalPreset.lowBlock,
    TacticalPreset.directFootball,
    TacticalPreset.balanced,
    TacticalPreset.setPieceFocus,
    TacticalPreset.compactTransitions,
    TacticalPreset.positionalPress,
  ];

  static const List<TacticalPreset> _popularPresets = [
    TacticalPreset.tikiTaka,
    TacticalPreset.gegenpress,
    TacticalPreset.catenaccio,
    TacticalPreset.routeOne,
    TacticalPreset.totalFootball,
    TacticalPreset.jogaBonito,
  ];

  static final Map<TacticalPreset, TeamTactic Function(int id)>
  _presetBuilders = {
    TacticalPreset.balanced: (id) => _baseTactic(id),
    TacticalPreset.possessionControl: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.buildFromBack,
      tempo: Tempo.low,
      finalThirdFocus: FinalThirdFocus.holdPossession,
      teamMentality: TeamMentality.cautious,
      passingRisk: PassingRisk.safe,
      dribblingRisk: DribblingRisk.veryConservative,
      compactness: Compactness.compact,
    ),
    TacticalPreset.verticalAttack: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.directProgression,
      tempo: Tempo.high,
      finalThirdFocus: FinalThirdFocus.throughBallFocus,
      transitionOnWin: TransitionOnWin.counterImmediately,
      teamMentality: TeamMentality.positive,
      passingRisk: PassingRisk.risky,
    ),
    TacticalPreset.counterAttack: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.counterBuildUp,
      tempo: Tempo.veryHigh,
      defensiveLine: DefensiveLine.deep,
      lineOfEngagement: LineOfEngagement.midBlock,
      transitionOnWin: TransitionOnWin.counterImmediately,
      transitionOnLoss: TransitionOnLoss.regroup,
      teamMentality: TeamMentality.cautious,
      passingRisk: PassingRisk.risky,
      verticalStretch: VerticalStretch.stretched,
    ),
    TacticalPreset.wingPlay: (id) => _baseTactic(id).copyWith(
      width: Width.veryWide,
      finalThirdFocus: FinalThirdFocus.overlapWide,
      attackingFocus: AttackingFocus.switchFlanksOften,
      transitionOnWin: TransitionOnWin.feedWinger,
      overloadFocus: OverloadFocus.leftOverload,
      setPieceAttack: SetPieceAttack.farPostCorners,
    ),
    TacticalPreset.highPress: (id) => _baseTactic(id).copyWith(
      defensiveLine: DefensiveLine.high,
      lineOfEngagement: LineOfEngagement.fullPress,
      pressingIntensity: PressingIntensity.extreme,
      transitionOnLoss: TransitionOnLoss.counterpress,
      teamMentality: TeamMentality.positive,
      compactness: Compactness.compact,
      tacklingAggression: TacklingAggression.aggressive,
    ),
    TacticalPreset.lowBlock: (id) => _baseTactic(id).copyWith(
      defensiveLine: DefensiveLine.veryDeep,
      lineOfEngagement: LineOfEngagement.lowBlock,
      pressingIntensity: PressingIntensity.veryLow,
      transitionOnLoss: TransitionOnLoss.dropDeepImmediately,
      teamMentality: TeamMentality.defensive,
      compactness: Compactness.veryCompact,
      defensiveWidth: DefensiveWidth.narrow,
    ),
    TacticalPreset.directFootball: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.longBall,
      tempo: Tempo.high,
      finalThirdFocus: FinalThirdFocus.crossEarly,
      transitionOnWin: TransitionOnWin.goLongToStriker,
      teamMentality: TeamMentality.positive,
      passingRisk: PassingRisk.veryRisky,
      shootingPolicy: ShootingPolicy.shootMore,
    ),
    TacticalPreset.setPieceFocus: (id) => _baseTactic(id).copyWith(
      tempo: Tempo.low,
      finalThirdFocus: FinalThirdFocus.crossEarly,
      teamMentality: TeamMentality.cautious,
      setPieceAttack: SetPieceAttack.tallPlayerTargeting,
      setPieceDefense: SetPieceDefense.nearPostGuard,
      freeKickStrategy: FreeKickStrategy.crossIntoBox,
    ),
    TacticalPreset.tikiTaka: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.buildFromBack,
      tempo: Tempo.balanced,
      width: Width.wide,
      finalThirdFocus: FinalThirdFocus.workBallIntoBox,
      attackingFocus: AttackingFocus.targetHalfSpaces,
      defensiveLine: DefensiveLine.high,
      lineOfEngagement: LineOfEngagement.highBlock,
      pressingIntensity: PressingIntensity.high,
      transitionOnLoss: TransitionOnLoss.counterpress,
      teamMentality: TeamMentality.positive,
      passingRisk: PassingRisk.safe,
      shootingPolicy: ShootingPolicy.shootLess,
      compactness: Compactness.compact,
    ),
    TacticalPreset.gegenpress: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.directProgression,
      tempo: Tempo.veryHigh,
      finalThirdFocus: FinalThirdFocus.throughBallFocus,
      defensiveLine: DefensiveLine.veryHigh,
      lineOfEngagement: LineOfEngagement.fullPress,
      pressingIntensity: PressingIntensity.extreme,
      transitionOnWin: TransitionOnWin.counterImmediately,
      transitionOnLoss: TransitionOnLoss.counterpress,
      teamMentality: TeamMentality.attacking,
      passingRisk: PassingRisk.risky,
      tacklingAggression: TacklingAggression.veryAggressive,
      verticalStretch: VerticalStretch.stretched,
    ),
    TacticalPreset.catenaccio: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.counterBuildUp,
      tempo: Tempo.low,
      defensiveLine: DefensiveLine.veryDeep,
      lineOfEngagement: LineOfEngagement.lowBlock,
      pressingIntensity: PressingIntensity.low,
      transitionOnWin: TransitionOnWin.goLongToStriker,
      transitionOnLoss: TransitionOnLoss.regroup,
      teamMentality: TeamMentality.defensive,
      passingRisk: PassingRisk.safe,
      compactness: Compactness.veryCompact,
      markingStyle: MarkingStyle.tightManOriented,
      setPieceDefense: SetPieceDefense.manMarking,
    ),
    TacticalPreset.routeOne: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.longBall,
      tempo: Tempo.veryHigh,
      width: Width.wide,
      finalThirdFocus: FinalThirdFocus.crossEarly,
      transitionOnWin: TransitionOnWin.goLongToStriker,
      teamMentality: TeamMentality.attacking,
      passingRisk: PassingRisk.veryRisky,
      shootingPolicy: ShootingPolicy.shootAggressively,
      verticalStretch: VerticalStretch.stretched,
      setPieceAttack: SetPieceAttack.nearPostCorners,
    ),
    TacticalPreset.totalFootball: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.mixedBuildUp,
      tempo: Tempo.high,
      width: Width.wide,
      finalThirdFocus: FinalThirdFocus.mixedAttacking,
      attackingFocus: AttackingFocus.switchFlanksOften,
      defensiveLine: DefensiveLine.high,
      lineOfEngagement: LineOfEngagement.highBlock,
      pressingIntensity: PressingIntensity.high,
      transitionOnWin: TransitionOnWin.attackWeakSide,
      transitionOnLoss: TransitionOnLoss.counterpress,
      teamMentality: TeamMentality.positive,
      passingRisk: PassingRisk.balanced,
      dribblingRisk: DribblingRisk.aggressive,
      overloadFocus: OverloadFocus.noSpecificOverload,
    ),
    TacticalPreset.jogaBonito: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.mixedBuildUp,
      tempo: Tempo.high,
      width: Width.wide,
      finalThirdFocus: FinalThirdFocus.dribbleMore,
      attackingFocus: AttackingFocus.targetHalfSpaces,
      lineOfEngagement: LineOfEngagement.highBlock,
      pressingIntensity: PressingIntensity.balanced,
      transitionOnWin: TransitionOnWin.feedWinger,
      transitionOnLoss: TransitionOnLoss.delay,
      teamMentality: TeamMentality.positive,
      passingRisk: PassingRisk.balanced,
      dribblingRisk: DribblingRisk.aggressive,
      shootingPolicy: ShootingPolicy.shootMore,
      overloadFocus: OverloadFocus.leftOverload,
      setPieceAttack: SetPieceAttack.shortCorners,
    ),
    TacticalPreset.compactTransitions: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.counterBuildUp,
      tempo: Tempo.balanced,
      width: Width.narrow,
      finalThirdFocus: FinalThirdFocus.throughBallFocus,
      attackingFocus: AttackingFocus.attackCentre,
      defensiveLine: DefensiveLine.standard,
      lineOfEngagement: LineOfEngagement.midBlock,
      pressingIntensity: PressingIntensity.high,
      defensiveWidth: DefensiveWidth.narrow,
      transitionOnWin: TransitionOnWin.attackWeakSide,
      transitionOnLoss: TransitionOnLoss.counterpress,
      teamMentality: TeamMentality.cautious,
      passingRisk: PassingRisk.safe,
      compactness: Compactness.compact,
      verticalStretch: VerticalStretch.compressed,
    ),
    TacticalPreset.positionalPress: (id) => _baseTactic(id).copyWith(
      buildUpStyle: BuildUpStyle.buildFromBack,
      tempo: Tempo.high,
      width: Width.balanced,
      finalThirdFocus: FinalThirdFocus.underlapInside,
      attackingFocus: AttackingFocus.switchFlanksOften,
      defensiveLine: DefensiveLine.veryHigh,
      lineOfEngagement: LineOfEngagement.highBlock,
      pressingIntensity: PressingIntensity.high,
      defensiveWidth: DefensiveWidth.balanced,
      transitionOnWin: TransitionOnWin.progressSafely,
      transitionOnLoss: TransitionOnLoss.counterpress,
      teamMentality: TeamMentality.attacking,
      passingRisk: PassingRisk.risky,
      dribblingRisk: DribblingRisk.balanced,
      compactness: Compactness.compact,
      verticalStretch: VerticalStretch.stretched,
      overloadFocus: OverloadFocus.centralOverload,
      setPieceDefense: SetPieceDefense.counterSetup,
    ),
  };

  static final Map<String, TacticalPreset> _normalizedMap = {
    for (final preset in TacticalPreset.values)
      _normalizePreset(preset.label): preset,
    for (final preset in TacticalPreset.values)
      _normalizePreset(preset.name): preset,
  };

  static List<TacticalPreset> genericPresets() =>
      List.unmodifiable(_genericPresets);

  static List<TacticalPreset> popularPresets() =>
      List.unmodifiable(_popularPresets);

  static List<TacticalPreset> allPresets() => [
    ..._genericPresets,
    ..._popularPresets,
  ];

  static TeamTactic create(TacticalPreset preset, {int id = 0}) {
    final builder = _presetBuilders[preset];
    if (builder == null) {
      throw ArgumentError(
        'No tactical preset builder found for ${preset.label}',
      );
    }

    return builder(id);
  }

  static TeamTactic createFromString(String preset, {int id = 0}) {
    return create(_resolvePreset(preset), id: id);
  }

  static TacticalPreset _resolvePreset(String preset) {
    final normalized = _normalizePreset(preset);
    final resolved = _normalizedMap[normalized];
    if (resolved != null) {
      return resolved;
    }

    final available = allPresets().map((item) => item.label).join(', ');
    throw ArgumentError(
      "Unknown tactical preset '$preset'. Available presets: $available",
    );
  }
}
