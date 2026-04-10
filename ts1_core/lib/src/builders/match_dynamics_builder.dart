import 'package:ts1_core/src/enums/match/pitch_zone.dart';
import 'package:ts1_core/src/models/match/context/match_context.dart';
import 'package:ts1_core/src/models/match/dynamics/match_dynamics.dart';
import 'package:ts1_core/src/models/match/state/matchup_state.dart';
import 'package:ts1_core/src/models/team/lineup/formation/structural_profile.dart';
import 'package:ts1_core/src/models/team/strength_profile/team_strength_profile.dart';
import 'package:ts1_core/src/models/team/tactic/tactical_identity/tactical_identity.dart';

class MatchDynamicsBuilder {
  const MatchDynamicsBuilder._();

  static MatchDynamics fromContext(
    MatchContext context, {
    MatchupState? matchupState,
  }) {
    final matchup =
        matchupState ??
        const MatchupState(
          id: 0,
          homeAttackVsAwayDefense: 0.0,
          awayAttackVsHomeDefense: 0.0,
          midfieldControlEdge: 0.0,
          transitionControlEdge: 0.0,
          wingControlEdge: 0.0,
          setPieceControlEdge: 0.0,
        );

    final homeMomentum = _initialMomentum(
      identity: context.homeTacticalIdentity,
      opponentIdentity: context.awayTacticalIdentity,
      matchup: matchup,
    );

    final homeConfidence = _initialConfidence(
      ownStrength: context.homeStrengthProfile,
      oppStrength: context.awayStrengthProfile,
      ownStructure: context.homeStructuralProfile,
      oppStructure: context.awayStructuralProfile,
      matchupTilt: _overallMatchupTilt(matchup),
    );

    final homeFatigue = _initialFatigue(
      identity: context.homeTacticalIdentity,
      structure: context.homeStructuralProfile,
    );

    final homeDisciplinePressure = _initialDisciplinePressure(
      identity: context.homeTacticalIdentity,
      strength: context.homeStrengthProfile,
    );

    return MatchDynamics(
      id: context.id,
      homeMomentum: homeMomentum,
      awayMomentum: -homeMomentum,
      homeConfidence: homeConfidence,
      awayConfidence: 1.0 - homeConfidence,
      homeFatigue: homeFatigue,
      awayFatigue: _initialFatigue(
        identity: context.awayTacticalIdentity,
        structure: context.awayStructuralProfile,
      ),
      homeDisciplinePressure: homeDisciplinePressure,
      awayDisciplinePressure: _initialDisciplinePressure(
        identity: context.awayTacticalIdentity,
        strength: context.awayStrengthProfile,
      ),
      homeZoneDominance: _zoneDominanceFromStructural(
        context.homeStructuralProfile,
      ),
      awayZoneDominance: _zoneDominanceFromStructural(
        context.awayStructuralProfile,
      ),
      exploitationCounters: const <String, int>{},
    ).ensureZoneMapsInitialized();
  }

  static double _initialMomentum({
    required TacticalIdentity identity,
    required TacticalIdentity opponentIdentity,
    required MatchupState matchup,
  }) {
    final tilt = _overallMatchupTilt(matchup);
    final tacticalTilt =
        identity.possessionTilt - opponentIdentity.possessionTilt;
    final value = (tilt * 0.35) + (tacticalTilt * 0.25);
    return _clamp(value, -0.25, 0.25);
  }

  static double _initialConfidence({
    required TeamStrengthProfile ownStrength,
    required TeamStrengthProfile oppStrength,
    required StructuralProfile ownStructure,
    required StructuralProfile oppStructure,
    required double matchupTilt,
  }) {
    final mentalityBase =
        ((ownStrength.chemistry + ownStrength.morale) / 200.0) -
        ((oppStrength.chemistry + oppStrength.morale) / 200.0);
    final structureEdge =
        ((ownStructure.slotFitScore + ownStructure.roleCoherence) * 0.5) -
        ((oppStructure.slotFitScore + oppStructure.roleCoherence) * 0.5);

    final value =
        0.5 +
        (mentalityBase * 0.25) +
        (structureEdge * 0.15) +
        (matchupTilt * 0.10);
    return _clamp(value, 0.35, 0.65);
  }

  static double _initialFatigue({
    required TacticalIdentity identity,
    required StructuralProfile structure,
  }) {
    final value =
        0.02 +
        (identity.pressIntensityBias * 0.06) +
        (identity.verticalProgressionBias * 0.04) -
        (structure.supportNetworkQuality * 0.02);
    return _clamp(value, 0.0, 0.20);
  }

  static double _initialDisciplinePressure({
    required TacticalIdentity identity,
    required TeamStrengthProfile strength,
  }) {
    final value =
        0.08 +
        (identity.tacklingAggressionBias * 0.30) +
        (identity.riskTaking * 0.18) -
        (strength.disciplineControl / 350.0);
    return _clamp(value, 0.0, 0.35);
  }

  static double _overallMatchupTilt(MatchupState matchup) {
    final sum =
        matchup.homeAttackVsAwayDefense +
        matchup.awayAttackVsHomeDefense +
        matchup.midfieldControlEdge +
        matchup.transitionControlEdge +
        matchup.wingControlEdge +
        matchup.setPieceControlEdge;
    return _clamp(sum / 6.0, -1.0, 1.0);
  }

  static Map<PitchZone, double> _zoneDominanceFromStructural(
    StructuralProfile structure,
  ) {
    final map = <PitchZone, double>{
      for (final zone in PitchZone.values) zone: 0.05,
    };

    for (final zone in const [
      PitchZone.lw,
      PitchZone.rw,
      PitchZone.lm,
      PitchZone.rm,
    ]) {
      map[zone] = _clamp(
        map[zone]! + (structure.widthCoverage * 0.35),
        0.0,
        1.0,
      );
    }

    for (final zone in const [
      PitchZone.lhs,
      PitchZone.cf,
      PitchZone.rhs,
      PitchZone.lcm,
      PitchZone.cm,
      PitchZone.rcm,
    ]) {
      map[zone] = _clamp(
        map[zone]! + (structure.centralDensity * 0.35),
        0.0,
        1.0,
      );
    }

    for (final zone in const [
      PitchZone.lw,
      PitchZone.lhs,
      PitchZone.cf,
      PitchZone.rhs,
      PitchZone.rw,
    ]) {
      map[zone] = _clamp(map[zone]! + (structure.boxPresence * 0.25), 0.0, 1.0);
    }

    for (final zone in const [
      PitchZone.lb,
      PitchZone.lcb,
      PitchZone.cb,
      PitchZone.rcb,
      PitchZone.rb,
    ]) {
      map[zone] = _clamp(
        map[zone]! + (structure.restDefenseStability * 0.25),
        0.0,
        1.0,
      );
    }

    return map;
  }

  static double _clamp(double x, double lo, double hi) {
    return x.clamp(lo, hi).toDouble();
  }
}
