import 'package:drift/drift.dart';

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
        "NOT NULL CHECK (build_up_style IN ('Build From Back', 'Mixed Build-Up', 'Direct Progression', 'Long Ball', 'Counter Build-Up'))",
      )();

  TextColumn get tempo => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (tempo IN ('Very Low', 'Low', 'Balanced', 'High', 'Very High'))",
      )();

  TextColumn get width => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (width IN ('Very Narrow', 'Narrow', 'Balanced', 'Wide', 'Very Wide'))",
      )();

  TextColumn get finalThirdFocus => text()
      .withLength(min: 1, max: 50)
      .customConstraint(
        "NOT NULL CHECK (final_third_focus IN ('Work Ball Into Box', 'Mixed Attacking', 'Shoot On Sight', 'Cross Early', 'Overlap Wide', 'Underlap Inside', 'Through Ball Focus', 'Dribble More', 'Hold Possession'))",
      )();

  TextColumn get attackingFocus => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (attacking_focus IN ('Attack Left', 'Attack Right', 'Attack Centre', 'Mixed', 'Switch Flanks Often', 'Target Half-Spaces'))",
      )();

  // =========================
  // Defensive Tactics
  // =========================

  TextColumn get defensiveLine => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (defensive_line IN ('Very Deep', 'Deep', 'Standard', 'High', 'Very High'))",
      )();

  TextColumn get lineOfEngagement => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (line_of_engagement IN ('Low Block', 'Mid Block', 'High Block', 'Full Press'))",
      )();

  TextColumn get pressingIntensity => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (pressing_intensity IN ('Very Low', 'Low', 'Balanced', 'High', 'Extreme'))",
      )();

  TextColumn get defensiveWidth => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (defensive_width IN ('Very Narrow', 'Narrow', 'Balanced', 'Wide', 'Very Wide'))",
      )();

  TextColumn get markingStyle => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (marking_style IN ('Zonal', 'Mixed', 'Tight Man-Oriented'))",
      )();

  TextColumn get tacklingAggression => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (tackling_aggression IN ('Stay On Feet', 'Balanced', 'Aggressive', 'Very Aggressive'))",
      )();

  // =========================
  // Transition Tactics
  // =========================

  TextColumn get transitionOnWin => text()
      .withLength(min: 1, max: 40)
      .customConstraint(
        "NOT NULL CHECK (transition_on_win IN ('Counter Immediately', 'Progress Safely', 'Hold Shape', 'Feed Playmaker', 'Feed Winger', 'Go Long To Striker', 'Attack Weak Side'))",
      )();

  TextColumn get transitionOnLoss => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (transition_on_loss IN ('Counterpress', 'Delay', 'Regroup', 'Tactical Foul', 'Drop Deep Immediately'))",
      )();

  // =========================
  // Mentality
  // =========================

  TextColumn get teamMentality => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (team_mentality IN ('Very Defensive', 'Defensive', 'Cautious', 'Balanced', 'Positive', 'Attacking', 'Very Attacking'))",
      )();

  // =========================
  // Risk Management
  // =========================

  TextColumn get passingRisk => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (passing_risk IN ('Very Safe', 'Safe', 'Balanced', 'Risky', 'Very Risky'))",
      )();

  TextColumn get dribblingRisk => text()
      .withLength(min: 1, max: 25)
      .customConstraint(
        "NOT NULL CHECK (dribbling_risk IN ('Very Conservative', 'Balanced', 'Aggressive'))",
      )();

  TextColumn get shootingPolicy => text()
      .withLength(min: 1, max: 25)
      .customConstraint(
        "NOT NULL CHECK (shooting_policy IN ('Shoot Less', 'Balanced', 'Shoot More', 'Shoot Aggressively'))",
      )();

  // =========================
  // Space Control
  // =========================

  TextColumn get compactness => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (compactness IN ('Very Compact', 'Compact', 'Balanced', 'Loose', 'Very Loose'))",
      )();

  TextColumn get verticalStretch => text()
      .withLength(min: 1, max: 20)
      .customConstraint(
        "NOT NULL CHECK (vertical_stretch IN ('Compressed', 'Balanced', 'Stretched'))",
      )();

  TextColumn get overloadFocus => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (overload_focus IN ('Left overload', 'Right overload', 'Central overload', 'No specific overload'))",
      )();

  // =========================
  // Set Piece Control
  // =========================

  TextColumn get setPieceAttack => text()
      .withLength(min: 1, max: 40)
      .customConstraint(
        "NOT NULL CHECK (set_piece_attack IN ('Near-post corners', 'Far-post corners', 'Mixed corners', 'Short corners', 'Crowd goalkeeper', 'Edge-of-box setup', 'Tall-player targeting', 'Rebound hunting'))",
      )();

  TextColumn get setPieceDefense => text()
      .withLength(min: 1, max: 30)
      .customConstraint(
        "NOT NULL CHECK (set_piece_defense IN ('Zonal marking', 'Mixed marking', 'Man marking', 'Leave players up', 'Full retreat', 'Counter setup', 'Near-post guard'))",
      )();

  TextColumn get freeKickStrategy => text()
      .withLength(min: 1, max: 25)
      .customConstraint(
        "NOT NULL CHECK (free_kick_strategy IN ('Shoot direct', 'Cross into box', 'Short routine', 'Fast restart'))",
      )();
}
