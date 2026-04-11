import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup_state.freezed.dart';
part 'matchup_state.g.dart';

/// Runtime tactical matchup matrix used by the simulation loop.
///
/// All edges are normalized in range [-1.0, +1.0]:
/// - negative means away-side advantage
/// - positive means home-side advantage
@freezed
abstract class MatchupState with _$MatchupState {
  const factory MatchupState({
    required int id,
    // Attack vs defense interaction per direction.
    @Default(0.0) double homeAttackVsAwayDefense,
    @Default(0.0) double awayAttackVsHomeDefense,

    // Midfield and territorial control.
    @Default(0.0) double midfieldControlEdge,

    // Transition and route control.
    @Default(0.0) double transitionControlEdge,
    @Default(0.0) double wingControlEdge,

    // Set-piece confrontation outcome edge.
    @Default(0.0) double setPieceControlEdge,
  }) = _MatchupState;

  factory MatchupState.fromJson(Map<String, dynamic> json) =>
      _$MatchupStateFromJson(json);
}
