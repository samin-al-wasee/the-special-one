import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/theme/theme_mode_button.dart';
import '../../../../app/theme/team_color_utils.dart';
import '../../application/match_flow_controller.dart';

class LiveMatchScreen extends ConsumerWidget {
  const LiveMatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(matchFlowProvider);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final match = controller.match;

        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
            title: const Text('Live Match'),
            actions: [
              const ThemeModeButton(),
              TextButton(
                onPressed: () {
                  ref.read(matchFlowProvider).resetToDefaults();
                  context.go('/');
                },
                child: const Text('Exit'),
              ),
            ],
          ),
          body: match == null
              ? const Center(child: Text('No active match.'))
              : SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                        child: _MatchHeader(match: match),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: match.matchState.isFinished
                                ? () => context.push('/summary')
                                : null,
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              match.matchState.isFinished
                                  ? 'View Stars'
                                  : 'Simulating Match...',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _TimelineList(
                            match: match,
                            phaseHistory: match.matchState.phaseHistory,
                            eventCards: match.matchState.eventCards,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _MatchHeader extends StatelessWidget {
  const _MatchHeader({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final score = match.matchState.scoreline;
    final clock = match.matchState.clock;
    final colors = colorsForTeams(match.homeTeam, match.awayTeam);
    final bg = colors['homeBg']!;
    final textColor = colors['homeText']!;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${match.homeTeam.name}  ${score.home} - ${score.away}  ${match.awayTeam.name}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${clock.toString()}  •  ${match.matchState.status.name}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineList extends StatelessWidget {
  const _TimelineList({
    required this.match,
    required this.phaseHistory,
    required this.eventCards,
  });

  final Match match;
  final List<PhaseResolutionSnapshot> phaseHistory;
  final List<MatchEventCard> eventCards;

  @override
  Widget build(BuildContext context) {
    final items = <_TimelineItem>[];
    final eventsByPhase = <int, List<MatchEventCard>>{};
    for (final event in eventCards) {
      eventsByPhase.putIfAbsent(event.id, () => []).add(event);
    }

    for (final phase in phaseHistory.reversed) {
      items.add(_TimelineItem.phase(phase));
      final phaseEvents =
          eventsByPhase[phase.phaseIndex] ?? const <MatchEventCard>[];
      for (final event in phaseEvents.reversed) {
        items.add(_TimelineItem.event(event));
      }
    }

    if (items.isEmpty) {
      return const Center(
        child: Text('Advance the match to generate phases and event cards.'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = items[index];
        return item.when(
          phase: (phase) => _PhaseCard(snapshot: phase, match: match),
          eventBuilder: (event) => _EventCard(event: event, match: match),
        );
      },
    );
  }
}

class _PhaseCard extends StatelessWidget {
  const _PhaseCard({required this.snapshot, required this.match});

  final PhaseResolutionSnapshot snapshot;
  final Match match;

  @override
  Widget build(BuildContext context) {
    final side =
        snapshot.initiativeTeam ?? snapshot.possessionTeam ?? TeamSide.home;
    final bool isHome = side == TeamSide.home;

    // Choose colors based on the team side and the current match teams
    final home = match.homeTeam;
    final away = match.awayTeam;

    Color background;
    Color foreground;
    Color accent;

    final map = colorsForTeams(home, away);
    if (isHome) {
      background = map['homeBg']!;
      accent = map['homeAccent']!;
      foreground = map['homeText']!;
    } else {
      background = map['awayBg']!;
      accent = map['awayAccent']!;
      foreground = map['awayText']!;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${snapshot.minute}′  Phase ${snapshot.phaseIndex}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${side.name.toUpperCase()} • ${snapshot.phaseType.name}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: foreground.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Route: ${snapshot.attackState?.route.name ?? '-'}  |  Mode: ${snapshot.attackState?.mode.name ?? '-'}  |  Zone: ${snapshot.zone?.name ?? '-'}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: foreground.withValues(alpha: 0.80),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event, required this.match});

  final MatchEventCard event;
  final Match match;

  @override
  Widget build(BuildContext context) {
    final light = event.teamSide == TeamSide.home;
    final home = match.homeTeam;
    final away = match.awayTeam;

    Color background;
    Color foreground;
    Color accent;

    final map = colorsForTeams(home, away);
    if (light) {
      background = map['homeBg']!;
      accent = map['homeAccent']!;
      foreground = map['homeText']!;
    } else {
      background = map['awayBg']!;
      accent = map['awayAccent']!;
      foreground = map['awayText']!;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: background,
        shape: StadiumBorder(
          side: BorderSide(color: accent.withValues(alpha: 0.26)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            event.isMajor ? Icons.bolt_rounded : Icons.circle,
            color: accent,
            size: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${event.minute}′  ${event.title}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: foreground.withValues(alpha: 0.82),
                    height: 1.35,
                  ),
                ),
                if (event.chanceOutcome != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Outcome: ${event.chanceOutcome!.name}  |  xG: ${event.chanceQuality?.toStringAsFixed(2) ?? '-'}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: foreground.withValues(alpha: 0.72),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

sealed class _TimelineItem {
  const _TimelineItem();

  const factory _TimelineItem.phase(PhaseResolutionSnapshot snapshot) =
      _PhaseTimelineItem;
  const factory _TimelineItem.event(MatchEventCard event) = _EventTimelineItem;

  T when<T>({
    required T Function(PhaseResolutionSnapshot phase) phase,
    required T Function(MatchEventCard event) eventBuilder,
  }) {
    return switch (this) {
      _PhaseTimelineItem(:final snapshot) => phase(snapshot),
      _EventTimelineItem(:final event) => eventBuilder(event),
    };
  }
}

class _PhaseTimelineItem extends _TimelineItem {
  const _PhaseTimelineItem(this.snapshot);

  final PhaseResolutionSnapshot snapshot;
}

class _EventTimelineItem extends _TimelineItem {
  const _EventTimelineItem(this.event);

  final MatchEventCard event;
}
