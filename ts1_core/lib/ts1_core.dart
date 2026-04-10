/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:math' as math;

import 'package:ts1_core/src/engines/match_engine.dart';
import 'package:ts1_core/src/factories/formation_factory.dart';
import 'package:ts1_core/src/factories/tactical_preset_factory.dart';

import 'src/enums/match_enums.dart';
import 'src/enums/player/player_attributes.dart';
import 'src/enums/player/position.dart';
import 'src/models/match/match.dart';
import 'src/models/match/stats/team_match_stats.dart';
import 'src/models/player/player.dart';
import 'src/models/team/lineup/formation/slot/formation_slot.dart';
import 'src/models/team/lineup/team_lineup.dart';
import 'src/models/team/team.dart';

export 'src/ts1_core_base.dart';
export 'src/builders/structural_profile_builder.dart';
export 'src/builders/tactical_identity_builder.dart';
export 'src/builders/team_strength_profile_builder.dart';
export 'src/builders/match_context_builder.dart';
export 'src/builders/matchup_state_builder.dart';
export 'src/builders/match_dynamics_builder.dart';
export 'src/factories/formation_factory.dart';
export 'src/factories/match_state_factory.dart';
export 'src/factories/tactical_preset_factory.dart';
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

void main(List<String> args) {
  final deterministic = _resolveDeterministicFlag(args);
  final random = math.Random();
  final homeTeamId = deterministic ? 1 : _randomTeamId(random);
  var awayTeamId = deterministic ? 2 : _randomTeamId(random);
  while (awayTeamId == homeTeamId) {
    awayTeamId = _randomTeamId(random);
  }

  final matchId = deterministic ? 1001 : 100000 + random.nextInt(900000);

  final homeTeam = _buildDemoTeam(
    id: homeTeamId,
    name: 'Home FC',
    formationCode: '4-3-3',
    preset: TacticalPreset.gegenpress,
  );

  final awayTeam = _buildDemoTeam(
    id: awayTeamId,
    name: 'Away FC',
    formationCode: '4-2-3-1',
    preset: TacticalPreset.possessionControl,
  );

  final bootstrapped = MatchEngine.bootstrapMatch(
    id: matchId,
    homeTeam: homeTeam,
    awayTeam: awayTeam,
    kickoffAt: DateTime(2026, 4, 11, 20, 0),
    venue: 'Demo Stadium',
    weather: 'Clear',
  );

  final kickedOff = MatchEngine.kickoffMatch(bootstrapped);
  final finished = _simulateRegulation90(kickedOff);

  print(
    'Match simulated (11v11, full regulation) | deterministic: $deterministic | matchId: $matchId',
  );
  print(
    'Final score: ${homeTeam.name} ${finished.matchState.scoreline.home} - ${finished.matchState.scoreline.away} ${awayTeam.name}',
  );
  print('Status: ${finished.matchState.status.name}');
  print('Clock: ${finished.matchState.clock}');

  print('\n=== TEAM STATS ===');
  _printTeamStats(homeTeam.name, finished.matchState.homeStats);
  _printTeamStats(awayTeam.name, finished.matchState.awayStats);

  print(
    '\n=== PHASE SNAPSHOTS (${finished.matchState.phaseHistory.length}) ===',
  );
  _printPhaseSnapshots(finished);

  print('\n=== EVENT CARDS (${finished.matchState.eventCards.length}) ===');
  _printEventCards(finished);

  print(
    '\n=== TACTICAL INSIGHTS (${finished.matchState.tacticalInsights.length}) ===',
  );
  _printInsights(finished);
}

bool _resolveDeterministicFlag(List<String> args) {
  for (final arg in args) {
    final normalized = arg.trim().toLowerCase();
    if (normalized == 'deterministic=false' ||
        normalized == '--deterministic=false') {
      return false;
    }
    if (normalized == 'deterministic=true' ||
        normalized == '--deterministic=true') {
      return true;
    }
  }

  return true;
}

int _randomTeamId(math.Random random) {
  return 1 + random.nextInt(99999);
}

void _printTeamStats(String teamName, TeamMatchStats stats) {
  print(teamName);
  print('  Possession: ${stats.possession.toStringAsFixed(1)}%');
  print('  Shots: ${stats.shots} (On target: ${stats.shotsOnTarget})');
  print(
    '  Chances: ${stats.chancesCreated} | xG: ${stats.expectedGoals.toStringAsFixed(2)}',
  );
  print('  Passes: ${stats.passesCompleted}/${stats.passesAttempted}');
  print('  Turnovers: ${stats.turnovers} | Fouls: ${stats.fouls}');
  print('  Cards: Y${stats.yellowCards} R${stats.redCards}');
  print('  Corners: ${stats.corners} | Offsides: ${stats.offsides}');
}

void _printPhaseSnapshots(Match match) {
  final snapshots = match.matchState.phaseHistory;
  if (snapshots.isEmpty) {
    print('No phase snapshots recorded.');
    return;
  }

  for (final snapshot in snapshots) {
    final initiative = snapshot.initiativeTeam?.name ?? '-';
    final possession = snapshot.possessionTeam?.name ?? '-';
    final territory = snapshot.territoryTeam?.name ?? '-';
    final zone = snapshot.zone?.name ?? '-';
    final chanceType = snapshot.chanceType?.name ?? '-';
    final chanceOutcome = snapshot.chanceOutcome?.name ?? '-';
    final xg = snapshot.chanceQuality?.toStringAsFixed(2) ?? '-';
    print(
      '[${snapshot.phaseIndex}] ${snapshot.minute}\' '
      '${snapshot.phaseType.name}/${snapshot.phaseState.name} '
      'init:$initiative pos:$possession terr:$territory '
      'zone:$zone chance:$chanceType outcome:$chanceOutcome xG:$xg',
    );
  }
}

void _printEventCards(Match match) {
  final events = match.matchState.eventCards;
  if (events.isEmpty) {
    print('No event cards recorded.');
    return;
  }

  for (var index = 0; index < events.length; index++) {
    final event = events[index];
    final zone = event.zone?.name ?? '-';
    print(
      '[${index + 1}] ${event.minute}\' ${event.title} '
      '| team:${event.teamSide.name} phase:${event.phaseType.name} '
      '| zone:$zone | major:${event.isMajor}',
    );
    print('    ${event.description}');
  }
}

void _printInsights(Match match) {
  final insights = match.matchState.tacticalInsights;
  if (insights.isEmpty) {
    print('No tactical insights generated.');
    return;
  }

  for (var index = 0; index < insights.length; index++) {
    final insight = insights[index];
    final team = insight.relatedTeam?.name ?? '-';
    print(
      '[${index + 1}] ${insight.minute}\' '
      '${insight.level.name} | team:$team | ${insight.message}',
    );
    if (insight.suggestedAction != null &&
        insight.suggestedAction!.isNotEmpty) {
      print('    Action: ${insight.suggestedAction}');
    }
  }
}

Team _buildDemoTeam({
  required int id,
  required String name,
  required String formationCode,
  required TacticalPreset preset,
}) {
  final formation = FormationFactory.byCode(formationCode);
  final players = _buildPlayersForFormation(
    teamId: id,
    teamName: name,
    formation: formation.slotDefinitions,
  );

  final captain = players.firstWhere(
    (player) => player.position == Position.centralMidfielder,
    orElse: () => players.first,
  );
  final lineup = TeamLineup.fromPlayers(
    formation: formation,
    players: players,
    captain: captain,
  );

  return Team(
    id: id,
    name: name,
    tactic: TacticalPresetFactory.create(preset, id: id),
    lineup: lineup,
    squad: players,
  );
}

List<Player> _buildPlayersForFormation({
  required int teamId,
  required String teamName,
  required List<FormationSlot> formation,
}) {
  final players = <Player>[];

  for (var index = 0; index < formation.length; index++) {
    final slot = formation[index];
    final position = slot.preferredPositions.isNotEmpty
        ? slot.preferredPositions.first
        : Position.centralMidfielder;
    players.add(
      Player(
        id: (teamId * 1000) + index + 1,
        name: '$teamName P${index + 1} ${slot.slotId}',
        dateOfBirth: DateTime(
          1994 + (index % 8),
          (index % 12) + 1,
          (index % 28) + 1,
        ),
        heightCm: _heightFor(position),
        weightKg: _weightFor(position),
        position: position,
        footedness: _footednessFor(slot, index),
        technical: _technicalFor(position),
        mental: _mentalFor(position),
        physical: _physicalFor(position),
      ),
    );
  }

  return players;
}

Footedness _footednessFor(FormationSlot slot, int index) {
  if (slot.slotId.startsWith('L')) {
    return Footedness.left;
  }
  if (slot.slotId.startsWith('R')) {
    return Footedness.right;
  }
  return index.isEven ? Footedness.right : Footedness.left;
}

double _heightFor(Position position) {
  switch (position) {
    case Position.goalKeeper:
      return 192;
    case Position.centerBack:
      return 188;
    case Position.striker:
      return 184;
    case Position.defensiveMidfielder:
      return 182;
    case Position.centralMidfielder:
    case Position.attackingMidfielder:
      return 179;
    case Position.rightBack:
    case Position.leftBack:
      return 178;
    case Position.rightWinger:
    case Position.leftWinger:
      return 176;
  }
}

double _weightFor(Position position) {
  switch (position) {
    case Position.goalKeeper:
      return 86;
    case Position.centerBack:
      return 82;
    case Position.striker:
      return 79;
    case Position.defensiveMidfielder:
      return 78;
    case Position.centralMidfielder:
    case Position.attackingMidfielder:
      return 75;
    case Position.rightBack:
    case Position.leftBack:
      return 74;
    case Position.rightWinger:
    case Position.leftWinger:
      return 71;
  }
}

Map<TechnicalAttr, int> _technicalFor(Position position) {
  switch (position) {
    case Position.goalKeeper:
      return const {
        TechnicalAttr.firstTouch: 68,
        TechnicalAttr.passing: 70,
        TechnicalAttr.technique: 69,
      };
    case Position.centerBack:
      return const {
        TechnicalAttr.passing: 72,
        TechnicalAttr.heading: 80,
        TechnicalAttr.tackling: 81,
      };
    case Position.rightBack:
    case Position.leftBack:
      return const {
        TechnicalAttr.passing: 74,
        TechnicalAttr.crossing: 76,
        TechnicalAttr.tackling: 77,
      };
    case Position.defensiveMidfielder:
      return const {
        TechnicalAttr.passing: 78,
        TechnicalAttr.tackling: 78,
        TechnicalAttr.firstTouch: 76,
      };
    case Position.centralMidfielder:
      return const {
        TechnicalAttr.passing: 81,
        TechnicalAttr.firstTouch: 79,
        TechnicalAttr.technique: 78,
      };
    case Position.attackingMidfielder:
      return const {
        TechnicalAttr.passing: 82,
        TechnicalAttr.dribbling: 80,
        TechnicalAttr.technique: 80,
      };
    case Position.rightWinger:
    case Position.leftWinger:
      return const {
        TechnicalAttr.dribbling: 82,
        TechnicalAttr.crossing: 79,
        TechnicalAttr.firstTouch: 80,
      };
    case Position.striker:
      return const {
        TechnicalAttr.finishing: 83,
        TechnicalAttr.firstTouch: 80,
        TechnicalAttr.heading: 77,
      };
  }
}

Map<MentalAttr, int> _mentalFor(Position position) {
  switch (position) {
    case Position.goalKeeper:
      return const {MentalAttr.decisions: 77, MentalAttr.composure: 76};
    case Position.centerBack:
      return const {MentalAttr.positioning: 80, MentalAttr.decisions: 78};
    case Position.rightBack:
    case Position.leftBack:
      return const {MentalAttr.workRate: 79, MentalAttr.decisions: 75};
    case Position.defensiveMidfielder:
      return const {MentalAttr.anticipation: 79, MentalAttr.decisions: 79};
    case Position.centralMidfielder:
      return const {MentalAttr.vision: 80, MentalAttr.decisions: 79};
    case Position.attackingMidfielder:
      return const {MentalAttr.vision: 82, MentalAttr.creativity: 79};
    case Position.rightWinger:
    case Position.leftWinger:
      return const {MentalAttr.creativity: 81, MentalAttr.offBall: 79};
    case Position.striker:
      return const {MentalAttr.composure: 81, MentalAttr.offBall: 82};
  }
}

Map<PhysicalAttr, int> _physicalFor(Position position) {
  switch (position) {
    case Position.goalKeeper:
      return const {PhysicalAttr.jumping: 82, PhysicalAttr.strength: 80};
    case Position.centerBack:
      return const {PhysicalAttr.strength: 82, PhysicalAttr.jumping: 81};
    case Position.rightBack:
    case Position.leftBack:
      return const {PhysicalAttr.pace: 78, PhysicalAttr.stamina: 80};
    case Position.defensiveMidfielder:
      return const {PhysicalAttr.stamina: 80, PhysicalAttr.strength: 77};
    case Position.centralMidfielder:
      return const {PhysicalAttr.stamina: 81, PhysicalAttr.balance: 77};
    case Position.attackingMidfielder:
      return const {PhysicalAttr.agility: 80, PhysicalAttr.balance: 79};
    case Position.rightWinger:
    case Position.leftWinger:
      return const {PhysicalAttr.pace: 84, PhysicalAttr.agility: 83};
    case Position.striker:
      return const {PhysicalAttr.pace: 81, PhysicalAttr.strength: 80};
  }
}

Match _simulateRegulation90(Match match) {
  var current = match;
  const safetyLimit = 600;

  for (var step = 0; step < safetyLimit; step++) {
    if (current.matchState.isFinished) {
      break;
    }

    if (current.matchState.status == MatchStatus.halfTime) {
      current = current.copyWith(
        matchState: current.matchState.copyWith(
          status: MatchStatus.secondHalf,
          currentPhaseType: MatchPhaseType.neutralPossession,
          currentPhaseState: MatchPhaseState.neutralPossession,
          currentInitiative: null,
          currentPossession: null,
          currentTerritoryControl: null,
        ),
      );
      continue;
    }

    final next = MatchEngine.advanceMicroPhase(current);
    if (next.matchState == current.matchState) {
      break;
    }
    current = next;
  }

  return current;
}
