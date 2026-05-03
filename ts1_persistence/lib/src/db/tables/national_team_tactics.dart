import 'package:drift/drift.dart';

@DataClassName('NationalTeamTacticRecord')
class NationalTeamTactics extends Table {
  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Foreign key to national team
  IntColumn get teamId => integer().unique().nullable()();

  TextColumn get presetName => text()
      .withLength(min: 1, max: 50)
      .customConstraint(
        "NOT NULL CHECK (preset_name IN ('Possession Control', 'Vertical Attack', 'Counter-Attack', 'Wing Play', 'High Press', 'Low Block', 'Direct Football', 'Balanced', 'Set-Piece Focus', 'Tiki-Taka', 'Gegenpress', 'Catenaccio', 'Route One', 'Total Football', 'Joga Bonito', 'Compact Transition', 'Positional Press'))",
      )();

  // =========================
  // Attacking Tactics
  // =========================

  TextColumn get buildUpStyle => text()
      .withLength(min: 1, max: 50)
      .customConstraint(
        "NOT NULL CHECK (build_up_style IN ('buildFromBack', 'mixedBuildUp', 'directProgression', 'longBall', 'counterBuildUp'))",
      )();

  TextColumn get tempo => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (tempo IN ('veryLow', 'low', 'balanced', 'high', 'veryHigh'))",
      )();

  TextColumn get width => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (width IN ('veryNarrow', 'narrow', 'balanced', 'wide', 'veryWide'))",
      )();

  TextColumn get finalThirdFocus => text()
      .withLength(min: 1, max: 50)
      .customConstraint(
        "NOT NULL CHECK (final_third_focus IN ('workBallIntoBox', 'mixedAttacking', 'shootOnSight', 'crossEarly', 'overlapWide', 'underlapInside', 'throughBallFocus', 'dribbleMore', 'holdPossession'))",
      )();

  TextColumn get attackingFocus => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (attacking_focus IN ('attackLeft', 'attackRight', 'attackCentre', 'mixed', 'switchFlanksOften', 'targetHalfSpaces'))",
      )();

  // =========================
  // Defensive Tactics
  // =========================

  TextColumn get defensiveLine => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (defensive_line IN ('veryDeep', 'deep', 'standard', 'high', 'veryHigh'))",
      )();

  TextColumn get lineOfEngagement => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (line_of_engagement IN ('lowBlock', 'midBlock', 'highBlock', 'fullPress'))",
      )();

  TextColumn get pressingIntensity => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (pressing_intensity IN ('veryLow', 'low', 'balanced', 'high', 'extreme'))",
      )();

  TextColumn get defensiveWidth => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (defensive_width IN ('veryNarrow', 'narrow', 'balanced', 'wide', 'veryWide'))",
      )();

  TextColumn get markingStyle => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (marking_style IN ('zonal', 'mixed', 'tightManOriented'))",
      )();

  TextColumn get tacklingAggression => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (tackling_aggression IN ('stayOnFeet', 'balanced', 'aggressive', 'veryAggressive'))",
      )();

  // =========================
  // Transition Tactics
  // =========================

  TextColumn get transitionOnWin => text()
      .withLength(min: 1, max: 40)
      .customConstraint(
        "NOT NULL CHECK (transition_on_win IN ('counterImmediately', 'progressSafely', 'holdShape', 'feedPlaymaker', 'feedWinger', 'goLongToStriker', 'attackWeakSide'))",
      )();

  TextColumn get transitionOnLoss => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (transition_on_loss IN ('counterpress', 'delay', 'regroup', 'tacticalFoul', 'dropDeepImmediately'))",
      )();

  // =========================
  // Mentality
  // =========================

  TextColumn get teamMentality => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (team_mentality IN ('veryDefensive', 'defensive', 'cautious', 'balanced', 'positive', 'attacking', 'veryAttacking'))",
      )();

  // =========================
  // Risk Management
  // =========================

  TextColumn get passingRisk => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (passing_risk IN ('verySafe', 'safe', 'balanced', 'risky', 'veryRisky'))",
      )();

  TextColumn get dribblingRisk => text()
      .withLength(min: 1, max: 25)
      .customConstraint(
        "NOT NULL CHECK (dribbling_risk IN ('veryConservative', 'balanced', 'aggressive'))",
      )();

  TextColumn get shootingPolicy => text()
      .withLength(min: 1, max: 25)
      .customConstraint(
        "NOT NULL CHECK (shooting_policy IN ('shootLess', 'balanced', 'shootMore', 'shootAggressively'))",
      )();

  // =========================
  // Space Control
  // =========================

  TextColumn get compactness => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (compactness IN ('veryCompact', 'compact', 'balanced', 'loose', 'veryLoose'))",
      )();

  TextColumn get verticalStretch => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (vertical_stretch IN ('compressed', 'balanced', 'stretched'))",
      )();

  TextColumn get overloadFocus => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (overload_focus IN ('leftOverload', 'rightOverload', 'centralOverload', 'noSpecificOverload'))",
      )();

  // =========================
  // Set Piece Control
  // =========================

  TextColumn get setPieceAttack => text()
      .withLength(min: 1, max: 40)
      .customConstraint(
        "NOT NULL CHECK (set_piece_attack IN ('nearPostCorners', 'farPostCorners', 'mixedCorners', 'shortCorners', 'crowdGoalkeeper', 'edgeOfBoxSetup', 'tallPlayerTargeting', 'reboundHunting'))",
      )();

  TextColumn get setPieceDefense => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (set_piece_defense IN ('zonalMarking', 'mixedMarking', 'manMarking', 'leavePlayersUp', 'fullRetreat', 'counterSetup', 'nearPostGuard'))",
      )();

  TextColumn get freeKickStrategy => text()
      .withLength(min: 1, max: 25)
      .customConstraint(
        "NOT NULL CHECK (free_kick_strategy IN ('shootDirect', 'crossIntoBox', 'shortRoutine', 'fastRestart'))",
      )();
}
