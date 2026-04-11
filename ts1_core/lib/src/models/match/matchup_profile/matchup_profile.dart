import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchup_profile.freezed.dart';
part 'matchup_profile.g.dart';

@freezed
abstract class MatchupProfile with _$MatchupProfile {
  /// Layer 3 - Matchup Layer output.
  ///
  /// Captures detailed tactical matchup between two teams.
  /// Edges are expressed from Team A perspective:
  /// -1.0 = strong advantage Team B
  ///  0.0 = neutral
  /// +1.0 = strong advantage Team A
  ///
  /// Based on SPEC tactical dimensions:
  /// - Build-up Style and Pressing
  /// - Space Control and Compactness
  /// - Tempo and Rhythm
  /// - Final Third Actions and Risk
  /// - Transitions and Counter-Actions
  /// - Set Pieces and Aerial
  /// - Wing vs Central Routes
  /// - Fullback vs Winger Duel
  const factory MatchupProfile({
    required int id,

    // ==================== POSSESSION and BUILD-UP ====================
    // How A's build-up style matches against B's press resistance
    required double buildupEdge,

    // How effective A's pressing is vs B's build-up structure
    required double pressingEdge,

    // Counterpressing (when possession lost)
    required double counterpressingEdge,

    // ==================== SPACE CONTROL ====================
    // Compactness matchup: A's compactness vs B's ability to penetrate
    required double compactnessEdge,

    // Defensive line height matchup: A's line vs B's offside trap vulnerability
    required double defensiveLineEdge,

    // ==================== ROUTE and CHANCE CREATION ====================
    // Flank/wing progression: A's width strategy vs B's flank coverage
    required double wideEdge,

    // Central control and through-ball effectiveness
    required double centralEdge,

    // Fullback vs Winger duel (wing battleground)
    required double fullbackEdge,

    // ==================== FINAL THIRD and SHOOTING ====================
    // How teams finish: A's final third approach vs B's defensive positioning
    required double finalThirdEdge,

    // Shot quality influenced by risk tolerance
    required double shootingRiskEdge,

    // ==================== TRANSITIONS ====================
    // Transition speed when possession won
    required double transitionOutEdge,

    // Transition vulnerability when possession lost
    required double transitionInEdge,

    // ==================== SET PIECES and AERIAL ====================
    // Aerial duels and set-piece effectiveness
    required double aerialEdge,

    // Defensive set-piece vulnerability
    required double setpieceDefenseEdge,

    // ==================== TEMPO and FATIGUE ====================
    // Tempo compatibility: high pace vs controlled play
    required double tempoEdge,

    // ==================== KEY PLAYER INFLUENCE ====================
    // Playmaker presence and impact zones
    required double playmakerEdge,

    // Striker effectiveness and support quality
    required double strikerSupportEdge,
  }) = _MatchupProfile;

  const MatchupProfile._();

  factory MatchupProfile.fromJson(Map<String, dynamic> json) =>
      _$MatchupProfileFromJson(json);

  /// Generate a human-readable matchup summary.
  String summary() {
    String fmt(double value) =>
        value >= 0 ? '+${value.toStringAsFixed(2)}' : value.toStringAsFixed(2);

    return '''=== POSSESSION and BUILD-UP ===
Buildup Edge: ${fmt(buildupEdge)}
Pressing Edge: ${fmt(pressingEdge)}
Counterpressing Edge: ${fmt(counterpressingEdge)}

=== SPACE CONTROL ===
Compactness Edge: ${fmt(compactnessEdge)}
Defensive Line Edge: ${fmt(defensiveLineEdge)}

=== ROUTE and CREATION ===
Wide Edge: ${fmt(wideEdge)}
Central Edge: ${fmt(centralEdge)}
Fullback Edge: ${fmt(fullbackEdge)}

=== FINAL THIRD and SHOOTING ===
Final Third Edge: ${fmt(finalThirdEdge)}
Shooting Risk Edge: ${fmt(shootingRiskEdge)}

=== TRANSITIONS ===
Transition Out Edge: ${fmt(transitionOutEdge)}
Transition In Edge: ${fmt(transitionInEdge)}

=== SET PIECES and AERIAL ===
Aerial Edge: ${fmt(aerialEdge)}
Set-Piece Defense Edge: ${fmt(setpieceDefenseEdge)}

=== TEMPO and FATIGUE ===
Tempo Edge: ${fmt(tempoEdge)}

=== KEY PLAYERS ===
Playmaker Edge: ${fmt(playmakerEdge)}
Striker Support Edge: ${fmt(strikerSupportEdge)}''';
  }
}
