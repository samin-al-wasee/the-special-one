import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/match/match_enums.dart';
import 'package:ts1_core/src/models/match/context/match_context.dart';
import 'package:ts1_core/src/models/match/state/match_state.dart';
import 'package:ts1_core/src/models/team/team.dart';

part 'match.freezed.dart';
part 'match.g.dart';

/// Match is an immutable entity representing a football match.
/// Contains fixed attributes (teams/metadata) and a [MatchContext]
/// that stores tactical, strength, structural, and matchup profile data.
@freezed
abstract class Match with _$Match {
  const factory Match({
    required int id,
    required Team homeTeam,
    required Team awayTeam,
    required DateTime kickoffAt,
    required MatchContext context,
    required MatchState matchState,
    @Default('Unknown') String venue,
    @Default('Unknown') String weather,
    @Default(90) int totalRegulationMinutes,
    @Default(30) int microPhaseSeconds,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  const Match._();

  int get expectedMicroPhases {
    final phaseSeconds = math.max(1, microPhaseSeconds);
    return ((totalRegulationMinutes * 60) / phaseSeconds).round();
  }

  Team teamFor(TeamSide side) => side == TeamSide.home ? homeTeam : awayTeam;

  TeamSide opponentOf(TeamSide side) {
    return side == TeamSide.home ? TeamSide.away : TeamSide.home;
  }

  /// Get fatigue adjustment for a team based on tactical identity
  double getFatigueBase(TeamSide side) {
    final identity = side == TeamSide.home
        ? context.homeTacticalIdentity
        : context.awayTacticalIdentity;
    return 0.005 + (identity.pressIntensityBias * 0.004);
  }
}
