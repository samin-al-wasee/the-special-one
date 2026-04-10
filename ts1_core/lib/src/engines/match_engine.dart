import 'package:ts1_core/src/enums/match/match_enums.dart';
import 'package:ts1_core/src/models/match/attack/attack_state.dart';
import 'package:ts1_core/src/models/match/context/match_context.dart';
import 'package:ts1_core/src/models/match/match.dart';
import 'package:ts1_core/src/models/match/matchup_profile/matchup_profile.dart';
import 'package:ts1_core/src/models/match/phase/phase_resolution_snapshot.dart';
import 'package:ts1_core/src/models/match/state/clock/match_clock.dart';
import 'package:ts1_core/src/models/match/state/match_state.dart';
import 'package:ts1_core/src/models/match/state/matchup_state.dart';
import 'package:ts1_core/src/models/match/state/scoreline/scoreline.dart';

/// Small orchestration façade for match simulation.
///
/// The engine is intentionally stateless. Use [MatchEngine.shared] for the
/// default configuration or create a new instance when the period rules differ
/// between competitions.
class MatchEngine {
  const MatchEngine({
    this.regulationMinutes = 90,
    this.extraTimeMinutesPerHalf = 15,
    this.defaultMicroPhaseSeconds = 30,
    this.allowExtraTime = false,
    this.allowPenalties = false,
  });

  static const MatchEngine shared = MatchEngine();

  final int regulationMinutes;
  final int extraTimeMinutesPerHalf;
  final int defaultMicroPhaseSeconds;
  final bool allowExtraTime;
  final bool allowPenalties;

  Match bootstrapMatch(Match match, {TeamSide kickoffSide = TeamSide.home}) {
    return match.copyWith(
      matchState: bootstrapState(match, kickoffSide: kickoffSide),
    );
  }

  Match kickoffMatch(Match match, {TeamSide kickoffSide = TeamSide.home}) {
    final bootstrapped = bootstrapMatch(match, kickoffSide: kickoffSide);
    return bootstrapped.copyWith(
      matchState: bootstrapped.matchState.copyWith(
        status: MatchStatus.firstHalf,
      ),
    );
  }

  MatchState bootstrapState(
    Match match, {
    TeamSide kickoffSide = TeamSide.home,
  }) {
    return MatchState(
      status: MatchStatus.ready,
      clock: const MatchClock(),
      currentPhaseIndex: 0,
      currentPhaseType: MatchPhaseType.neutralPossession,
      currentPhaseState: MatchPhaseState.neutralPossession,
      currentInitiative: kickoffSide,
      currentPossession: kickoffSide,
      currentTerritoryControl: kickoffSide,
      scoreline: const Scoreline(),
      matchupState: buildMatchupState(match.context),
    );
  }

  MatchState advancePhaseClock(
    MatchState state, {
    int? microPhaseSeconds,
    bool? allowExtraTime,
    bool? allowPenalties,
  }) {
    return state.advanceClockOnePhase(
      microPhaseSeconds ?? defaultMicroPhaseSeconds,
      regulationMinutes: regulationMinutes,
      extraTimeMinutesPerHalf: extraTimeMinutesPerHalf,
      allowExtraTime: allowExtraTime ?? this.allowExtraTime,
      allowPenalties: allowPenalties ?? this.allowPenalties,
    );
  }

  Match resolvePhase(
    Match match,
    PhaseResolutionSnapshot snapshot, {
    int? microPhaseSeconds,
    bool? allowExtraTime,
    bool? allowPenalties,
  }) {
    final nextState = advancePhaseClock(
      match.matchState,
      microPhaseSeconds: microPhaseSeconds,
      allowExtraTime: allowExtraTime,
      allowPenalties: allowPenalties,
    ).applyPhaseSnapshot(snapshot);

    return match.copyWith(matchState: nextState);
  }

  PhaseResolutionSnapshot buildSnapshot({
    required MatchState state,
    int? phaseIndex,
    required MatchPhaseType phaseType,
    required MatchPhaseState phaseState,
    TeamSide? initiativeTeam,
    TeamSide? possessionTeam,
    TeamSide? territoryTeam,
    AttackState? attackState,
    ChanceType? chanceType,
    ChanceOutcome? chanceOutcome,
    double? chanceQuality,
    PitchZone? zone,
    bool isImportant = false,
  }) {
    return PhaseResolutionSnapshot(
      phaseIndex: phaseIndex ?? (state.currentPhaseIndex + 1),
      minute: state.clock.minute,
      phaseType: phaseType,
      phaseState: phaseState,
      initiativeTeam: initiativeTeam,
      possessionTeam: possessionTeam,
      territoryTeam: territoryTeam,
      attackState: attackState,
      chanceType: chanceType,
      chanceOutcome: chanceOutcome,
      chanceQuality: chanceQuality,
      zone: zone,
      isImportant: isImportant,
    );
  }

  MatchupState buildMatchupState(MatchContext context) {
    final homeProfile = context.homeToAwayMatchupProfile;
    final awayProfile = context.awayToHomeMatchupProfile;

    return MatchupState(
      homeAttackVsAwayDefense: _clampEdge(_attackEdge(homeProfile)),
      awayAttackVsHomeDefense: _clampEdge(-_attackEdge(awayProfile)),
      midfieldControlEdge: _clampEdge(
        _midfieldEdge(homeProfile) - _midfieldEdge(awayProfile),
      ),
      transitionControlEdge: _clampEdge(
        _transitionEdge(homeProfile) - _transitionEdge(awayProfile),
      ),
      wingControlEdge: _clampEdge(
        _wingEdge(homeProfile) - _wingEdge(awayProfile),
      ),
      setPieceControlEdge: _clampEdge(
        _setPieceEdge(homeProfile) - _setPieceEdge(awayProfile),
      ),
    );
  }

  MatchState refreshMatchupState(MatchState state, MatchContext context) {
    return state.copyWith(matchupState: buildMatchupState(context));
  }

  double _attackEdge(MatchupProfile profile) {
    return _average([
      profile.buildupEdge,
      profile.pressingEdge,
      profile.counterpressingEdge,
      profile.finalThirdEdge,
      profile.wideEdge,
      profile.centralEdge,
      profile.fullbackEdge,
      profile.strikerSupportEdge,
      profile.playmakerEdge,
    ]);
  }

  double _midfieldEdge(MatchupProfile profile) {
    return _average([
      profile.compactnessEdge,
      profile.defensiveLineEdge,
      profile.tempoEdge,
      profile.playmakerEdge,
    ]);
  }

  double _transitionEdge(MatchupProfile profile) {
    return _average([
      profile.transitionOutEdge,
      -profile.transitionInEdge,
      profile.shootingRiskEdge,
    ]);
  }

  double _wingEdge(MatchupProfile profile) {
    return _average([profile.wideEdge, profile.fullbackEdge]);
  }

  double _setPieceEdge(MatchupProfile profile) {
    return _average([profile.aerialEdge, -profile.setpieceDefenseEdge]);
  }

  double _average(List<double> values) {
    if (values.isEmpty) {
      return 0.0;
    }

    return values.reduce((sum, value) => sum + value) / values.length;
  }

  double _clampEdge(double value) {
    return value.clamp(-1.0, 1.0).toDouble();
  }
}
