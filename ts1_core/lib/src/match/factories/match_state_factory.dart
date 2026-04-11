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
      currentPhaseState: MatchPhaseState.neutralPossession,
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
      phaseType: MatchPhaseType.setPiece,
      phaseState: MatchPhaseState.restart,
      initiativeTeam: kickoffSide,
      possessionTeam: kickoffSide,
      territoryTeam: kickoffSide,
    );

    final kickoffEvent = MatchEventCard(
      id: 0,
      minute: 0,
      title: 'Kickoff',
      description: 'The match starts with ${kickoffSide.name} in possession.',
      phaseType: MatchPhaseType.setPiece,
      teamSide: kickoffSide,
      isMajor: true,
    );

    return _buildState(
      status: MatchStatus.firstHalf,
      currentPhaseType: MatchPhaseType.setPiece,
      currentPhaseState: MatchPhaseState.restart,
      currentInitiative: kickoffSide,
      currentPossession: kickoffSide,
      currentTerritoryControl: kickoffSide,
      initialPhaseSnapshot: initialSnapshot,
      initialEventCard: kickoffEvent,
      context: context,
    );
  }

  static MatchState _buildState({
    required MatchStatus status,
    required MatchPhaseType currentPhaseType,
    required MatchPhaseState currentPhaseState,
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
      currentPhaseState: currentPhaseState,
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
