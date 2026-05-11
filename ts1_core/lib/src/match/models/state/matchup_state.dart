import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup_state.freezed.dart';
part 'matchup_state.g.dart';

/// Runtime tactical matchup matrix used by the simulation loop.
///
/// All edges are normalized in range [-1.0, +1.0] from home perspective:
/// - negative means away-side advantage
/// - positive means home-side advantage
///
/// Contains detailed tactical matchup dimensions derived from both teams'
/// MatchupProfile instances, allowing granular access to all tactical facets.
@freezed
abstract class MatchupState with _$MatchupState {
  const factory MatchupState({
    required int id,

    // ==================== POSSESSION and BUILD-UP ====================
    @Default(0.0) double buildupEdge,
    @Default(0.0) double pressingEdge,
    @Default(0.0) double counterpressingEdge,

    // ==================== SPACE CONTROL ====================
    @Default(0.0) double compactnessEdge,
    @Default(0.0) double defensiveLineEdge,

    // ==================== ROUTE and CHANCE CREATION ====================
    @Default(0.0) double wideEdge,
    @Default(0.0) double centralEdge,
    @Default(0.0) double fullbackEdge,

    // ==================== FINAL THIRD and SHOOTING ====================
    @Default(0.0) double finalThirdEdge,
    @Default(0.0) double shootingRiskEdge,

    // ==================== TRANSITIONS ====================
    @Default(0.0) double transitionOutEdge,
    @Default(0.0) double transitionInEdge,

    // ==================== SET PIECES and AERIAL ====================
    @Default(0.0) double aerialEdge,
    @Default(0.0) double setpieceDefenseEdge,

    // ==================== TEMPO and FATIGUE ====================
    @Default(0.0) double tempoEdge,

    // ==================== KEY PLAYER INFLUENCE ====================
    @Default(0.0) double playmakerEdge,
    @Default(0.0) double strikerSupportEdge,
  }) = _MatchupState;

  factory MatchupState.fromJson(Map<String, dynamic> json) =>
      _$MatchupStateFromJson(json);
}
