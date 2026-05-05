import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/match/models/dynamics/match_dynamics.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';
import 'package:ts1_core/src/match/models/events/match_event_card.dart';
import 'package:ts1_core/src/match/models/insights/tactical_insight.dart';
import 'package:ts1_core/src/match/models/interventions/manager_intervention.dart';
import 'package:ts1_core/src/match/models/interventions/substitution_record.dart';
import 'package:ts1_core/src/match/models/phase/phase_resolution_snapshot.dart';
import 'package:ts1_core/src/match/models/state/matchup_state.dart';
import 'package:ts1_core/src/match/models/stats/team_match_stats.dart';
import 'package:ts1_core/src/match/models/state/clock/match_clock.dart';
import 'package:ts1_core/src/match/models/state/scoreline/scoreline.dart';
import 'package:ts1_core/src/match/models/state/scoreline/shootout_score.dart';

part 'match_state.freezed.dart';
part 'match_state.g.dart';

/// Represents the mutable, evolving state of a match.
/// Changes after each phase execution.
/// MatchState is separate from Match (the identity/entity).
@freezed
abstract class MatchState with _$MatchState {
  const factory MatchState({
    required int id,

    // ==================== MATCH FLOW SYSTEM ====================
    @Default(MatchStatus.scheduled) MatchStatus status,
    @Default(MatchClock(id: 0)) MatchClock clock,
    @Default(0) int currentPhaseIndex,
    @Default(MatchPhaseType.neutralPossession) MatchPhaseType currentPhaseType,

    // ==================== SCORE and RESULT SYSTEM ====================
    @Default(Scoreline(id: 0)) Scoreline scoreline,
    @Default(ShootoutScore(id: 0)) ShootoutScore shootoutScore,

    // ==================== TACTICAL FLOW SYSTEM ====================
    TeamSide? currentInitiative,
    TeamSide? currentPossession,
    TeamSide? currentTerritoryControl,

    // ==================== TEAM PERFORMANCE SYSTEM ====================
    @Default(TeamMatchStats(id: 0)) TeamMatchStats homeStats,
    @Default(TeamMatchStats(id: 0)) TeamMatchStats awayStats,

    // ==================== POSITIONAL / DYNAMICS SYSTEM ====================
    required MatchDynamics dynamics,

    // ==================== MATCHUP ADVANTAGE SYSTEM ====================
    required MatchupState matchupState,

    // ==================== PHASE HISTORY SYSTEM ====================
    @Default(<PhaseResolutionSnapshot>[])
    List<PhaseResolutionSnapshot> phaseHistory,

    // ==================== EVENT SYSTEM ====================
    @Default(<MatchEventCard>[]) List<MatchEventCard> eventCards,

    // ==================== TACTICAL INTELLIGENCE SYSTEM ====================
    @Default(<TacticalInsight>[]) List<TacticalInsight> tacticalInsights,

    // ==================== INTERVENTION SYSTEM ====================
    @Default(<SubstitutionRecord>[]) List<SubstitutionRecord> substitutions,
    @Default(<ManagerIntervention>[]) List<ManagerIntervention> interventions,
  }) = _MatchState;

  factory MatchState.fromJson(Map<String, dynamic> json) =>
      _$MatchStateFromJson(json);

  const MatchState._();

  bool get isFinished => status.isTerminal;

  TeamMatchStats statsFor(TeamSide side) {
    return side == TeamSide.home ? homeStats : awayStats;
  }

  MatchState beginPhase(MatchPhaseType type) {
    return copyWith(currentPhaseType: type);
  }

  MatchState applyPhaseSnapshot(PhaseResolutionSnapshot snapshot) {
    var next = copyWith(
      currentPhaseIndex: snapshot.phaseIndex,
      currentPhaseType: snapshot.phaseType,
      currentInitiative: snapshot.initiativeTeam,
      currentPossession: snapshot.possessionTeam,
      currentTerritoryControl: snapshot.territoryTeam,
      phaseHistory: [...phaseHistory, snapshot],
    );

    if (snapshot.chanceType != null) {
      final attackingSide =
          snapshot.possessionTeam ?? snapshot.initiativeTeam ?? TeamSide.home;
      if (attackingSide == TeamSide.home) {
        next = next.copyWith(
          homeStats: next.homeStats.addChance(
            xg: snapshot.chanceQuality ?? 0.0,
          ),
        );
      } else {
        next = next.copyWith(
          awayStats: next.awayStats.addChance(
            xg: snapshot.chanceQuality ?? 0.0,
          ),
        );
      }
    }

    if (snapshot.chanceOutcome == ChanceOutcome.goal &&
        snapshot.possessionTeam != null) {
      next = next.scoreGoal(snapshot.possessionTeam!);
    }

    if (snapshot.chanceOutcome == ChanceOutcome.save &&
        snapshot.possessionTeam != null) {
      if (snapshot.possessionTeam == TeamSide.home) {
        next = next.copyWith(homeStats: next.homeStats.addShot(onTarget: true));
      } else {
        next = next.copyWith(awayStats: next.awayStats.addShot(onTarget: true));
      }
    }

    return next;
  }

  MatchState scoreGoal(TeamSide side) {
    final nextScoreline = scoreline.scoreGoal(side);
    final nextDynamics = dynamics.swingMomentum(side, 0.2);

    if (side == TeamSide.home) {
      return copyWith(
        scoreline: nextScoreline,
        homeStats: homeStats.addShot(onTarget: true),
        dynamics: nextDynamics,
      );
    }

    return copyWith(
      scoreline: nextScoreline,
      awayStats: awayStats.addShot(onTarget: true),
      dynamics: nextDynamics,
    );
  }

  MatchState scorePenalty(TeamSide side) {
    return copyWith(shootoutScore: shootoutScore.scorePenalty(side));
  }

  MatchState registerShot(
    TeamSide side, {
    bool onTarget = false,
    double xg = 0.0,
  }) {
    if (side == TeamSide.home) {
      return copyWith(
        homeStats: homeStats.addShot(onTarget: onTarget, xg: xg),
      );
    }

    return copyWith(
      awayStats: awayStats.addShot(onTarget: onTarget, xg: xg),
    );
  }

  MatchState registerEventCard(MatchEventCard card) {
    return copyWith(eventCards: [...eventCards, card]);
  }

  MatchState registerInsight(TacticalInsight insight) {
    return copyWith(tacticalInsights: [...tacticalInsights, insight]);
  }

  MatchState applyManagerCommand(
    TeamSide side,
    MatchCommandType command, {
    String? note,
    int durationMinutes = 8,
  }) {
    final expiresAt =
        clock.minute + (durationMinutes > 0 ? durationMinutes : 1);
    return copyWith(
      interventions: [
        ...interventions,
        ManagerIntervention(
          id: interventions.length + 1,
          minute: clock.minute,
          teamSide: side,
          command: command,
          note: note,
          expiresAtMinute: expiresAt,
        ),
      ],
    );
  }

  MatchState registerSubstitution(
    TeamSide side, {
    required int playerOutId,
    required int playerInId,
    required SubstitutionType type,
    String? reason,
  }) {
    return copyWith(
      substitutions: [
        ...substitutions,
        SubstitutionRecord(
          id: substitutions.length + 1,
          minute: clock.minute,
          teamSide: side,
          playerOutId: playerOutId,
          playerInId: playerInId,
          type: type,
          reason: reason,
        ),
      ],
    );
  }

  MatchState advanceClockOnePhase(
    int microPhaseSeconds, {
    int regulationMinutes = 90,
    int extraTimeMinutesPerHalf = 15,
    bool allowExtraTime = false,
    bool allowPenalties = false,
  }) {
    if (isFinished) {
      return this;
    }

    if (microPhaseSeconds <= 0) {
      return this;
    }

    // These states do not progress the running match clock.
    if (status == MatchStatus.scheduled ||
        status == MatchStatus.postponed ||
        status == MatchStatus.ready ||
        status == MatchStatus.halfTime ||
        status == MatchStatus.extraTimeHalfTime ||
        status == MatchStatus.paused ||
        status == MatchStatus.suspended ||
        status == MatchStatus.penalties) {
      return this;
    }

    final nextClock = clock
        .addSeconds(microPhaseSeconds)
        .withExtraTimeCounters(
          regulationMinutes: regulationMinutes,
          extraTimeMinutesPerHalf: extraTimeMinutesPerHalf,
        );
    var next = copyWith(clock: nextClock);

    MatchState applyTransitionStatus(
      MatchState state,
      MatchStatus nextStatus, {
      required String title,
      required String description,
    }) {
      final transitionPhaseIndex = state.currentPhaseIndex + 1;
      const transitionPhaseType = MatchPhaseType.intervention;
      final eventSide =
          state.currentPossession ?? state.currentInitiative ?? TeamSide.home;

      final snapshot = PhaseResolutionSnapshot(
        id: transitionPhaseIndex,
        phaseIndex: transitionPhaseIndex,
        minute: state.clock.minute,
        phaseType: transitionPhaseType,
        initiativeTeam: state.currentInitiative,
        possessionTeam: state.currentPossession,
        territoryTeam: state.currentTerritoryControl,
        isImportant: true,
      );

      final event = MatchEventCard(
        id: transitionPhaseIndex,
        minute: state.clock.minute,
        title: title,
        description: description,
        phaseType: transitionPhaseType,
        teamSide: eventSide,
        isMajor: true,
        tacticalInsight: 'Status changed to ${nextStatus.name}.',
      );

      return state.copyWith(
        status: nextStatus,
        currentPhaseIndex: transitionPhaseIndex,
        currentPhaseType: transitionPhaseType,
        phaseHistory: [...state.phaseHistory, snapshot],
        eventCards: [...state.eventCards, event],
      );
    }

    final firstHalfEndMinute = regulationMinutes ~/ 2;
    final regulationEndMinute = regulationMinutes;
    final extraTimeHalfEndMinute = regulationMinutes + extraTimeMinutesPerHalf;
    final extraTimeEndMinute =
        regulationMinutes + (extraTimeMinutesPerHalf * 2);

    if (next.status == MatchStatus.firstHalf &&
        next.clock.hasReachedMinute(firstHalfEndMinute)) {
      return applyTransitionStatus(
        next,
        MatchStatus.halfTime,
        title: 'Half Time',
        description: 'The first half ends and teams head to the dressing room.',
      );
    }

    if (next.status == MatchStatus.secondHalf &&
        next.clock.hasReachedMinute(regulationEndMinute)) {
      if (allowExtraTime && next.scoreline.isLevel) {
        return applyTransitionStatus(
          next,
          MatchStatus.extraTime,
          title: 'Extra Time Starts',
          description: 'Regulation ends level; match proceeds to extra time.',
        );
      }
      if (allowPenalties && next.scoreline.isLevel) {
        return applyTransitionStatus(
          next,
          MatchStatus.penalties,
          title: 'Penalty Shootout',
          description:
              'Regulation ends level; penalties will decide the match.',
        );
      }
      return applyTransitionStatus(
        next,
        MatchStatus.fullTime,
        title: 'Full Time',
        description: 'Regulation time ends and the match is complete.',
      );
    }

    if (next.status == MatchStatus.extraTime &&
        next.clock.hasReachedMinute(extraTimeHalfEndMinute) &&
        next.clock.extraTimeSecondHalf == 0) {
      return applyTransitionStatus(
        next,
        MatchStatus.extraTimeHalfTime,
        title: 'Extra Time Half Time',
        description: 'The first extra-time period ends.',
      );
    }

    if (next.status == MatchStatus.extraTime &&
        next.clock.hasReachedMinute(extraTimeEndMinute)) {
      if (allowPenalties && next.scoreline.isLevel) {
        return applyTransitionStatus(
          next,
          MatchStatus.penalties,
          title: 'Penalty Shootout',
          description:
              'Extra time ends level; penalties will decide the match.',
        );
      }
      return applyTransitionStatus(
        next,
        MatchStatus.fullTime,
        title: 'Full Time',
        description: 'Extra time ends and the match is complete.',
      );
    }

    return next;
  }

  MatchState updateZoneDominance(TeamSide side, PitchZone zone, double delta) {
    return copyWith(dynamics: dynamics.updateZoneDominance(side, zone, delta));
  }

  MatchState applyFatigueTick(double homePressBias, double awayPressBias) {
    final homeBase = 0.005 + (homePressBias * 0.004);
    final awayBase = 0.005 + (awayPressBias * 0.004);
    return copyWith(
      dynamics: dynamics
          .increaseFatigue(TeamSide.home, homeBase)
          .increaseFatigue(TeamSide.away, awayBase),
    );
  }

  MatchState applyPossessionSplit(double homeShare) {
    final normalized = homeShare.clamp(0.0, 1.0);
    return copyWith(
      homeStats: homeStats.copyWith(possession: normalized * 100),
      awayStats: awayStats.copyWith(possession: (1 - normalized) * 100),
    );
  }

  MatchState updateMatchupState({
    double? homeAttackVsAwayDefense,
    double? awayAttackVsHomeDefense,
    double? midfieldControlEdge,
    double? transitionControlEdge,
    double? wingControlEdge,
    double? setPieceControlEdge,
  }) {
    return copyWith(
      matchupState: matchupState.copyWith(
        homeAttackVsAwayDefense:
            homeAttackVsAwayDefense ?? matchupState.homeAttackVsAwayDefense,
        awayAttackVsHomeDefense:
            awayAttackVsHomeDefense ?? matchupState.awayAttackVsHomeDefense,
        midfieldControlEdge:
            midfieldControlEdge ?? matchupState.midfieldControlEdge,
        transitionControlEdge:
            transitionControlEdge ?? matchupState.transitionControlEdge,
        wingControlEdge: wingControlEdge ?? matchupState.wingControlEdge,
        setPieceControlEdge:
            setPieceControlEdge ?? matchupState.setPieceControlEdge,
      ),
    );
  }

  String summary(String homeTeamName, String awayTeamName) {
    final header =
        '$homeTeamName ${scoreline.home} - ${scoreline.away} $awayTeamName';
    final pens = shootoutScore.hasShootout
        ? ' | Pens: ${shootoutScore.home}-${shootoutScore.away}'
        : '';
    final statusLabel = 'Status: $status | Clock: ${clock.toString()}';
    final phaseLabel = 'Phase #$currentPhaseIndex: $currentPhaseType';
    final meta =
        'Events: ${eventCards.length}, Insights: ${tacticalInsights.length}, Subs: ${substitutions.length}';
    return '$header$pens\n$statusLabel\n$phaseLabel\n$meta';
  }
}
