import 'dart:math' as math;

import 'package:ts1_core/src/match/builders/match_context_builder.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';
import 'package:ts1_core/src/match/factories/match_state_factory.dart';
import 'package:ts1_core/src/match/models/attack/attack_state.dart';
import 'package:ts1_core/src/match/models/dynamics/match_dynamics.dart';
import 'package:ts1_core/src/match/models/events/match_event_card.dart';
import 'package:ts1_core/src/match/models/match.dart';
import 'package:ts1_core/src/match/models/insights/tactical_insight.dart';
import 'package:ts1_core/src/match/models/phase/phase_resolution_snapshot.dart';
import 'package:ts1_core/src/match/models/state/match_state.dart';
import 'package:ts1_core/src/team/models/team.dart';

/// Static bootstrap utility for creating [Match] objects.
class MatchEngine {
  MatchEngine._();

  static const int defaultTotalRegulationMinutes = 90;
  static const int defaultMicroPhaseSeconds = 30;

  /// Creates a pre-match [Match] entity with context and seeded state.
  ///
  /// Responsibilities:
  /// - Build tactical/strength context from both teams.
  /// - Seed [MatchState] with pre-match defaults.
  /// - Attach simulation metadata (timing, venue, weather).
  ///
  /// Parameters:
  /// - [id]: Unique match identifier used in deterministic seeding.
  /// - [homeTeam], [awayTeam]: Teams participating in the match.
  /// - [kickoffAt]: Scheduled kickoff time.
  /// - [venue], [weather]: Match environment metadata.
  /// - [totalRegulationMinutes]: Regulation time, defaults to 90.
  /// - [microPhaseSeconds]: Duration of one simulation tick.
  ///
  /// Returns a fully initialized match in scheduled state.
  static Match bootstrapMatch({
    required int id,
    required Team homeTeam,
    required Team awayTeam,
    required DateTime kickoffAt,
    String venue = 'Unknown',
    String weather = 'Unknown',
    int totalRegulationMinutes = defaultTotalRegulationMinutes,
    int microPhaseSeconds = defaultMicroPhaseSeconds,
  }) {
    final context = MatchContextBuilder.buildFromTeams(
      homeTeam: homeTeam,
      awayTeam: awayTeam,
    );
    final seededState = MatchStateFactory.preMatch(context: context);

    return Match(
      id: id,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      kickoffAt: kickoffAt,
      venue: venue,
      weather: weather,
      totalRegulationMinutes: totalRegulationMinutes,
      microPhaseSeconds: microPhaseSeconds,
      context: context,
      matchState: seededState,
    );
  }

  /// Transitions a bootstrapped match into kickoff state.
  ///
  /// Responsibilities:
  /// - Apply kickoff state factory.
  /// - Seed phase/event kickoff records.
  ///
  /// Parameters:
  /// - [match]: Existing match entity.
  /// - [kickoffSide]: Team starting with initiative/possession.
  ///
  /// Returns a copied match with kickoff state applied.
  static Match kickoffMatch(
    Match match, {
    TeamSide kickoffSide = TeamSide.home,
  }) {
    final kickoffState = MatchStateFactory.kickoff(
      context: match.context,
      kickoffSide: kickoffSide,
    );

    return match.copyWith(matchState: kickoffState);
  }

  /// Advances the simulation by a single micro-phase.
  ///
  /// Step flow:
  /// 1. Validate match is still live.
  /// 2. Advance clock and status transitions.
  /// 3. If only status changed, return early.
  /// 4. Resolve football phase dynamics and outcomes.
  ///
  /// Parameters:
  /// - [match]: Current match snapshot.
  /// - [allowExtraTime]: Enables extra time when level at 90.
  /// - [allowPenalties]: Enables penalties when still level.
  ///
  /// Returns updated match after one simulation tick.
  static Match advanceMicroPhase(
    Match match, {
    bool allowExtraTime = false,
    bool allowPenalties = false,
  }) {
    final currentState = match.matchState;
    if (currentState.isFinished || !currentState.status.isLive) {
      return match;
    }

    final progressedState = currentState.advanceClockOnePhase(
      match.microPhaseSeconds,
      regulationMinutes: match.totalRegulationMinutes,
      allowExtraTime: allowExtraTime,
      allowPenalties: allowPenalties,
    );

    if (progressedState == currentState) {
      return match.copyWith(matchState: progressedState);
    }

    if (progressedState.status != currentState.status) {
      return match.copyWith(matchState: progressedState);
    }

    final resolvedState = _resolveMicroPhase(
      match: match,
      state: progressedState,
    );

    return match.copyWith(matchState: resolvedState);
  }

  /// Runs repeated micro-phases until terminal state or safety limit.
  ///
  /// Responsibilities:
  /// - Loop [advanceMicroPhase] calls.
  /// - Stop when finished, stalled, or phase limit reached.
  ///
  /// Parameters:
  /// - [match]: Match snapshot to simulate forward.
  /// - [allowExtraTime], [allowPenalties]: Knockout toggles.
  /// - [maxMicroPhases]: Optional hard cap for safety/testing.
  ///
  /// Returns the final simulated match snapshot.
  static Match simulateMatch(
    Match match, {
    bool allowExtraTime = false,
    bool allowPenalties = false,
    int? maxMicroPhases,
  }) {
    var current = match;
    final phaseLimit = maxMicroPhases ?? (match.expectedMicroPhases * 2);

    for (var index = 0; index < phaseLimit; index++) {
      if (current.matchState.isFinished) {
        break;
      }

      final next = advanceMicroPhase(
        current,
        allowExtraTime: allowExtraTime,
        allowPenalties: allowPenalties,
      );

      if (next.matchState == current.matchState) {
        break;
      }

      current = next;
    }

    return current;
  }

  /// Resolves one football phase outcome and mutates state immutably.
  ///
  /// Step flow:
  /// 1. Build deterministic random source for this phase.
  /// 2. Resolve initiative, possession, territory.
  /// 3. Resolve phase type/state and attack shape.
  /// 4. Resolve zone, chance type, chance quality, and outcome.
  /// 5. Create and apply [PhaseResolutionSnapshot].
  /// 6. Update possession split, zone dominance, and dynamics.
  /// 7. Optionally emit event card and tactical insight.
  ///
  /// Parameters:
  /// - [match]: Match-level context and identities.
  /// - [state]: Current mutable match state snapshot.
  ///
  /// Returns next immutable [MatchState] after phase resolution.
  static MatchState _resolveMicroPhase({
    required Match match,
    required MatchState state,
  }) {
    final random = _phaseRandom(match, state);
    final initiative = _resolveInitiative(match, state, random);
    final possession = initiative;
    final territoryRetention = _resolveTerritoryRetentionProbability(
      state: state,
      initiative: initiative,
    );
    final territory = random.nextDouble() < territoryRetention
        ? initiative
        : match.opponentOf(initiative);
    final phaseType = _resolvePhaseType(state: state, random: random);
    final attackState = AttackState(
      id: state.currentPhaseIndex + 1,
      route: _resolveAttackRoute(match, initiative, random),
      mode: _resolveAttackMode(match, initiative, phaseType),
      context: _resolveAttackContext(phaseType),
      phaseCount: state.currentPhaseIndex + 1,
      intensity: _resolveAttackIntensity(match, initiative),
    );
    final zone = _resolveZone(match, initiative, attackState, random);
    final chanceType = _resolveChanceType(phaseType, attackState, random);
    final chanceQuality = chanceType == null
        ? null
        : _resolveChanceQuality(match, initiative, attackState, random);
    final chanceOutcome = chanceType == null
        ? null
        : _resolveChanceOutcome(chanceQuality ?? 0.0, random);
    final phaseState = _resolvePhaseState(
      match: match,
      state: state,
      phaseType: phaseType,
      chanceType: chanceType,
      chanceOutcome: chanceOutcome,
      chanceQuality: chanceQuality,
    );
    final snapshot = PhaseResolutionSnapshot(
      id: state.currentPhaseIndex + 1,
      phaseIndex: state.currentPhaseIndex + 1,
      minute: state.clock.minute,
      phaseType: phaseType,
      phaseState: phaseState,
      initiativeTeam: initiative,
      possessionTeam: possession,
      territoryTeam: territory,
      attackState: attackState,
      chanceType: chanceType,
      chanceOutcome: chanceOutcome,
      chanceQuality: chanceQuality,
      zone: zone,
      isImportant:
          chanceOutcome == ChanceOutcome.goal ||
          chanceOutcome == ChanceOutcome.woodwork ||
          chanceOutcome == ChanceOutcome.save ||
          (chanceQuality != null && chanceQuality >= 0.58) ||
          (phaseType == MatchPhaseType.setPiece && chanceType != null),
    );

    var nextState = state.applyPhaseSnapshot(snapshot);
    nextState = nextState.applyPossessionSplit(
      initiative == TeamSide.home ? 0.56 : 0.44,
    );

    nextState = nextState.updateZoneDominance(initiative, zone, 0.04);

    nextState = nextState.copyWith(
      dynamics: _applyLiveDynamics(
        match: match,
        state: nextState,
        initiative: initiative,
        chanceOutcome: chanceOutcome,
        chanceQuality: chanceQuality,
      ),
    );

    final eventCard = _buildEventCard(
      snapshot: snapshot,
      initiative: initiative,
      chanceType: chanceType,
      chanceOutcome: chanceOutcome,
      chanceQuality: chanceQuality,
      zone: zone,
    );
    if (eventCard != null) {
      nextState = nextState.registerEventCard(eventCard);
    }

    final insight = _buildInsight(
      state: nextState,
      snapshot: snapshot,
      initiative: initiative,
      chanceType: chanceType,
      chanceOutcome: chanceOutcome,
      chanceQuality: chanceQuality,
      zone: zone,
    );
    if (insight != null) {
      nextState = nextState.registerInsight(insight);
    }

    return nextState;
  }

  /// Chooses the next phase type from current phase context.
  ///
  /// This behaves like a lightweight Markov step: current flow, control,
  /// momentum, and territory shape the next phase instead of a fixed cycle.
  static MatchPhaseType _resolvePhaseType({
    required MatchState state,
    required math.Random random,
  }) {
    final weights = _resolvePhaseTypeWeights(state);
    return _weightedPick(weights, random);
  }

  /// Maps phase type into its canonical phase state label.
  static MatchPhaseState _resolvePhaseState({
    required Match match,
    required MatchState state,
    required MatchPhaseType phaseType,
    required ChanceType? chanceType,
    required ChanceOutcome? chanceOutcome,
    required double? chanceQuality,
  }) {
    switch (phaseType) {
      case MatchPhaseType.neutralPossession:
        return MatchPhaseState.neutralPossession;
      case MatchPhaseType.defensiveOrganization:
        return MatchPhaseState.restart;
      case MatchPhaseType.buildUp:
        return MatchPhaseState.buildUp;
      case MatchPhaseType.progression:
        return MatchPhaseState.progression;
      case MatchPhaseType.finalThird:
        return MatchPhaseState.finalThird;
      case MatchPhaseType.chance:
        return MatchPhaseState.chance;
      case MatchPhaseType.outcome:
        if (chanceOutcome == ChanceOutcome.turnover) {
          return MatchPhaseState.turnover;
        }

        return _pickPhaseState({
          MatchPhaseState.outcome: _outcomeStateWeight(
            match,
            state,
            chanceQuality,
          ),
          MatchPhaseState.turnover: _turnoverStateWeight(state, chanceOutcome),
          MatchPhaseState.transition: _transitionStateWeight(state),
        }, _phaseStateRandom(state, phaseType, chanceType, chanceOutcome));
      case MatchPhaseType.transition:
        return _pickPhaseState({
          MatchPhaseState.transition: _transitionStateWeight(state),
          MatchPhaseState.duel: _duelStateWeight(match, state),
          MatchPhaseState.turnover: _turnoverStateWeight(state, chanceOutcome),
          MatchPhaseState.neutralPossession: _neutralPossessionStateWeight(
            match,
            state,
          ),
        }, _phaseStateRandom(state, phaseType, chanceType, chanceOutcome));
      case MatchPhaseType.setPiece:
        return _pickPhaseState({
          MatchPhaseState.setPiecePreparation: _setPiecePreparationStateWeight(
            match,
            state,
            chanceType,
          ),
          MatchPhaseState.setPieceDelivery: _setPieceDeliveryStateWeight(
            match,
            state,
            chanceType,
          ),
          MatchPhaseState.restart: _restartStateWeight(match, state),
        }, _phaseStateRandom(state, phaseType, chanceType, chanceOutcome));
      case MatchPhaseType.intervention:
        return MatchPhaseState.stoppage;
      case MatchPhaseType.specialIncident:
        return MatchPhaseState.stoppage;
    }
  }

  /// Resolves which team drives initiative for the current phase.
  ///
  /// Uses momentum, confidence, fatigue, and matchup edges to compute:
  /// - control bias when no prior initiative exists,
  /// - retention probability when initiative exists.
  ///
  /// This creates controlled turnover while preserving tactical identity.
  static TeamSide _resolveInitiative(
    Match match,
    MatchState state,
    math.Random random,
  ) {
    final homeControl = _clamp01(
      0.5 +
          (state.matchupState.homeAttackVsAwayDefense * 0.12) +
          (state.matchupState.midfieldControlEdge * 0.10) +
          (state.dynamics.homeMomentum * 0.10) +
          (state.dynamics.homeConfidence - 0.5) * 0.10 -
          (state.dynamics.homeFatigue * 0.08) +
          (state.dynamics.awayFatigue * 0.05),
    );

    final previous = state.currentInitiative;
    if (previous == null) {
      return random.nextDouble() < homeControl ? TeamSide.home : TeamSide.away;
    }

    final retainProbability = previous == TeamSide.home
        ? _clamp01(
            0.50 +
                (state.dynamics.homeMomentum * 0.09) +
                ((state.dynamics.homeConfidence - 0.5) * 0.08) -
                (state.dynamics.homeFatigue * 0.12) +
                ((homeControl - 0.5) * 0.20),
          )
        : _clamp01(
            0.50 +
                (state.dynamics.awayMomentum * 0.09) +
                ((state.dynamics.awayConfidence - 0.5) * 0.08) -
                (state.dynamics.awayFatigue * 0.12) +
                (((1 - homeControl) - 0.5) * 0.20),
          );

    if (random.nextDouble() < retainProbability) {
      return previous;
    }

    return match.opponentOf(previous);
  }

  /// Computes the probability that territorial control stays with initiative.
  ///
  /// Uses live dynamics and matchup edges already present in state:
  /// - momentum/confidence (positive)
  /// - fatigue/discipline pressure (negative)
  /// - midfield/transition/wing control (directional)
  ///
  /// Returns value clamped to [0, 1].
  static double _resolveTerritoryRetentionProbability({
    required MatchState state,
    required TeamSide initiative,
  }) {
    final dynamics = state.dynamics;
    final matchup = state.matchupState;

    final momentum = initiative == TeamSide.home
        ? dynamics.homeMomentum
        : dynamics.awayMomentum;
    final confidence = initiative == TeamSide.home
        ? dynamics.homeConfidence
        : dynamics.awayConfidence;
    final fatigue = initiative == TeamSide.home
        ? dynamics.homeFatigue
        : dynamics.awayFatigue;
    final disciplinePressure = initiative == TeamSide.home
        ? dynamics.homeDisciplinePressure
        : dynamics.awayDisciplinePressure;

    final directionalMidfield = initiative == TeamSide.home
        ? matchup.midfieldControlEdge
        : -matchup.midfieldControlEdge;
    final directionalTransition = initiative == TeamSide.home
        ? matchup.transitionControlEdge
        : -matchup.transitionControlEdge;
    final directionalWing = initiative == TeamSide.home
        ? matchup.wingControlEdge
        : -matchup.wingControlEdge;

    return _clamp01(
      0.52 +
          (momentum * 0.12) +
          ((confidence - 0.5) * 0.16) +
          (directionalMidfield * 0.14) +
          (directionalTransition * 0.08) +
          (directionalWing * 0.06) -
          (fatigue * 0.20) -
          (disciplinePressure * 0.08),
    );
  }

  /// Selects attacking route using weighted tactical identity biases.
  static AttackRoute _resolveAttackRoute(
    Match match,
    TeamSide initiative,
    math.Random random,
  ) {
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;

    final weights = <AttackRoute, double>{
      AttackRoute.leftFlank: identity.attackLeftBias,
      AttackRoute.rightFlank: identity.attackRightBias,
      AttackRoute.centralProgression: identity.attackCentralBias,
      AttackRoute.halfSpaces:
          (identity.cutbackBias + identity.throughBallBias) / 2,
      AttackRoute.directCentralLane:
          (identity.directnessBias + identity.riskTaking) / 2,
    };

    return _weightedPick(weights, random);
  }

  /// Selects attack mode from tactical identity and phase context.
  static AttackMode _resolveAttackMode(
    Match match,
    TeamSide initiative,
    MatchPhaseType phaseType,
  ) {
    if (phaseType == MatchPhaseType.setPiece) {
      return AttackMode.setPlayExecution;
    }

    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;

    if (identity.counterTriggerBias >= 0.65 &&
        phaseType == MatchPhaseType.transition) {
      return AttackMode.counterAttack;
    }
    if (identity.pressIntensityBias >= 0.70) {
      return AttackMode.highPressAttack;
    }
    if (identity.directnessBias >= 0.65) {
      return AttackMode.directPlay;
    }
    if (identity.counterTriggerBias >= 0.55) {
      return AttackMode.quickTransition;
    }
    return AttackMode.possessionBuildUp;
  }

  /// Maps phase type to attack context label for downstream analysis.
  static AttackContext _resolveAttackContext(MatchPhaseType phaseType) {
    if (phaseType == MatchPhaseType.setPiece) {
      return AttackContext.setpieceSequence;
    }
    if (phaseType == MatchPhaseType.transition) {
      return AttackContext.defensiveTransition;
    }
    return AttackContext.normalOpenPlay;
  }

  /// Computes attack intensity from identity risk and progression traits.
  static double _resolveAttackIntensity(Match match, TeamSide initiative) {
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;
    return _clamp01(
      0.45 +
          (identity.riskTaking * 0.2) +
          (identity.verticalProgressionBias * 0.1) +
          (identity.shortPassBias * -0.05),
    );
  }

  /// Resolves action zone from route and width tendencies.
  static PitchZone _resolveZone(
    Match match,
    TeamSide initiative,
    AttackState attackState,
    math.Random random,
  ) {
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;

    final routeZone = switch (attackState.route) {
      AttackRoute.leftFlank => random.nextBool() ? PitchZone.lw : PitchZone.lhs,
      AttackRoute.rightFlank =>
        random.nextBool() ? PitchZone.rw : PitchZone.rhs,
      AttackRoute.centralProgression =>
        random.nextBool() ? PitchZone.cm : PitchZone.cf,
      AttackRoute.halfSpaces =>
        random.nextBool() ? PitchZone.lhs : PitchZone.rhs,
      AttackRoute.directCentralLane =>
        random.nextBool() ? PitchZone.cf : PitchZone.cm,
    };

    if (identity.widthBias >= 0.65) {
      return initiative == TeamSide.home
          ? (random.nextBool() ? PitchZone.lw : PitchZone.rw)
          : (random.nextBool() ? PitchZone.lm : PitchZone.rm);
    }

    return routeZone;
  }

  /// Decides whether a chance occurs and which chance archetype appears.
  ///
  /// Includes phase-specific trigger probabilities to reduce chance inflation.
  static ChanceType? _resolveChanceType(
    MatchPhaseType phaseType,
    AttackState attackState,
    math.Random random,
  ) {
    if (phaseType == MatchPhaseType.setPiece) {
      return random.nextDouble() < 0.38 ? ChanceType.corner : null;
    }

    if (phaseType == MatchPhaseType.finalThird ||
        phaseType == MatchPhaseType.chance) {
      final trigger = phaseType == MatchPhaseType.chance ? 0.58 : 0.42;
      if (random.nextDouble() > trigger) {
        return null;
      }

      switch (attackState.route) {
        case AttackRoute.leftFlank:
        case AttackRoute.rightFlank:
          return random.nextBool()
              ? ChanceType.wideCrossHeader
              : ChanceType.cutback;
        case AttackRoute.centralProgression:
          return random.nextBool()
              ? ChanceType.highXgCentralShot
              : ChanceType.throughBallOneVsOne;
        case AttackRoute.halfSpaces:
          return random.nextBool()
              ? ChanceType.overloadCombination
              : ChanceType.cutback;
        case AttackRoute.directCentralLane:
          return random.nextBool()
              ? ChanceType.transitionBreakaway
              : ChanceType.lowXgLongShot;
      }
    }

    if (phaseType == MatchPhaseType.outcome) {
      return random.nextDouble() < 0.18 ? ChanceType.blockedShot : null;
    }

    return null;
  }

  /// Estimates chance quality using attacking edge, defensive resistance,
  /// tactical intensity, and bounded variance.
  static double _resolveChanceQuality(
    Match match,
    TeamSide initiative,
    AttackState attackState,
    math.Random random,
  ) {
    final attackingStrength = initiative == TeamSide.home
        ? match.context.homeStrengthProfile
        : match.context.awayStrengthProfile;
    final defendingStrength = initiative == TeamSide.home
        ? match.context.awayStrengthProfile
        : match.context.homeStrengthProfile;

    final technicalEdge =
        (attackingStrength.finishingQuality +
            attackingStrength.chanceConversion +
            attackingStrength.buildUpQuality) /
        300.0;
    final defensivePenalty =
        (defendingStrength.defensiveCompactness +
            defendingStrength.transitionDefense +
            defendingStrength.centralDefense) /
        300.0;
    final tacticalBoost = attackState.intensity * 0.2;

    return _clamp01(
      0.10 +
          (technicalEdge * 0.55) +
          (tacticalBoost * 0.40) -
          (defensivePenalty * 0.42) +
          (random.nextDouble() * 0.14),
    );
  }

  /// Converts chance quality into a football outcome via weighted sampling.
  ///
  /// Lower-quality chances bias toward blocks/clearances/off-target,
  /// while higher-quality chances increase goal/save/woodwork likelihood.
  static ChanceOutcome _resolveChanceOutcome(
    double chanceQuality,
    math.Random random,
  ) {
    final adjusted = _clamp01(chanceQuality);
    final weights = <ChanceOutcome, double>{
      ChanceOutcome.goal: 0.04 + (adjusted * 0.22),
      ChanceOutcome.save: 0.18 + (adjusted * 0.18),
      ChanceOutcome.block: 0.16 + ((1 - adjusted) * 0.18),
      ChanceOutcome.offTarget: 0.22 + ((1 - adjusted) * 0.20),
      ChanceOutcome.clearance: 0.18 + ((1 - adjusted) * 0.22),
      ChanceOutcome.turnover: 0.14 + ((1 - adjusted) * 0.18),
      ChanceOutcome.woodwork: 0.02 + (adjusted * 0.04),
      ChanceOutcome.claimedByKeeper: 0.08 + (adjusted * 0.08),
    };
    return _weightedPick(weights, random);
  }

  /// Applies post-phase dynamic updates (fatigue and momentum swings).
  ///
  /// Momentum deltas are intentionally modest to avoid runaway dominance.
  static MatchDynamics _applyLiveDynamics({
    required Match match,
    required MatchState state,
    required TeamSide initiative,
    required ChanceOutcome? chanceOutcome,
    required double? chanceQuality,
  }) {
    final homePressBias = match.context.homeTacticalIdentity.pressIntensityBias;
    final awayPressBias = match.context.awayTacticalIdentity.pressIntensityBias;
    return state.dynamics
        .increaseFatigue(TeamSide.home, 0.004 + (homePressBias * 0.003))
        .increaseFatigue(TeamSide.away, 0.004 + (awayPressBias * 0.003))
        .swingMomentum(
          initiative,
          chanceOutcome == ChanceOutcome.goal
              ? 0.10
              : chanceQuality == null
              ? 0.01
              : (chanceQuality * 0.02),
        );
  }

  /// Builds a narrative event card for timeline output.
  ///
  /// Filtering rules reduce noisy low-value events and repeated neutral phases.
  static MatchEventCard? _buildEventCard({
    required PhaseResolutionSnapshot snapshot,
    required TeamSide initiative,
    required ChanceType? chanceType,
    required ChanceOutcome? chanceOutcome,
    required double? chanceQuality,
    required PitchZone? zone,
  }) {
    if (!snapshot.isImportant) {
      return null;
    }

    final neutralSetPiece =
        snapshot.phaseType == MatchPhaseType.setPiece && chanceOutcome == null;
    if (neutralSetPiece && snapshot.phaseIndex % 5 != 0) {
      return null;
    }

    if (chanceOutcome != ChanceOutcome.goal &&
        (chanceQuality == null || chanceQuality < 0.60) &&
        snapshot.phaseIndex % 4 != 0) {
      return null;
    }

    final title = switch (chanceOutcome) {
      ChanceOutcome.goal => 'Goal',
      ChanceOutcome.save => 'Saved Chance',
      ChanceOutcome.block => 'Blocked Chance',
      ChanceOutcome.offTarget => 'Off Target',
      ChanceOutcome.woodwork => 'Woodwork',
      ChanceOutcome.rebound => 'Rebound',
      ChanceOutcome.deflectionCorner => 'Corner Won',
      ChanceOutcome.claimedByKeeper => 'Claimed by Keeper',
      ChanceOutcome.offside => 'Offside',
      ChanceOutcome.foulWon => 'Foul Won',
      ChanceOutcome.turnover => 'Turnover',
      ChanceOutcome.clearance => 'Clearance',
      null => switch (snapshot.phaseType) {
        MatchPhaseType.setPiece => 'Set Piece',
        MatchPhaseType.transition => 'Transition',
        _ => 'Dangerous Phase',
      },
    };

    final description = switch (chanceOutcome) {
      ChanceOutcome.goal => 'A high-quality chance is converted.',
      ChanceOutcome.save =>
        'The chance is on target, but the goalkeeper stops it.',
      ChanceOutcome.block => 'The attempt is blocked before reaching goal.',
      ChanceOutcome.offTarget => 'The attack ends with a miss.',
      ChanceOutcome.woodwork => 'The ball strikes the woodwork.',
      ChanceOutcome.rebound => 'The ball spills into a dangerous rebound.',
      ChanceOutcome.deflectionCorner =>
        'The shot is deflected behind for a corner.',
      ChanceOutcome.claimedByKeeper =>
        'The goalkeeper claims the ball cleanly.',
      ChanceOutcome.offside => 'The move is cut short by an offside flag.',
      ChanceOutcome.foulWon => 'The attacking side wins a foul.',
      ChanceOutcome.turnover => 'Possession changes hands during the move.',
      ChanceOutcome.clearance => 'The defense clears the danger.',
      null => 'The phase develops through ${snapshot.phaseType.name}.',
    };

    return MatchEventCard(
      id: snapshot.phaseIndex,
      minute: snapshot.minute,
      title: title,
      description: description,
      phaseType: snapshot.phaseType,
      teamSide: initiative,
      zone: zone,
      attackState: snapshot.attackState,
      chanceType: chanceType,
      chanceOutcome: chanceOutcome,
      chanceQuality: chanceQuality,
      tacticalInsight: chanceOutcome == ChanceOutcome.goal
          ? 'A decisive attacking phase.'
          : null,
      isMajor:
          chanceOutcome == ChanceOutcome.goal ||
          (chanceQuality != null && chanceQuality >= 0.7),
    );
  }

  /// Builds tactical insight messages with duplicate/cooldown protection.
  ///
  /// Emits only when thresholds are met and recent insight history allows it.
  static TacticalInsight? _buildInsight({
    required MatchState state,
    required PhaseResolutionSnapshot snapshot,
    required TeamSide initiative,
    required ChanceType? chanceType,
    required ChanceOutcome? chanceOutcome,
    required double? chanceQuality,
    required PitchZone? zone,
  }) {
    final lastInsight = state.tacticalInsights.isEmpty
        ? null
        : state.tacticalInsights.last;

    if (chanceOutcome == ChanceOutcome.goal) {
      if (lastInsight != null &&
          lastInsight.relatedTeam == initiative &&
          lastInsight.level == TacticalSignalLevel.critical &&
          (snapshot.minute - lastInsight.minute).abs() <= 6) {
        return null;
      }

      return TacticalInsight(
        id: (state.tacticalInsights.length + 1),
        minute: snapshot.minute,
        level: TacticalSignalLevel.critical,
        message: 'Goal from ${zone?.name ?? 'open play'}.',
        suggestedAction:
            'Protect the lead and reduce exposure in the same zone.',
        relatedTeam: initiative,
      );
    }

    if (chanceQuality != null &&
        chanceQuality >= 0.78 &&
        chanceOutcome != ChanceOutcome.goal) {
      if (lastInsight != null &&
          lastInsight.relatedTeam == initiative &&
          lastInsight.level == TacticalSignalLevel.positive &&
          (snapshot.minute - lastInsight.minute).abs() <= 8) {
        return null;
      }

      return TacticalInsight(
        id: (state.tacticalInsights.length + 1),
        minute: snapshot.minute,
        level: TacticalSignalLevel.positive,
        message:
            'Strong attacking phase in ${zone?.name ?? 'the final third'}.',
        suggestedAction: 'Repeat the same route while the space remains open.',
        relatedTeam: initiative,
      );
    }

    if (chanceType != null && chanceQuality != null && chanceQuality <= 0.25) {
      return TacticalInsight(
        id: (state.tacticalInsights.length + 1),
        minute: snapshot.minute,
        level: TacticalSignalLevel.warning,
        message: 'The move is low quality and being squeezed out.',
        suggestedAction: 'Shift the attack route or slow the tempo.',
        relatedTeam: initiative,
      );
    }

    if (chanceOutcome == ChanceOutcome.turnover) {
      return TacticalInsight(
        id: (state.tacticalInsights.length + 1),
        minute: snapshot.minute,
        level: TacticalSignalLevel.warning,
        message: 'The current route is turning over too often.',
        suggestedAction: 'Reduce risk or use a different flank.',
        relatedTeam: initiative,
      );
    }

    return null;
  }

  /// Produces deterministic phase-local randomness from match and time state.
  ///
  /// Note: With identical match/state inputs, results are reproducible.
  static math.Random _phaseRandom(Match match, MatchState state) {
    final seed =
        match.id * 1000003 +
        (state.currentPhaseIndex * 997) +
        state.clock.minute * 31 +
        state.clock.second;
    return math.Random(seed);
  }

  /// Builds the phase transition weights from live match state.
  static Map<MatchPhaseType, double> _resolvePhaseTypeWeights(
    MatchState state,
  ) {
    final initiative = state.currentInitiative;
    final momentum = _initiativeMomentum(state, initiative);
    final confidence = _initiativeConfidence(state, initiative);
    final fatigue = _initiativeFatigue(state, initiative);
    final discipline = _initiativeDisciplinePressure(state, initiative);
    final possessionEdge = initiative == null
        ? 0.0
        : (state.currentPossession == initiative ? 0.12 : -0.06);
    final territoryEdge = initiative == null
        ? 0.0
        : (state.currentTerritoryControl == initiative ? 0.10 : -0.05);
    final attackEdge = _directionalMatchupEdge(
      initiative == TeamSide.home
          ? state.matchupState.homeAttackVsAwayDefense
          : state.matchupState.awayAttackVsHomeDefense,
      initiative,
    );
    final midfieldEdge = _directionalMatchupEdge(
      state.matchupState.midfieldControlEdge,
      initiative,
    );
    final transitionEdge = _directionalMatchupEdge(
      state.matchupState.transitionControlEdge,
      initiative,
    );
    final wingEdge = _directionalMatchupEdge(
      state.matchupState.wingControlEdge,
      initiative,
    );
    final setPieceEdge = _directionalMatchupEdge(
      state.matchupState.setPieceControlEdge,
      initiative,
    );

    final isRestart =
        state.currentPhaseType == MatchPhaseType.setPiece ||
        state.currentPhaseState == MatchPhaseState.restart;
    if (isRestart) {
      return {
        MatchPhaseType.transition: _positiveWeight(
          0.42 + (transitionEdge * 0.18) + (momentum * 0.04) + (fatigue * 0.03),
        ),
        MatchPhaseType.buildUp: _positiveWeight(
          0.28 +
              (possessionEdge * 0.10) +
              (confidence * 0.06) +
              (midfieldEdge * 0.10) +
              (setPieceEdge * 0.03),
        ),
        MatchPhaseType.progression: _positiveWeight(
          0.16 +
              (momentum * 0.06) +
              (midfieldEdge * 0.08) +
              (attackEdge * 0.06),
        ),
        MatchPhaseType.finalThird: _positiveWeight(
          0.08 +
              (attackEdge * 0.08) +
              (territoryEdge * 0.08) +
              (wingEdge * 0.04),
        ),
        MatchPhaseType.chance: _positiveWeight(
          0.03 + (attackEdge * 0.05) + (confidence * 0.04),
        ),
        MatchPhaseType.outcome: _positiveWeight(
          0.01 + (attackEdge * 0.03) + (discipline * 0.02),
        ),
      };
    }

    switch (state.currentPhaseType) {
      case MatchPhaseType.neutralPossession:
        return {
          MatchPhaseType.neutralPossession: _positiveWeight(
            0.08 + (fatigue * 0.04) + (discipline * 0.02),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.28 +
                (momentum * 0.08) +
                (confidence * 0.06) +
                (midfieldEdge * 0.10) +
                (possessionEdge * 0.08),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.18 +
                (momentum * 0.06) +
                (midfieldEdge * 0.08) +
                (attackEdge * 0.04),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.10 + (attackEdge * 0.08) + (territoryEdge * 0.06),
          ),
          MatchPhaseType.chance: _positiveWeight(
            0.05 + (attackEdge * 0.04) + (confidence * 0.03),
          ),
          MatchPhaseType.outcome: _positiveWeight(0.03 + (attackEdge * 0.02)),
          MatchPhaseType.transition: _positiveWeight(
            0.16 + (transitionEdge * 0.12) + (fatigue * 0.06),
          ),
        };
      case MatchPhaseType.defensiveOrganization:
        return {
          MatchPhaseType.transition: _positiveWeight(
            0.28 + (transitionEdge * 0.14) + (fatigue * 0.04),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.20 + (midfieldEdge * 0.08) + (confidence * 0.04),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.10 + (momentum * 0.04) + (midfieldEdge * 0.04),
          ),
          MatchPhaseType.neutralPossession: _positiveWeight(
            0.18 + (discipline * 0.02),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.06 + (attackEdge * 0.04),
          ),
          MatchPhaseType.chance: _positiveWeight(0.02 + (attackEdge * 0.02)),
          MatchPhaseType.outcome: _positiveWeight(0.02),
        };
      case MatchPhaseType.buildUp:
        return {
          MatchPhaseType.buildUp: _positiveWeight(
            0.14 +
                (confidence * 0.06) +
                (midfieldEdge * 0.08) +
                (possessionEdge * 0.06),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.32 +
                (momentum * 0.10) +
                (midfieldEdge * 0.10) +
                (attackEdge * 0.04),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.16 +
                (attackEdge * 0.10) +
                (territoryEdge * 0.08) +
                (wingEdge * 0.04),
          ),
          MatchPhaseType.chance: _positiveWeight(
            0.08 + (attackEdge * 0.06) + (confidence * 0.04),
          ),
          MatchPhaseType.outcome: _positiveWeight(0.04 + (attackEdge * 0.03)),
          MatchPhaseType.transition: _positiveWeight(
            0.16 + (transitionEdge * 0.10) + (fatigue * 0.06),
          ),
          MatchPhaseType.neutralPossession: _positiveWeight(
            0.06 + (discipline * 0.02),
          ),
        };
      case MatchPhaseType.progression:
        return {
          MatchPhaseType.progression: _positiveWeight(
            0.14 + (momentum * 0.08) + (midfieldEdge * 0.08),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.30 +
                (attackEdge * 0.12) +
                (territoryEdge * 0.10) +
                (wingEdge * 0.04),
          ),
          MatchPhaseType.chance: _positiveWeight(
            0.16 + (attackEdge * 0.10) + (confidence * 0.05),
          ),
          MatchPhaseType.outcome: _positiveWeight(0.06 + (attackEdge * 0.04)),
          MatchPhaseType.transition: _positiveWeight(
            0.14 + (transitionEdge * 0.10) + (fatigue * 0.05),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.10 + (possessionEdge * 0.04),
          ),
        };
      case MatchPhaseType.finalThird:
        return {
          MatchPhaseType.finalThird: _positiveWeight(
            0.16 + (attackEdge * 0.08) + (territoryEdge * 0.08),
          ),
          MatchPhaseType.chance: _positiveWeight(
            0.30 +
                (attackEdge * 0.12) +
                (confidence * 0.06) +
                (territoryEdge * 0.06),
          ),
          MatchPhaseType.outcome: _positiveWeight(
            0.18 + (attackEdge * 0.10) + (confidence * 0.04),
          ),
          MatchPhaseType.transition: _positiveWeight(
            0.12 + (transitionEdge * 0.08) + (fatigue * 0.05),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.12 + (midfieldEdge * 0.04),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.04 + (possessionEdge * 0.03),
          ),
        };
      case MatchPhaseType.chance:
        return {
          MatchPhaseType.chance: _positiveWeight(
            0.14 + (attackEdge * 0.08) + (confidence * 0.05),
          ),
          MatchPhaseType.outcome: _positiveWeight(
            0.34 + (attackEdge * 0.12) + (confidence * 0.06),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.16 + (territoryEdge * 0.06),
          ),
          MatchPhaseType.transition: _positiveWeight(
            0.12 + (transitionEdge * 0.08) + (fatigue * 0.04),
          ),
          MatchPhaseType.progression: _positiveWeight(0.08),
          MatchPhaseType.buildUp: _positiveWeight(0.04),
        };
      case MatchPhaseType.outcome:
        return {
          MatchPhaseType.transition: _positiveWeight(
            0.32 + (transitionEdge * 0.16) + (fatigue * 0.06),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.18 + (possessionEdge * 0.06) + (confidence * 0.04),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.10 + (midfieldEdge * 0.04),
          ),
          MatchPhaseType.neutralPossession: _positiveWeight(
            0.16 + (discipline * 0.02),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.04 + (attackEdge * 0.02),
          ),
          MatchPhaseType.chance: _positiveWeight(0.02 + (attackEdge * 0.02)),
        };
      case MatchPhaseType.transition:
        return {
          MatchPhaseType.transition: _positiveWeight(
            0.18 + (transitionEdge * 0.12) + (fatigue * 0.06),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.24 +
                (possessionEdge * 0.08) +
                (confidence * 0.06) +
                (midfieldEdge * 0.06),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.16 + (momentum * 0.08) + (attackEdge * 0.04),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.12 + (attackEdge * 0.08) + (territoryEdge * 0.04),
          ),
          MatchPhaseType.chance: _positiveWeight(0.06 + (attackEdge * 0.04)),
          MatchPhaseType.outcome: _positiveWeight(0.04 + (attackEdge * 0.02)),
          MatchPhaseType.neutralPossession: _positiveWeight(
            0.06 + (discipline * 0.02),
          ),
        };
      case MatchPhaseType.setPiece:
        return {
          MatchPhaseType.transition: _positiveWeight(
            0.42 +
                (transitionEdge * 0.18) +
                (momentum * 0.04) +
                (fatigue * 0.03),
          ),
          MatchPhaseType.buildUp: _positiveWeight(
            0.28 +
                (possessionEdge * 0.10) +
                (confidence * 0.06) +
                (midfieldEdge * 0.10) +
                (setPieceEdge * 0.03),
          ),
          MatchPhaseType.progression: _positiveWeight(
            0.16 +
                (momentum * 0.06) +
                (midfieldEdge * 0.08) +
                (attackEdge * 0.06),
          ),
          MatchPhaseType.finalThird: _positiveWeight(
            0.08 +
                (attackEdge * 0.08) +
                (territoryEdge * 0.08) +
                (wingEdge * 0.04),
          ),
          MatchPhaseType.chance: _positiveWeight(
            0.03 + (attackEdge * 0.05) + (confidence * 0.04),
          ),
          MatchPhaseType.outcome: _positiveWeight(
            0.01 + (attackEdge * 0.03) + (discipline * 0.02),
          ),
        };
      case MatchPhaseType.intervention:
        return {
          MatchPhaseType.transition: _positiveWeight(
            0.34 + (discipline * 0.08),
          ),
          MatchPhaseType.neutralPossession: _positiveWeight(
            0.18 + (discipline * 0.04),
          ),
          MatchPhaseType.buildUp: _positiveWeight(0.16),
          MatchPhaseType.progression: _positiveWeight(0.08),
          MatchPhaseType.finalThird: _positiveWeight(0.04),
        };
      case MatchPhaseType.specialIncident:
        return {
          MatchPhaseType.transition: _positiveWeight(
            0.30 + (discipline * 0.08),
          ),
          MatchPhaseType.neutralPossession: _positiveWeight(0.18),
          MatchPhaseType.buildUp: _positiveWeight(0.12),
          MatchPhaseType.progression: _positiveWeight(0.06),
          MatchPhaseType.finalThird: _positiveWeight(0.03),
        };
    }
  }

  static double _initiativeMomentum(MatchState state, TeamSide? initiative) {
    if (initiative == null) {
      return 0.0;
    }

    return initiative == TeamSide.home
        ? state.dynamics.homeMomentum
        : state.dynamics.awayMomentum;
  }

  static double _initiativeConfidence(MatchState state, TeamSide? initiative) {
    if (initiative == null) {
      return 0.5;
    }

    return initiative == TeamSide.home
        ? state.dynamics.homeConfidence
        : state.dynamics.awayConfidence;
  }

  static double _initiativeFatigue(MatchState state, TeamSide? initiative) {
    if (initiative == null) {
      return 0.0;
    }

    return initiative == TeamSide.home
        ? state.dynamics.homeFatigue
        : state.dynamics.awayFatigue;
  }

  static double _initiativeDisciplinePressure(
    MatchState state,
    TeamSide? initiative,
  ) {
    if (initiative == null) {
      return 0.0;
    }

    return initiative == TeamSide.home
        ? state.dynamics.homeDisciplinePressure
        : state.dynamics.awayDisciplinePressure;
  }

  static double _directionalMatchupEdge(double edge, TeamSide? initiative) {
    if (initiative == null) {
      return 0.0;
    }

    return initiative == TeamSide.home ? edge : -edge;
  }

  static double _positiveWeight(double value) {
    return value <= 0 ? 0.001 : value;
  }

  static double _outcomeStateWeight(
    Match match,
    MatchState state,
    double? chanceQuality,
  ) {
    final initiative = state.currentInitiative;
    final strength = initiative == TeamSide.home
        ? match.context.homeStrengthProfile
        : match.context.awayStrengthProfile;
    final quality = chanceQuality ?? 0.45;
    final finishingEdge =
        (strength.finishingQuality + strength.chanceConversion) / 200.0;
    final momentum = _initiativeMomentum(state, initiative).abs() * 0.08;
    return _positiveWeight(0.28 + (quality * 0.42) + finishingEdge + momentum);
  }

  static double _transitionStateWeight(MatchState state) {
    final initiative = state.currentInitiative;
    final transitionEdge = _directionalMatchupEdge(
      state.matchupState.transitionControlEdge,
      initiative,
    );
    final momentum = _initiativeMomentum(state, initiative);
    final fatigue = _initiativeFatigue(state, initiative);
    return _positiveWeight(
      0.22 + (transitionEdge * 0.18) + (momentum * 0.10) - (fatigue * 0.08),
    );
  }

  static double _duelStateWeight(Match match, MatchState state) {
    final initiative = state.currentInitiative;
    final structural = initiative == TeamSide.home
        ? match.context.homeStructuralProfile
        : match.context.awayStructuralProfile;
    final matchup = state.matchupState;
    final compactness =
        structural.pressShapeCohesion * 0.04 + structural.centralDensity * 0.04;
    final halfSpace = structural.halfSpaceAccess * 0.05;
    final territoryGap = state.currentTerritoryControl == initiative
        ? 0.06
        : 0.14;
    final wingEdge =
        _directionalMatchupEdge(matchup.wingControlEdge, initiative).abs() *
        0.08;
    return _positiveWeight(
      0.12 + compactness + halfSpace + territoryGap + wingEdge,
    );
  }

  static double _turnoverStateWeight(
    MatchState state,
    ChanceOutcome? chanceOutcome,
  ) {
    final initiative = state.currentInitiative;
    final possessionLoss = state.currentPossession != initiative ? 0.14 : 0.04;
    final territoryLoss = state.currentTerritoryControl != initiative
        ? 0.10
        : 0.03;
    final discipline = _initiativeDisciplinePressure(state, initiative) * 0.18;
    final directTurnover = chanceOutcome == ChanceOutcome.turnover ? 0.22 : 0.0;
    return _positiveWeight(
      0.10 + possessionLoss + territoryLoss + discipline + directTurnover,
    );
  }

  static double _neutralPossessionStateWeight(Match match, MatchState state) {
    final initiative = state.currentInitiative;
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;
    final strength = initiative == TeamSide.home
        ? match.context.homeStrengthProfile
        : match.context.awayStrengthProfile;
    return _positiveWeight(
      0.04 +
          ((1 - identity.pressIntensityBias) * 0.10) +
          ((1 - strength.defensiveCompactness) * 0.04) +
          ((1 - strength.disciplineControl / 10.0) * 0.02),
    );
  }

  static double _setPiecePreparationStateWeight(
    Match match,
    MatchState state,
    ChanceType? chanceType,
  ) {
    final initiative = state.currentInitiative;
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;
    final structure = initiative == TeamSide.home
        ? match.context.homeStructuralProfile
        : match.context.awayStructuralProfile;
    final setPieceEdge = _directionalMatchupEdge(
      state.matchupState.setPieceControlEdge,
      initiative,
    );
    final deliveryBias =
        identity.setPieceAttackingBias * 0.08 + structure.slotFitScore * 0.06;
    final preparatoryBias =
        structure.roleCoherence * 0.08 + structure.supportNetworkQuality * 0.04;
    final chancePenalty = chanceType == null ? 0.08 : -0.03;
    return _positiveWeight(
      0.12 +
          preparatoryBias +
          deliveryBias +
          (setPieceEdge * 0.12) +
          chancePenalty,
    );
  }

  static double _setPieceDeliveryStateWeight(
    Match match,
    MatchState state,
    ChanceType? chanceType,
  ) {
    final initiative = state.currentInitiative;
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;
    final structure = initiative == TeamSide.home
        ? match.context.homeStructuralProfile
        : match.context.awayStructuralProfile;
    final setPieceEdge = _directionalMatchupEdge(
      state.matchupState.setPieceControlEdge,
      initiative,
    );
    final deliveryBias =
        identity.setPieceAttackingBias * 0.12 + structure.boxPresence * 0.08;
    final chanceBonus = chanceType == null ? -0.06 : 0.10;
    return _positiveWeight(
      0.10 + deliveryBias + (setPieceEdge * 0.16) + chanceBonus,
    );
  }

  static double _restartStateWeight(Match match, MatchState state) {
    final initiative = state.currentInitiative;
    final identity = initiative == TeamSide.home
        ? match.context.homeTacticalIdentity
        : match.context.awayTacticalIdentity;
    final structure = initiative == TeamSide.home
        ? match.context.homeStructuralProfile
        : match.context.awayStructuralProfile;
    return _positiveWeight(
      0.08 +
          (1 - identity.counterTriggerBias) * 0.08 +
          (1 - structure.transitionProtection) * 0.06,
    );
  }

  static math.Random _phaseStateRandom(
    MatchState state,
    MatchPhaseType phaseType,
    ChanceType? chanceType,
    ChanceOutcome? chanceOutcome,
  ) {
    final seed =
        (state.currentPhaseIndex * 1009) +
        (phaseType.index * 97) +
        (chanceType?.index ?? 0) * 31 +
        (chanceOutcome?.index ?? 0) * 11 +
        state.clock.minute * 13 +
        state.clock.second;
    return math.Random(seed);
  }

  static T _pickPhaseState<T>(Map<T, double> weights, math.Random random) {
    return _weightedPick(weights, random);
  }

  /// Generic weighted random picker used by route/outcome sampling.
  ///
  /// Falls back to the first key when all weights are non-positive.
  static T _weightedPick<T>(Map<T, double> weights, math.Random random) {
    final entries = weights.entries.where((entry) => entry.value > 0).toList();
    final total = entries.fold<double>(0.0, (sum, entry) => sum + entry.value);

    if (entries.isEmpty || total <= 0) {
      return weights.keys.first;
    }

    var threshold = random.nextDouble() * total;
    for (final entry in entries) {
      threshold -= entry.value;
      if (threshold <= 0) {
        return entry.key;
      }
    }

    return entries.last.key;
  }

  /// Clamps a scalar into [0, 1] range.
  static double _clamp01(double value) {
    return value.clamp(0.0, 1.0).toDouble();
  }
}
