import 'package:ts1_core/src/builders/match_dynamics_builder.dart';
import 'package:ts1_core/src/builders/matchup_state_builder.dart';
import 'package:ts1_core/src/enums/match_enums.dart';
import 'package:ts1_core/src/models/match/context/match_context.dart';
import 'package:ts1_core/src/models/match/state/match_state.dart';

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
    return _buildState(
      status: MatchStatus.firstHalf,
      currentPhaseType: MatchPhaseType.setPiece,
      currentPhaseState: MatchPhaseState.restart,
      currentInitiative: kickoffSide,
      currentPossession: kickoffSide,
      currentTerritoryControl: kickoffSide,
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
  }) {
    final matchupState = MatchupStateBuilder.fromContext(context);
    final dynamics = MatchDynamicsBuilder.fromContext(
      context,
      matchupState: matchupState,
    );

    return MatchState(
      status: status,
      currentPhaseIndex: 0,
      currentPhaseType: currentPhaseType,
      currentPhaseState: currentPhaseState,
      currentInitiative: currentInitiative,
      currentPossession: currentPossession,
      currentTerritoryControl: currentTerritoryControl,
      matchupState: matchupState,
      dynamics: dynamics,
    );
  }
}
