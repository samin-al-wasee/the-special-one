import 'package:ts1_core/src/builders/match_dynamics_builder.dart';
import 'package:ts1_core/src/builders/matchup_state_builder.dart';
import 'package:ts1_core/src/enums/match/match_enums.dart';
import 'package:ts1_core/src/models/match/context/match_context.dart';
import 'package:ts1_core/src/models/match/state/match_state.dart';

/// Factory for initializing [MatchState] in specific lifecycle scenarios.
class MatchStateFactory {
  const MatchStateFactory._();

  static MatchState preMatch({MatchContext context = const MatchContext()}) {
    final matchupState = MatchupStateBuilder.fromContext(context);
    final dynamics = MatchDynamicsBuilder.fromContext(
      context,
      matchupState: matchupState,
    );

    return MatchState(
      status: MatchStatus.scheduled,
      currentPhaseIndex: 0,
      currentPhaseType: MatchPhaseType.neutralPossession,
      currentPhaseState: MatchPhaseState.neutralPossession,
      currentInitiative: null,
      currentPossession: null,
      currentTerritoryControl: null,
      matchupState: matchupState,
      dynamics: dynamics,
    );
  }

  static MatchState kickoff({
    MatchContext context = const MatchContext(),
    TeamSide kickoffSide = TeamSide.home,
  }) {
    final matchupState = MatchupStateBuilder.fromContext(context);
    final dynamics = MatchDynamicsBuilder.fromContext(
      context,
      matchupState: matchupState,
    );

    return MatchState(
      status: MatchStatus.firstHalf,
      currentPhaseIndex: 0,
      currentPhaseType: MatchPhaseType.neutralPossession,
      currentPhaseState: MatchPhaseState.neutralPossession,
      currentInitiative: kickoffSide,
      currentPossession: kickoffSide,
      currentTerritoryControl: kickoffSide,
      matchupState: matchupState,
      dynamics: dynamics,
    );
  }
}
