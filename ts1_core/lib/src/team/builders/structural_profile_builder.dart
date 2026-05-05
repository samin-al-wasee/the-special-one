import 'dart:math';

import 'package:ts1_core/src/core/enums/player/player_attributes.dart';
import 'package:ts1_core/src/core/enums/player/player_attributes_exports.dart';
import 'package:ts1_core/src/player/models/player.dart';
import 'package:ts1_core/src/team/models/lineup/formation/slot/formation_slot.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';
import 'package:ts1_core/src/team/models/lineup/formation/structural_profile.dart';
import 'package:ts1_core/src/team/models/lineup/team_lineup.dart';

double _clamp01(double x) => x.clamp(0.0, 1.0);

double _avg(Iterable<double> values, {double defaultValue = 0.5}) {
  final vals = values.toList();
  if (vals.isEmpty) {
    return defaultValue;
  }
  return vals.reduce((a, b) => a + b) / vals.length;
}

class StructuralProfileBuilder {
  StructuralProfileBuilder._();

  TeamLineup? _lineup;
  List<Player> _players = const [];

  factory StructuralProfileBuilder.create() => StructuralProfileBuilder._();

  StructuralProfileBuilder withLineup(TeamLineup lineup) {
    _lineup = lineup;
    return this;
  }

  StructuralProfileBuilder withPlayers(List<Player> players) {
    _players = List<Player>.from(players);
    return this;
  }

  StructuralProfile build() {
    final lineup = _lineup;
    if (lineup == null) {
      throw StateError(
        'TeamLineup must be provided before calling build(). Use withLineup(...).',
      );
    }
    return buildFrom(lineup: lineup, players: _players);
  }

  static double _roleFit(Player player, String roleName) {
    final role = roleName.toLowerCase();

    if (role.contains('wing')) {
      final score = _avg([
        _tech(player, TechnicalAttr.dribbling) / 100.0,
        _tech(player, TechnicalAttr.crossing) / 100.0,
        _physical(player, PhysicalAttr.pace) / 100.0,
        _mental(player, MentalAttr.offBall) / 100.0,
      ]);
      return _clamp01(score);
    }

    if (role.contains('forward') ||
        role.contains('striker') ||
        role.contains('poacher') ||
        role.contains('target')) {
      final score = _avg([
        _tech(player, TechnicalAttr.finishing) / 100.0,
        _mental(player, MentalAttr.composure) / 100.0,
        _mental(player, MentalAttr.offBall) / 100.0,
        _physical(player, PhysicalAttr.strength) / 100.0,
      ]);
      return _clamp01(score);
    }

    if (role.contains('defender') || role.contains('back')) {
      final score = _avg([
        _tech(player, TechnicalAttr.marking) / 100.0,
        _tech(player, TechnicalAttr.tackling) / 100.0,
        _mental(player, MentalAttr.positioning) / 100.0,
        _mental(player, MentalAttr.concentration) / 100.0,
      ]);
      return _clamp01(score);
    }

    if (role.contains('keeper')) {
      final score = _avg([
        _tech(player, TechnicalAttr.gkReflexes) / 100.0,
        _tech(player, TechnicalAttr.gkHandling) / 100.0,
        _tech(player, TechnicalAttr.gkPositioning) / 100.0,
      ]);
      return _clamp01(score);
    }

    // Midfield/playmaker default profile.
    final score = _avg([
      _tech(player, TechnicalAttr.shortPassing) / 100.0,
      _tech(player, TechnicalAttr.technique) / 100.0,
      _mental(player, MentalAttr.vision) / 100.0,
      _mental(player, MentalAttr.decisions) / 100.0,
    ]);
    return _clamp01(score);
  }

  static StructuralProfile buildFrom({
    required TeamLineup lineup,
    List<Player> players = const [],
  }) {
    final byId = <int, Player>{};
    for (final player in players) {
      byId[player.id] = player;
    }
    for (final assignment in lineup.slotAssignments) {
      byId.putIfAbsent(assignment.player.id, () => assignment.player);
    }

    final fits = <double>[];
    final roleFits = <double>[];
    var lateralWide = 0;
    var lateralCenter = 0;
    var highLineCount = 0;
    var deepLineCount = 0;
    var supportLinks = 0;
    var adjacencyLinks = 0;
    var attackingLaneAccessCount = 0;
    var defensiveResponsibilityCount = 0;
    var positionWideCount = 0;
    var positionCentralCount = 0;

    for (final assignment in lineup.slotAssignments) {
      final slot = lineup.formationShape.slotById(
        assignment.formationSlot.slotId,
      );
      final player = byId[assignment.player.id];
      if (slot == null || player == null) {
        continue;
      }

      final posFit =
          slot.preferredPositions.isEmpty ||
              slot.preferredPositions.contains(player.position)
          ? 1.0
          : 0.65;

      fits.add(posFit);
      roleFits.add(_roleFit(player, assignment.roleAssignment.roleName.label));

      if (slot.lateralBand == SlotLateralBand.leftWide ||
          slot.lateralBand == SlotLateralBand.rightWide) {
        lateralWide += 1;
      }
      if (slot.lateralBand == SlotLateralBand.center ||
          slot.lateralBand == SlotLateralBand.leftHalfSpace ||
          slot.lateralBand == SlotLateralBand.rightHalfSpace) {
        lateralCenter += 1;
      }
      if (slot.verticalBand == SlotVerticalBand.high) {
        highLineCount += 1;
      }
      if (slot.verticalBand == SlotVerticalBand.deep) {
        deepLineCount += 1;
      }

      supportLinks += slot.supportLinks.length;
      adjacencyLinks += slot.adjacencySlots.length;

      // account for attacking lanes that this slot affords (increases box presence)
      attackingLaneAccessCount += slot.attackingLaneAccess.length;

      // defensive responsibilities (covers set-piece/marking duties)
      defensiveResponsibilityCount += slot.defensiveResponsibility.length;

      // position-based heuristics for width/central density
      if (slot.position == Position.leftWinger ||
          slot.position == Position.rightWinger ||
          slot.position == Position.leftMidfielder ||
          slot.position == Position.rightMidfielder) {
        positionWideCount += 1;
      }
      if (slot.position == Position.centralMidfielder ||
          slot.position == Position.attackingMidfielder ||
          slot.position == Position.defensiveMidfielder ||
          slot.position == Position.centerBack) {
        positionCentralCount += 1;
      }

      // line overrides: treat explicit attack line as contributing to high line,
      // and defense line as contributing to deep line.
      try {
        if (slot.line.name.toLowerCase().contains('attack')) {
          highLineCount += 1;
        } else if (slot.line.name.toLowerCase().contains('defense') ||
            slot.line.name.toLowerCase().contains('goalkeeper')) {
          deepLineCount += 1;
        }
      } catch (_) {
        // ignore if line is not set or unexpected
      }
    }

    final starterCount = max(1, lineup.slotAssignments.length);

    final widthCoverage = _clamp01(lateralWide / starterCount);
    final centralDensity = _clamp01(lateralCenter / starterCount);

    final supportNetworkQuality = _clamp01(
      _avg(fits) * 0.40 +
          _avg(roleFits) * 0.33 +
          _clamp01(supportLinks / max(1, adjacencyLinks)) * 0.17 +
          (positionCentralCount / starterCount) * 0.10,
    );

    final formationTags = lineup.formationShape.structuralTags;

    final boxPresence = _clamp01(
      (highLineCount / starterCount) * 0.55 +
          (formationTags['natural_width'] ?? 0.5) * 0.18 +
          _avg(roleFits) * 0.17 +
          ((attackingLaneAccessCount / starterCount).clamp(0.0, 1.0)) * 0.10,
    );

    final restDefenseStability = _clamp01(
      (deepLineCount / starterCount) * 0.40 +
          (formationTags['rest_defense_shape'] ?? 0.5) * 0.33 +
          _avg(fits) * 0.15 +
          ((defensiveResponsibilityCount / starterCount).clamp(0.0, 1.0)) *
              0.12,
    );

    final pressShapeCohesion = _clamp01(
      (formationTags['press_front_line'] ?? 0.5) * 0.45 +
          _avg(roleFits) * 0.25 +
          _avg(
                lineup.slotAssignments
                    .where((a) => byId.containsKey(a.player.id))
                    .map(
                      (a) =>
                          _mental(byId[a.player.id]!, MentalAttr.workRate) /
                          100.0,
                    ),
              ) *
              0.30,
    );

    final transitionProtection = _clamp01(
      restDefenseStability * 0.50 +
          _avg(
                lineup.slotAssignments
                    .where((a) => byId.containsKey(a.player.id))
                    .map(
                      (a) =>
                          _mental(byId[a.player.id]!, MentalAttr.positioning) /
                          100.0,
                    ),
              ) *
              0.40 +
          ((defensiveResponsibilityCount / starterCount).clamp(0.0, 1.0)) *
              0.10,
    );

    var halfSpaceSlotHits = 0;
    for (final assignment in lineup.slotAssignments) {
      final slot = lineup.formationShape.slotById(
        assignment.formationSlot.slotId,
      );
      if (slot == null) {
        continue;
      }
      if (slot.lateralBand == SlotLateralBand.leftHalfSpace ||
          slot.lateralBand == SlotLateralBand.rightHalfSpace) {
        halfSpaceSlotHits += 1;
      }
    }

    final halfSpaceAccess = _clamp01(
      _clamp01(halfSpaceSlotHits / max(1, starterCount)) * 0.55 +
          _avg(roleFits) * 0.35 +
          ((attackingLaneAccessCount / starterCount).clamp(0.0, 1.0)) * 0.10,
    );

    final flankIsolationRisk = _clamp01(
      1.0 -
          (widthCoverage * 0.45 +
              supportNetworkQuality * 0.35 +
              transitionProtection * 0.15 +
              (positionWideCount / starterCount) * 0.05),
    );

    return StructuralProfile(
      id: lineup.id,
      widthCoverage: widthCoverage,
      centralDensity: centralDensity,
      supportNetworkQuality: supportNetworkQuality,
      boxPresence: boxPresence,
      restDefenseStability: restDefenseStability,
      pressShapeCohesion: pressShapeCohesion,
      transitionProtection: transitionProtection,
      halfSpaceAccess: halfSpaceAccess,
      flankIsolationRisk: flankIsolationRisk,
      slotFitScore: _avg(fits),
      roleCoherence: _avg(roleFits),
    );
  }

  static int _tech(Player player, TechnicalAttr attr) {
    return player.technical[attr] ?? defaultAttr;
  }

  static int _mental(Player player, MentalAttr attr) {
    return player.mental[attr] ?? defaultAttr;
  }

  static int _physical(Player player, PhysicalAttr attr) {
    return player.physical[attr] ?? defaultAttr;
  }
}
