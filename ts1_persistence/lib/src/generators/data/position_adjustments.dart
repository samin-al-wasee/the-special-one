// generators/data/position_adjustments.dart
import 'package:ts1_core/ts1_core.dart';

class PositionAdjustment {
  final String attributeType; // 'technical', 'mental', 'physical'
  final dynamic attribute;
  final int bonus;

  const PositionAdjustment(this.attributeType, this.attribute, this.bonus);
}

class PositionAdjustments {
  static Map<Position, List<PositionAdjustment>> getAdjustments() {
    return {
      Position.goalKeeper: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.gkHandling, 3),
        PositionAdjustment('technical', TechnicalAttr.gkReflexes, 3),
        PositionAdjustment('mental', MentalAttr.positioning, 3),
        PositionAdjustment('technical', TechnicalAttr.gkKicking, 2),
        PositionAdjustment('physical', PhysicalAttr.jumping, 2),
        PositionAdjustment('mental', MentalAttr.composure, 2),
        PositionAdjustment('technical', TechnicalAttr.gkCommandOfArea, 2),
        PositionAdjustment('technical', TechnicalAttr.gkAerialReach, 2),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.finishing, -3),
        PositionAdjustment('technical', TechnicalAttr.dribbling, -3),
        PositionAdjustment('technical', TechnicalAttr.crossing, -2),
        PositionAdjustment('technical', TechnicalAttr.shortPassing, -2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, -1),
      ],

      Position.centerBack: [
        // Strong attributes
        PositionAdjustment('physical', PhysicalAttr.strength, 3),
        PositionAdjustment('mental', MentalAttr.positioning, 3),
        PositionAdjustment('physical', PhysicalAttr.jumping, 2),
        PositionAdjustment('technical', TechnicalAttr.tackling, 3),
        PositionAdjustment('technical', TechnicalAttr.marking, 3),
        PositionAdjustment('technical', TechnicalAttr.intercepting, 2),
        PositionAdjustment('mental', MentalAttr.concentration, 2),
        PositionAdjustment('mental', MentalAttr.bravery, 2),
        PositionAdjustment('physical', PhysicalAttr.stamina, 1),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.shortPassing, -1),
        PositionAdjustment('technical', TechnicalAttr.dribbling, -2),
        PositionAdjustment('technical', TechnicalAttr.finishing, -1),
        PositionAdjustment('technical', TechnicalAttr.flair, -2),
        PositionAdjustment('physical', PhysicalAttr.agility, -1),
      ],

      Position.rightBack: [
        // Strong attributes
        PositionAdjustment('physical', PhysicalAttr.stamina, 3),
        PositionAdjustment('technical', TechnicalAttr.tackling, 2),
        PositionAdjustment('technical', TechnicalAttr.crossing, 2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 2),
        PositionAdjustment('mental', MentalAttr.workRate, 2),
        PositionAdjustment('physical', PhysicalAttr.pace, 1),
        PositionAdjustment('mental', MentalAttr.positioning, 1),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.finishing, -1),
        PositionAdjustment('technical', TechnicalAttr.heading, -1),
        PositionAdjustment('technical', TechnicalAttr.volleys, -1),
      ],

      Position.leftBack: [
        // Strong attributes
        PositionAdjustment('physical', PhysicalAttr.stamina, 3),
        PositionAdjustment('technical', TechnicalAttr.tackling, 2),
        PositionAdjustment('technical', TechnicalAttr.crossing, 2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 2),
        PositionAdjustment('mental', MentalAttr.workRate, 2),
        PositionAdjustment('physical', PhysicalAttr.pace, 1),
        PositionAdjustment('mental', MentalAttr.positioning, 1),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.finishing, -1),
        PositionAdjustment('technical', TechnicalAttr.heading, -1),
        PositionAdjustment('technical', TechnicalAttr.volleys, -1),
      ],

      Position.defensiveMidfielder: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.tackling, 3),
        PositionAdjustment('mental', MentalAttr.positioning, 3),
        PositionAdjustment(
          'technical',
          TechnicalAttr.shortPassing,
          2,
        ), // Fixed: passing -> shortPassing
        PositionAdjustment('physical', PhysicalAttr.stamina, 2),
        PositionAdjustment('mental', MentalAttr.workRate, 2),
        PositionAdjustment('technical', TechnicalAttr.marking, 2),
        PositionAdjustment('mental', MentalAttr.anticipation, 2),
        PositionAdjustment('mental', MentalAttr.discipline, 2),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.finishing, -2),
        PositionAdjustment('technical', TechnicalAttr.dribbling, -1),
        PositionAdjustment('technical', TechnicalAttr.flair, -2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, -1),
      ],

      Position.centralMidfielder: [
        // Strong attributes
        PositionAdjustment(
          'technical',
          TechnicalAttr.shortPassing,
          3,
        ), // Fixed: passing -> shortPassing
        PositionAdjustment('mental', MentalAttr.vision, 3),
        PositionAdjustment('technical', TechnicalAttr.ballControl, 2),
        PositionAdjustment('physical', PhysicalAttr.stamina, 2),
        PositionAdjustment('technical', TechnicalAttr.firstTouch, 2),
        PositionAdjustment('technical', TechnicalAttr.longPassing, 2),
        PositionAdjustment('mental', MentalAttr.decisions, 2),
        PositionAdjustment('mental', MentalAttr.pressResistance, 2),
        // Weak attributes
        PositionAdjustment('physical', PhysicalAttr.strength, -1),
        PositionAdjustment('technical', TechnicalAttr.crossing, -1),
      ],

      Position.attackingMidfielder: [
        // Strong attributes
        PositionAdjustment(
          'technical',
          TechnicalAttr.shortPassing,
          3,
        ), // Fixed: passing -> shortPassing
        PositionAdjustment('mental', MentalAttr.vision, 3),
        PositionAdjustment('technical', TechnicalAttr.ballControl, 2),
        PositionAdjustment('technical', TechnicalAttr.dribbling, 2),
        PositionAdjustment('mental', MentalAttr.creativity, 3),
        PositionAdjustment('technical', TechnicalAttr.longShots, 2),
        PositionAdjustment('technical', TechnicalAttr.technique, 2),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.tackling, -2),
        PositionAdjustment('mental', MentalAttr.positioning, -1),
        PositionAdjustment('physical', PhysicalAttr.strength, -1),
      ],

      Position.rightMidfielder: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.crossing, 3),
        PositionAdjustment('physical', PhysicalAttr.stamina, 3),
        PositionAdjustment('technical', TechnicalAttr.dribbling, 2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 2),
        PositionAdjustment(
          'technical',
          TechnicalAttr.shortPassing,
          2,
        ), // Fixed: passing -> shortPassing
        PositionAdjustment('technical', TechnicalAttr.crossing, 1),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.tackling, -1),
        PositionAdjustment('technical', TechnicalAttr.finishing, -1),
      ],

      Position.leftMidfielder: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.crossing, 3),
        PositionAdjustment('physical', PhysicalAttr.stamina, 3),
        PositionAdjustment('technical', TechnicalAttr.dribbling, 2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 2),
        PositionAdjustment(
          'technical',
          TechnicalAttr.shortPassing,
          2,
        ), // Fixed: passing -> shortPassing
        PositionAdjustment('technical', TechnicalAttr.crossing, 1),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.tackling, -1),
        PositionAdjustment('technical', TechnicalAttr.finishing, -1),
      ],

      Position.rightWinger: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.dribbling, 3),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 3),
        PositionAdjustment('technical', TechnicalAttr.crossing, 3),
        PositionAdjustment('technical', TechnicalAttr.technique, 2),
        PositionAdjustment('technical', TechnicalAttr.finishing, 1),
        PositionAdjustment('technical', TechnicalAttr.ballControl, 1),
        PositionAdjustment('physical', PhysicalAttr.agility, 2),
        // Weak attributes
        PositionAdjustment('physical', PhysicalAttr.strength, -2),
        PositionAdjustment('mental', MentalAttr.positioning, -1),
        PositionAdjustment('technical', TechnicalAttr.tackling, -2),
        PositionAdjustment('mental', MentalAttr.aggression, -1),
      ],

      Position.leftWinger: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.dribbling, 3),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 3),
        PositionAdjustment('technical', TechnicalAttr.crossing, 3),
        PositionAdjustment('technical', TechnicalAttr.technique, 2),
        PositionAdjustment('technical', TechnicalAttr.finishing, 1),
        PositionAdjustment('technical', TechnicalAttr.ballControl, 1),
        PositionAdjustment('physical', PhysicalAttr.agility, 2),
        // Weak attributes
        PositionAdjustment('physical', PhysicalAttr.strength, -2),
        PositionAdjustment('mental', MentalAttr.positioning, -1),
        PositionAdjustment('technical', TechnicalAttr.tackling, -2),
        PositionAdjustment('mental', MentalAttr.aggression, -1),
      ],

      Position.striker: [
        // Strong attributes
        PositionAdjustment('technical', TechnicalAttr.finishing, 3),
        PositionAdjustment('mental', MentalAttr.composure, 2),
        PositionAdjustment('physical', PhysicalAttr.acceleration, 2),
        PositionAdjustment('technical', TechnicalAttr.firstTouch, 2),
        PositionAdjustment('mental', MentalAttr.offBall, 2),
        PositionAdjustment('technical', TechnicalAttr.heading, 2),
        PositionAdjustment('technical', TechnicalAttr.volleys, 2),
        PositionAdjustment('technical', TechnicalAttr.longShots, 1),
        PositionAdjustment('technical', TechnicalAttr.shotPower, 2),
        // Weak attributes
        PositionAdjustment('technical', TechnicalAttr.tackling, -2),
        PositionAdjustment('technical', TechnicalAttr.marking, -2),
        PositionAdjustment('mental', MentalAttr.positioning, -1),
        PositionAdjustment('technical', TechnicalAttr.crossing, -1),
      ],
    };
  }
}
