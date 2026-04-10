/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:ts1_core/src/engines/match_engine.dart';
import 'package:ts1_core/src/enums/team/tactic/tactical_attributes.dart';

import 'src/enums/match/match_enums.dart';
import 'src/enums/player/player_attributes.dart';
import 'src/enums/player/position.dart';
import 'src/models/match/attack/attack_state.dart';
import 'src/models/match/context/match_context.dart';
import 'src/models/match/match.dart';
import 'src/models/match/state/match_state.dart';
import 'src/models/player/player.dart';
import 'src/models/team/lineup/formation/shape/formation_shape.dart';
import 'src/models/team/lineup/formation/slot/formation_slot.dart';
import 'src/models/team/lineup/team_lineup.dart';
import 'src/models/team/tactic/team_tactic.dart';
import 'src/models/team/team.dart';

export 'src/ts1_core_base.dart';
export 'src/builders/structural_profile_builder.dart';
export 'src/builders/tactical_identity_builder.dart';
export 'src/builders/team_strength_profile_builder.dart';
export 'src/engines/match_engine.dart';
export 'src/enums/player/player_attributes.dart';
export 'src/enums/player/position.dart';
export 'src/enums/team/tactic/tactical_attributes.dart';
export 'src/enums/player/role.dart';
export 'src/enums/player/duty.dart';
export 'src/models/team/lineup/formation/slot/formation_slot.dart';
export 'src/models/team/lineup/formation/shape/formation_shape.dart';
export 'src/models/team/lineup/formation/structural_profile.dart';
export 'src/models/team/lineup/slot_assignment/role_assignment/role_assignment.dart';
export 'src/models/team/lineup/slot_assignment/lineup_slot_assignment.dart';
export 'src/models/team/lineup/team_lineup.dart';
export 'src/models/team/strength_profile/team_strength_profile.dart';
export 'src/models/team/tactic/tactical_identity/tactical_identity.dart';
export 'src/models/team/tactic/team_tactic.dart';
export 'src/models/player/player.dart';

void main() {
  final homeTeam = _buildDemoTeam(
    id: 1,
    name: 'Home FC',
    player: Player(
      id: 7,
      name: 'Cristiano Ronaldo',
      dateOfBirth: DateTime(1985, 2, 5),
      heightCm: 187,
      weightKg: 83,
      position: Position.striker,
      footedness: Footedness.right,
      technical: const {TechnicalAttr.finishing: 95, TechnicalAttr.heading: 92},
      mental: const {MentalAttr.composure: 94, MentalAttr.determination: 97},
      physical: const {PhysicalAttr.pace: 89, PhysicalAttr.strength: 90},
    ),
    tactic: _attackingDemoTactic(1),
  );

  final awayTeam = _buildDemoTeam(
    id: 2,
    name: 'Away FC',
    player: Player(
      id: 10,
      name: 'Lionel Messi',
      dateOfBirth: DateTime(1987, 6, 24),
      heightCm: 170,
      weightKg: 72,
      position: Position.striker,
      footedness: Footedness.left,
      technical: const {TechnicalAttr.dribbling: 97, TechnicalAttr.passing: 95},
      mental: const {MentalAttr.vision: 96, MentalAttr.decisions: 94},
      physical: const {PhysicalAttr.balance: 95, PhysicalAttr.agility: 93},
    ),
    tactic: _cautiousDemoTactic(2),
  );

  final engine = MatchEngine.shared;
  var match = Match(
    id: 1001,
    homeTeam: homeTeam,
    awayTeam: awayTeam,
    kickoffAt: DateTime(2026, 4, 10, 20, 0),
    venue: 'Demo Stadium',
    weather: 'Clear',
    context: MatchContext(),
    matchState: const MatchState(),
  );

  match = engine.kickoffMatch(match, kickoffSide: TeamSide.home);
  print('Kickoff');
  print(match.matchState.summary(homeTeam.name, awayTeam.name));

  final buildUp = engine.buildSnapshot(
    state: match.matchState,
    phaseIndex: 1,
    phaseType: MatchPhaseType.buildUp,
    phaseState: MatchPhaseState.buildUp,
    initiativeTeam: TeamSide.home,
    possessionTeam: TeamSide.home,
    territoryTeam: TeamSide.home,
    zone: PitchZone.cm,
  );
  match = engine.resolvePhase(match, buildUp);

  final chance = engine.buildSnapshot(
    state: match.matchState,
    phaseIndex: 2,
    phaseType: MatchPhaseType.chance,
    phaseState: MatchPhaseState.chance,
    initiativeTeam: TeamSide.home,
    possessionTeam: TeamSide.home,
    territoryTeam: TeamSide.home,
    attackState: const AttackState(
      route: AttackRoute.centralProgression,
      mode: AttackMode.quickTransition,
      context: AttackContext.defensiveTransition,
      phaseCount: 1,
      intensity: 0.78,
    ),
    chanceType: ChanceType.highXgCentralShot,
    chanceOutcome: ChanceOutcome.goal,
    chanceQuality: 0.78,
    zone: PitchZone.cf,
    isImportant: true,
  );
  match = engine.resolvePhase(match, chance);

  print('After goal');
  print(match.matchState.summary(homeTeam.name, awayTeam.name));
}

Team _buildDemoTeam({
  required int id,
  required String name,
  required Player player,
  required TeamTactic tactic,
}) {
  final formation = FormationShape(
    id: id,
    code: "1-0-${id == 1 ? 'H' : 'A'}",
    slotDefinitions: const [
      FormationSlot(
        id: 1,
        slotId: 'ST',
        baseZone: PitchZone.cf,
        line: 'Attack',
        lateralBand: SlotLateralBand.center,
        verticalBand: SlotVerticalBand.high,
        preferredPositions: [Position.striker],
      ),
    ],
  );

  final lineup = TeamLineup.fromPlayers(
    formation: formation,
    players: [player],
    captain: player,
  );

  return Team(
    id: id,
    name: name,
    tactic: tactic,
    lineup: lineup,
    squad: [player],
  );
}

TeamTactic _attackingDemoTactic(int id) {
  return TeamTactic(
    id: id,
    buildUpStyle: BuildUpStyle.buildFromBack,
    tempo: Tempo.high,
    width: Width.wide,
    finalThirdFocus: FinalThirdFocus.workBallIntoBox,
    attackingFocus: AttackingFocus.attackCentre,
    defensiveLine: DefensiveLine.high,
    lineOfEngagement: LineOfEngagement.highBlock,
    pressingIntensity: PressingIntensity.high,
    defensiveWidth: DefensiveWidth.wide,
    markingStyle: MarkingStyle.zonal,
    tacklingAggression: TacklingAggression.balanced,
    transitionOnWin: TransitionOnWin.counterImmediately,
    transitionOnLoss: TransitionOnLoss.counterpress,
    teamMentality: TeamMentality.attacking,
    passingRisk: PassingRisk.balanced,
    dribblingRisk: DribblingRisk.aggressive,
    shootingPolicy: ShootingPolicy.balanced,
    compactness: Compactness.compact,
    verticalStretch: VerticalStretch.stretched,
    overloadFocus: OverloadFocus.centralOverload,
    setPieceAttack: SetPieceAttack.mixedCorners,
    setPieceDefense: SetPieceDefense.mixedMarking,
    freeKickStrategy: FreeKickStrategy.crossIntoBox,
  );
}

TeamTactic _cautiousDemoTactic(int id) {
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
    passingRisk: PassingRisk.safe,
    dribblingRisk: DribblingRisk.balanced,
    shootingPolicy: ShootingPolicy.balanced,
    compactness: Compactness.balanced,
    verticalStretch: VerticalStretch.balanced,
    overloadFocus: OverloadFocus.noSpecificOverload,
    setPieceAttack: SetPieceAttack.shortCorners,
    setPieceDefense: SetPieceDefense.zonalMarking,
    freeKickStrategy: FreeKickStrategy.shortRoutine,
  );
}
