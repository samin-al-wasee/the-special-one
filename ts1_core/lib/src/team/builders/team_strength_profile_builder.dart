import 'package:ts1_core/src/team/builders/structural_profile_builder.dart';
import 'package:ts1_core/src/core/enums/player/player_attributes.dart';
import 'package:ts1_core/src/core/enums/team/tactic/tactical_attributes.dart';
import 'package:ts1_core/src/player/models/player.dart';
import 'package:ts1_core/src/team/models/strength_profile/team_strength_profile.dart';
import 'package:ts1_core/src/team/models/team.dart';

class TeamStrengthProfileBuilder {
  TeamStrengthProfileBuilder._();

  static TeamStrengthProfile calculate(Team team) {
    final players = team.lineup.orderedStarterPlayers(team.allPlayers);
    final structural = StructuralProfileBuilder.buildFrom(
      lineup: team.lineup,
      players: team.allPlayers,
    );

    if (players.isEmpty) {
      return const TeamStrengthProfile(
        id: 0,
        buildUpQuality: 0.0,
        pressResistance: 0.0,
        wideAttack: 0.0,
        centralCreativity: 0.0,
        aerialThreat: 0.0,
        defensiveCompactness: 0.0,
        transitionThreat: 0.0,
        pressingForce: 0.0,
        possessionSecurity: 0.0,
        turnoverLiability: 0.0,
        finishingQuality: 0.0,
        shotVolumeTendency: 0.0,
        chanceConversion: 0.0,
        transitionDefense: 0.0,
        wideDefense: 0.0,
        centralDefense: 0.0,
        setPieceAttackStrength: 0.0,
        setPieceDefenseStrength: 0.0,
        disciplineControl: 0.0,
        gkDistributionQuality: 0.0,
        gkShotStopping: 0.0,
        chemistry: 0.0,
        morale: 0.0,
      );
    }

    var buildUpQuality = _average(players, const [
      _AttrRef.technical(TechnicalAttr.passing),
      _AttrRef.technical(TechnicalAttr.firstTouch),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.mental(MentalAttr.decisions),
      _AttrRef.mental(MentalAttr.vision),
    ]);

    final pressResistance = _average(players, const [
      _AttrRef.technical(TechnicalAttr.firstTouch),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.mental(MentalAttr.decisions),
      _AttrRef.physical(PhysicalAttr.balance),
      _AttrRef.physical(PhysicalAttr.agility),
    ]);

    var wideAttack = _average(players, const [
      _AttrRef.technical(TechnicalAttr.dribbling),
      _AttrRef.technical(TechnicalAttr.crossing),
      _AttrRef.physical(PhysicalAttr.pace),
      _AttrRef.mental(MentalAttr.offBall),
    ]);

    var centralCreativity = _average(players, const [
      _AttrRef.technical(TechnicalAttr.passing),
      _AttrRef.mental(MentalAttr.vision),
      _AttrRef.technical(TechnicalAttr.technique),
      _AttrRef.mental(MentalAttr.decisions),
      _AttrRef.mental(MentalAttr.offBall),
    ]);

    final aerialThreat = _average(players, const [
      _AttrRef.technical(TechnicalAttr.heading),
      _AttrRef.physical(PhysicalAttr.jumping),
      _AttrRef.physical(PhysicalAttr.strength),
    ]);

    var defensiveCompactness = _average(players, const [
      _AttrRef.mental(MentalAttr.positioning),
      _AttrRef.mental(MentalAttr.teamwork),
      _AttrRef.mental(MentalAttr.concentration),
      _AttrRef.technical(TechnicalAttr.marking),
      _AttrRef.technical(TechnicalAttr.tackling),
    ]);

    var transitionThreat = _average(players, const [
      _AttrRef.physical(PhysicalAttr.pace),
      _AttrRef.physical(PhysicalAttr.acceleration),
      _AttrRef.mental(MentalAttr.offBall),
      _AttrRef.technical(TechnicalAttr.dribbling),
      _AttrRef.mental(MentalAttr.decisions),
    ]);

    var pressingForce = _average(players, const [
      _AttrRef.mental(MentalAttr.workRate),
      _AttrRef.mental(MentalAttr.aggression),
      _AttrRef.physical(PhysicalAttr.stamina),
      _AttrRef.mental(MentalAttr.positioning),
      _AttrRef.mental(MentalAttr.teamwork),
    ]);

    final finishingQuality = _average(players, const [
      _AttrRef.technical(TechnicalAttr.finishing),
      _AttrRef.technical(TechnicalAttr.technique),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.mental(MentalAttr.decisions),
    ]);

    var shotVolumeTendency = _average(players, const [
      _AttrRef.mental(MentalAttr.offBall),
      _AttrRef.mental(MentalAttr.aggression),
      _AttrRef.technical(TechnicalAttr.longShots),
      _AttrRef.physical(PhysicalAttr.pace),
    ]);

    var chanceConversion = _average(players, const [
      _AttrRef.technical(TechnicalAttr.finishing),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.technical(TechnicalAttr.heading),
      _AttrRef.technical(TechnicalAttr.weakFootAccuracy),
    ]);

    var transitionDefense = _average(players, const [
      _AttrRef.mental(MentalAttr.positioning),
      _AttrRef.mental(MentalAttr.teamwork),
      _AttrRef.physical(PhysicalAttr.pace),
      _AttrRef.physical(PhysicalAttr.acceleration),
      _AttrRef.physical(PhysicalAttr.stamina),
    ]);

    var wideDefense = _average(players, const [
      _AttrRef.technical(TechnicalAttr.marking),
      _AttrRef.technical(TechnicalAttr.tackling),
      _AttrRef.mental(MentalAttr.positioning),
      _AttrRef.physical(PhysicalAttr.pace),
    ]);

    var centralDefense = _average(players, const [
      _AttrRef.technical(TechnicalAttr.marking),
      _AttrRef.technical(TechnicalAttr.tackling),
      _AttrRef.mental(MentalAttr.positioning),
      _AttrRef.mental(MentalAttr.concentration),
      _AttrRef.physical(PhysicalAttr.strength),
    ]);

    var setPieceAttackStrength = _average(players, const [
      _AttrRef.technical(TechnicalAttr.heading),
      _AttrRef.physical(PhysicalAttr.jumping),
      _AttrRef.physical(PhysicalAttr.strength),
      _AttrRef.technical(TechnicalAttr.setPieceDelivery),
      _AttrRef.technical(TechnicalAttr.crossing),
    ]);

    var setPieceDefenseStrength = _average(players, const [
      _AttrRef.technical(TechnicalAttr.marking),
      _AttrRef.technical(TechnicalAttr.heading),
      _AttrRef.physical(PhysicalAttr.jumping),
      _AttrRef.mental(MentalAttr.positioning),
      _AttrRef.technical(TechnicalAttr.gkCommandOfArea),
    ]);

    var possessionSecurity = _average(players, const [
      _AttrRef.technical(TechnicalAttr.firstTouch),
      _AttrRef.technical(TechnicalAttr.shortPassing),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.mental(MentalAttr.decisions),
      _AttrRef.physical(PhysicalAttr.balance),
    ]);

    var disciplineControl = _average(players, const [
      _AttrRef.mental(MentalAttr.discipline),
      _AttrRef.condition(ConditionAttr.discipline),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.hidden(HiddenAttr.temperament),
    ]);

    final gkDistributionQuality = _average(players, const [
      _AttrRef.technical(TechnicalAttr.gkKicking),
      _AttrRef.technical(TechnicalAttr.gkThrowing),
      _AttrRef.technical(TechnicalAttr.shortPassing),
      _AttrRef.mental(MentalAttr.vision),
    ]);

    final gkShotStopping = _average(players, const [
      _AttrRef.technical(TechnicalAttr.gkReflexes),
      _AttrRef.technical(TechnicalAttr.gkHandling),
      _AttrRef.technical(TechnicalAttr.gkOneOnOnes),
      _AttrRef.technical(TechnicalAttr.gkPositioning),
    ]);

    var chemistry = _calculateTeamChemistry(players);
    var morale = _calculateTeamMorale(players);

    var turnoverLiability = 100.0 - possessionSecurity;

    buildUpQuality += _buildUpModifier(team);
    wideAttack += _widthModifier(team);
    transitionThreat += _transitionModifier(team);
    pressingForce += _pressingModifier(team);

    possessionSecurity += _passingRiskSecurityModifier(team);
    turnoverLiability += _passingRiskTurnoverModifier(team);
    shotVolumeTendency += _shootingPolicyVolumeModifier(team);
    chanceConversion += _shootingPolicyConversionModifier(team);

    transitionDefense += _transitionDefenseModifier(team);
    setPieceAttackStrength += _setPieceAttackModifier(team);
    setPieceDefenseStrength += _setPieceDefenseModifier(team);

    wideDefense += _defensiveWidthWideModifier(team);
    centralDefense += _defensiveWidthCentralModifier(team);

    pressingForce += _tacklingPressModifier(team);
    disciplineControl += _tacklingDisciplineModifier(team);

    wideAttack *= 1.0 + (structural.widthCoverage - 0.5) * 0.18;
    centralCreativity *= 1.0 + (structural.centralDensity - 0.5) * 0.18;
    chanceConversion *= 1.0 + (structural.boxPresence - 0.5) * 0.14;
    pressingForce *= 1.0 + (structural.pressShapeCohesion - 0.5) * 0.18;
    transitionDefense *= 1.0 + (structural.transitionProtection - 0.5) * 0.20;
    defensiveCompactness *=
        1.0 + (structural.restDefenseStability - 0.5) * 0.16;
    setPieceAttackStrength *= 1.0 + (structural.boxPresence - 0.5) * 0.12;
    setPieceDefenseStrength *=
        1.0 + (structural.restDefenseStability - 0.5) * 0.12;

    possessionSecurity = _clamp100(possessionSecurity);
    turnoverLiability = _clamp100(turnoverLiability);
    disciplineControl = _clamp100(disciplineControl);
    chemistry = _clamp100(chemistry);
    morale = _clamp100(morale);

    final chemistryFactor = chemistry / 100.0;
    final moraleFactor = morale / 100.0;
    final scaling = (chemistryFactor + moraleFactor) / 2.0;

    return TeamStrengthProfile(
      id: team.id,
      buildUpQuality: _round1(buildUpQuality * scaling),
      pressResistance: _round1(pressResistance * scaling),
      wideAttack: _round1(wideAttack * scaling),
      centralCreativity: _round1(centralCreativity * scaling),
      aerialThreat: _round1(aerialThreat * scaling),
      defensiveCompactness: _round1(defensiveCompactness * scaling),
      transitionThreat: _round1(transitionThreat * scaling),
      pressingForce: _round1(pressingForce * scaling),
      finishingQuality: _round1(finishingQuality * scaling),
      shotVolumeTendency: _round1(shotVolumeTendency * scaling),
      chanceConversion: _round1(chanceConversion * scaling),
      transitionDefense: _round1(transitionDefense * scaling),
      wideDefense: _round1(wideDefense * scaling),
      centralDefense: _round1(centralDefense * scaling),
      setPieceAttackStrength: _round1(setPieceAttackStrength * scaling),
      setPieceDefenseStrength: _round1(setPieceDefenseStrength * scaling),
      possessionSecurity: _round1(possessionSecurity * scaling),
      turnoverLiability: _round1(turnoverLiability * scaling),
      disciplineControl: _round1(disciplineControl * scaling),
      gkDistributionQuality: _round1(gkDistributionQuality * scaling),
      gkShotStopping: _round1(gkShotStopping * scaling),
      chemistry: _round1(chemistry),
      morale: _round1(morale),
    );
  }

  static TeamStrengthProfile build(Team team) => calculate(team);

  static double _average(List<Player> players, List<_AttrRef> attributeMap) {
    final values = <int>[];

    for (final player in players) {
      for (final ref in attributeMap) {
        values.add(ref.read(player, defaultValue: defaultAttr));
      }
    }

    if (values.isEmpty) {
      return 0.0;
    }
    return values.reduce((a, b) => a + b) / values.length;
  }

  static double _calculateTeamChemistry(List<Player> players) {
    return _average(players, const [
      _AttrRef.mental(MentalAttr.teamwork),
      _AttrRef.mental(MentalAttr.leadership),
      _AttrRef.mental(MentalAttr.discipline),
      _AttrRef.hidden(HiddenAttr.professionalism),
      _AttrRef.hidden(HiddenAttr.adaptability),
      _AttrRef.condition(ConditionAttr.morale),
    ]);
  }

  static double _calculateTeamMorale(List<Player> players) {
    return _average(players, const [
      _AttrRef.condition(ConditionAttr.morale),
      _AttrRef.condition(ConditionAttr.sharpness),
      _AttrRef.condition(ConditionAttr.matchFitness),
      _AttrRef.mental(MentalAttr.composure),
      _AttrRef.hidden(HiddenAttr.consistency),
      _AttrRef.hidden(HiddenAttr.bigMatches),
    ]);
  }

  static double _buildUpModifier(Team team) {
    if (team.tactic.buildUpStyle == BuildUpStyle.buildFromBack) {
      return 5.0;
    }
    if (team.tactic.buildUpStyle == BuildUpStyle.longBall) {
      return -3.0;
    }
    return 0.0;
  }

  static double _widthModifier(Team team) {
    if (team.tactic.width == Width.wide) {
      return 4.0;
    }
    if (team.tactic.width == Width.veryWide) {
      return 6.0;
    }
    if (team.tactic.width == Width.narrow) {
      return -2.0;
    }
    return 0.0;
  }

  static double _transitionModifier(Team team) {
    if (team.tactic.transitionOnWin == TransitionOnWin.counterImmediately) {
      return 5.0;
    }
    if (team.tactic.transitionOnWin == TransitionOnWin.holdShape) {
      return -2.0;
    }
    return 0.0;
  }

  static double _pressingModifier(Team team) {
    if (team.tactic.pressingIntensity == PressingIntensity.high) {
      return 5.0;
    }
    if (team.tactic.pressingIntensity == PressingIntensity.extreme) {
      return 8.0;
    }
    if (team.tactic.pressingIntensity == PressingIntensity.low) {
      return -3.0;
    }
    return 0.0;
  }

  static double _passingRiskSecurityModifier(Team team) {
    if (team.tactic.passingRisk == PassingRisk.verySafe) {
      return 6.0;
    }
    if (team.tactic.passingRisk == PassingRisk.safe) {
      return 3.0;
    }
    if (team.tactic.passingRisk == PassingRisk.risky) {
      return -3.0;
    }
    if (team.tactic.passingRisk == PassingRisk.veryRisky) {
      return -6.0;
    }
    return 0.0;
  }

  static double _passingRiskTurnoverModifier(Team team) {
    if (team.tactic.passingRisk == PassingRisk.verySafe) {
      return -6.0;
    }
    if (team.tactic.passingRisk == PassingRisk.safe) {
      return -3.0;
    }
    if (team.tactic.passingRisk == PassingRisk.risky) {
      return 3.0;
    }
    if (team.tactic.passingRisk == PassingRisk.veryRisky) {
      return 6.0;
    }
    return 0.0;
  }

  static double _shootingPolicyVolumeModifier(Team team) {
    if (team.tactic.shootingPolicy == ShootingPolicy.shootMore) {
      return 4.0;
    }
    if (team.tactic.shootingPolicy == ShootingPolicy.shootAggressively) {
      return 7.0;
    }
    if (team.tactic.shootingPolicy == ShootingPolicy.shootLess) {
      return -4.0;
    }
    return 0.0;
  }

  static double _shootingPolicyConversionModifier(Team team) {
    if (team.tactic.shootingPolicy == ShootingPolicy.shootLess) {
      return 3.0;
    }
    if (team.tactic.shootingPolicy == ShootingPolicy.shootAggressively) {
      return -4.0;
    }
    return 0.0;
  }

  static double _transitionDefenseModifier(Team team) {
    if (team.tactic.transitionOnLoss == TransitionOnLoss.regroup) {
      return 6.0;
    }
    if (team.tactic.transitionOnLoss == TransitionOnLoss.dropDeepImmediately) {
      return 4.0;
    }
    if (team.tactic.transitionOnLoss == TransitionOnLoss.counterpress) {
      return -2.0;
    }
    return 0.0;
  }

  static double _setPieceAttackModifier(Team team) {
    if (team.tactic.setPieceAttack == SetPieceAttack.tallPlayerTargeting) {
      return 7.0;
    }
    if (team.tactic.setPieceAttack == SetPieceAttack.nearPostCorners) {
      return 3.0;
    }
    if (team.tactic.setPieceAttack == SetPieceAttack.farPostCorners) {
      return 3.0;
    }
    if (team.tactic.setPieceAttack == SetPieceAttack.shortCorners) {
      return -1.0;
    }
    return 0.0;
  }

  static double _setPieceDefenseModifier(Team team) {
    if (team.tactic.setPieceDefense == SetPieceDefense.zonalMarking) {
      return 4.0;
    }
    if (team.tactic.setPieceDefense == SetPieceDefense.manMarking) {
      return 4.0;
    }
    if (team.tactic.setPieceDefense == SetPieceDefense.nearPostGuard) {
      return 2.0;
    }
    if (team.tactic.setPieceDefense == SetPieceDefense.leavePlayersUp) {
      return -3.0;
    }
    return 0.0;
  }

  static double _defensiveWidthWideModifier(Team team) {
    if (team.tactic.defensiveWidth == DefensiveWidth.wide) {
      return 4.0;
    }
    if (team.tactic.defensiveWidth == DefensiveWidth.veryWide) {
      return 6.0;
    }
    if (team.tactic.defensiveWidth == DefensiveWidth.narrow) {
      return -3.0;
    }
    if (team.tactic.defensiveWidth == DefensiveWidth.veryNarrow) {
      return -5.0;
    }
    return 0.0;
  }

  static double _defensiveWidthCentralModifier(Team team) {
    if (team.tactic.defensiveWidth == DefensiveWidth.narrow) {
      return 4.0;
    }
    if (team.tactic.defensiveWidth == DefensiveWidth.veryNarrow) {
      return 6.0;
    }
    if (team.tactic.defensiveWidth == DefensiveWidth.wide) {
      return -3.0;
    }
    if (team.tactic.defensiveWidth == DefensiveWidth.veryWide) {
      return -5.0;
    }
    return 0.0;
  }

  static double _tacklingPressModifier(Team team) {
    if (team.tactic.tacklingAggression == TacklingAggression.aggressive) {
      return 2.0;
    }
    if (team.tactic.tacklingAggression == TacklingAggression.veryAggressive) {
      return 4.0;
    }
    if (team.tactic.tacklingAggression == TacklingAggression.stayOnFeet) {
      return -1.0;
    }
    return 0.0;
  }

  static double _tacklingDisciplineModifier(Team team) {
    if (team.tactic.tacklingAggression == TacklingAggression.stayOnFeet) {
      return 4.0;
    }
    if (team.tactic.tacklingAggression == TacklingAggression.aggressive) {
      return -3.0;
    }
    if (team.tactic.tacklingAggression == TacklingAggression.veryAggressive) {
      return -6.0;
    }
    return 0.0;
  }

  static double _clamp100(double value) => value.clamp(0.0, 100.0).toDouble();

  static double _round1(double value) => (value * 10).roundToDouble() / 10.0;
}

enum _AttrBucket { technical, mental, physical, hidden, condition }

class _AttrRef {
  const _AttrRef(this.bucket, this.key);

  const _AttrRef.technical(TechnicalAttr key)
    : this(_AttrBucket.technical, key);
  const _AttrRef.mental(MentalAttr key) : this(_AttrBucket.mental, key);
  const _AttrRef.physical(PhysicalAttr key) : this(_AttrBucket.physical, key);
  const _AttrRef.hidden(HiddenAttr key) : this(_AttrBucket.hidden, key);
  const _AttrRef.condition(ConditionAttr key)
    : this(_AttrBucket.condition, key);

  final _AttrBucket bucket;
  final Enum key;

  int read(Player player, {int defaultValue = defaultAttr}) {
    switch (bucket) {
      case _AttrBucket.technical:
        return player.technical[key as TechnicalAttr] ?? defaultValue;
      case _AttrBucket.mental:
        return player.mental[key as MentalAttr] ?? defaultValue;
      case _AttrBucket.physical:
        return player.physical[key as PhysicalAttr] ?? defaultValue;
      case _AttrBucket.hidden:
        return player.hidden[key as HiddenAttr] ?? defaultValue;
      case _AttrBucket.condition:
        return player.condition[key as ConditionAttr] ?? defaultValue;
    }
  }
}
