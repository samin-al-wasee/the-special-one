import 'package:ts1_core/src/match/builders/match_dynamics_builder.dart';
import 'package:ts1_core/src/match/builders/matchup_state_builder.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';
import 'package:ts1_core/src/match/models/context/match_context.dart';
import 'package:ts1_core/src/match/models/events/match_event_card.dart';
import 'package:ts1_core/src/match/models/phase/phase_resolution_snapshot.dart';
import 'package:ts1_core/src/match/models/state/match_state.dart';

/// Factory for initializing [MatchState] in specific lifecycle scenarios.
class MatchStateFactory {
  const MatchStateFactory._();

  static MatchState preMatch({required MatchContext context}) {
    return _buildState(
      status: MatchStatus.scheduled,
      currentPhaseType: MatchPhaseType.neutralPossession,
      currentInitiative: null,
      currentPossession: null,
      currentTerritoryControl: null,
      context: context,
    );
  }

  static MatchState kickoff({
    required MatchContext context,
    TeamSide kickoffSide = TeamSide.home,
  }) {
    final initialSnapshot = PhaseResolutionSnapshot(
      id: 0,
      phaseIndex: 0,
      minute: 0,
      phaseType: MatchPhaseType.restart,
      initiativeTeam: kickoffSide,
      possessionTeam: kickoffSide,
      territoryTeam: kickoffSide,
    );

    final kickoffEvent = MatchEventCard(
      id: 0,
      minute: 0,
      title: 'Kickoff',
      description: 'The match starts with ${kickoffSide.name} in possession.',
      phaseType: MatchPhaseType.restart,
      teamSide: kickoffSide,
      isMajor: true,
    );

    return _buildState(
      status: MatchStatus.firstHalf,
      currentPhaseType: MatchPhaseType.restart,
      currentInitiative: kickoffSide,
      currentPossession: kickoffSide,
      currentTerritoryControl: kickoffSide,
      initialPhaseSnapshot: initialSnapshot,
      initialEventCard: kickoffEvent,
      context: context,
    );
  }

  static MatchState secondHalfKickoff(
    MatchState halfTimeMatchState, {
    TeamSide kickoffSide = TeamSide.away,
  }) {
    final nextPhaseIndex = halfTimeMatchState.currentPhaseIndex + 1;
    final minute = halfTimeMatchState.clock.minute;

    final kickoffSnapshot = PhaseResolutionSnapshot(
      id: nextPhaseIndex,
      phaseIndex: nextPhaseIndex,
      minute: minute,
      phaseType: MatchPhaseType.restart,
      initiativeTeam: kickoffSide,
      possessionTeam: kickoffSide,
      territoryTeam: kickoffSide,
      isImportant: true,
    );

    final kickoffEvent = MatchEventCard(
      id: nextPhaseIndex,
      minute: minute,
      title: 'Second Half Kickoff',
      description:
          'The second half starts with ${kickoffSide.name} in possession.',
      phaseType: MatchPhaseType.restart,
      teamSide: kickoffSide,
      isMajor: true,
    );

    return halfTimeMatchState.copyWith(
      status: MatchStatus.secondHalf,
      currentPhaseIndex: nextPhaseIndex,
      currentPhaseType: MatchPhaseType.restart,
      currentInitiative: kickoffSide,
      currentPossession: kickoffSide,
      currentTerritoryControl: kickoffSide,
      phaseHistory: [...halfTimeMatchState.phaseHistory, kickoffSnapshot],
      eventCards: [...halfTimeMatchState.eventCards, kickoffEvent],
    );
  }

  static MatchState _buildState({
    required MatchStatus status,
    required MatchPhaseType currentPhaseType,
    required TeamSide? currentInitiative,
    required TeamSide? currentPossession,
    required TeamSide? currentTerritoryControl,
    required MatchContext context,
    PhaseResolutionSnapshot? initialPhaseSnapshot,
    MatchEventCard? initialEventCard,
  }) {
    final matchupState = MatchupStateBuilder.fromContext(context);
    final dynamics = MatchDynamicsBuilder.fromContext(
      context,
      matchupState: matchupState,
    );

    final phaseHistory = initialPhaseSnapshot != null
        ? [initialPhaseSnapshot]
        : <PhaseResolutionSnapshot>[];
    final eventCards = initialEventCard != null
        ? [initialEventCard]
        : <MatchEventCard>[];

    return MatchState(
      id: context.id,
      status: status,
      currentPhaseIndex: 0,
      currentPhaseType: currentPhaseType,
      currentInitiative: currentInitiative,
      currentPossession: currentPossession,
      currentTerritoryControl: currentTerritoryControl,
      matchupState: matchupState,
      dynamics: dynamics,
      phaseHistory: phaseHistory,
      eventCards: eventCards,
    );
  }
}
