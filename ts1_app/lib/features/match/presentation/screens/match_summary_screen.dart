import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/theme/theme_mode_button.dart';
import '../../application/match_flow_controller.dart';

class MatchSummaryScreen extends ConsumerWidget {
  const MatchSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(matchFlowProvider);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final match = controller.match;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Match Stars'),
            actions: const [ThemeModeButton()],
          ),
          body: match == null
              ? const Center(child: Text('No finished match available.'))
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Final Score',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 12),
                        _FinalScoreCard(match: match),
                        const SizedBox(height: 18),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final stacked = constraints.maxWidth < 720;
                            if (stacked) {
                              return Column(
                                children: [
                                  _StarsCard(
                                    teamName: match.homeTeam.name,
                                    side: TeamSide.home,
                                    rating: controller.ratingFor(TeamSide.home),
                                    stars: controller.starsFor(TeamSide.home),
                                    label: controller.ratingLabelFor(TeamSide.home),
                                    homeStyle: true,
                                  ),
                                  const SizedBox(height: 16),
                                  _StarsCard(
                                    teamName: match.awayTeam.name,
                                    side: TeamSide.away,
                                    rating: controller.ratingFor(TeamSide.away),
                                    stars: controller.starsFor(TeamSide.away),
                                    label: controller.ratingLabelFor(TeamSide.away),
                                    homeStyle: false,
                                  ),
                                ],
                              );
                            }

                            return Row(
                              children: [
                                Expanded(
                                  child: _StarsCard(
                                    teamName: match.homeTeam.name,
                                    side: TeamSide.home,
                                    rating: controller.ratingFor(TeamSide.home),
                                    stars: controller.starsFor(TeamSide.home),
                                    label: controller.ratingLabelFor(TeamSide.home),
                                    homeStyle: true,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _StarsCard(
                                    teamName: match.awayTeam.name,
                                    side: TeamSide.away,
                                    rating: controller.ratingFor(TeamSide.away),
                                    stars: controller.starsFor(TeamSide.away),
                                    label: controller.ratingLabelFor(TeamSide.away),
                                    homeStyle: false,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 18),
                        FilledButton(
                          onPressed: () {
                            ref.read(matchFlowProvider).resetToDefaults();
                            context.go('/');
                          },
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Exit'),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class _FinalScoreCard extends StatelessWidget {
  const _FinalScoreCard({required this.match});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final score = match.matchState.scoreline;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111317),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            '${match.homeTeam.name} ${score.home} - ${score.away} ${match.awayTeam.name}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Status: ${match.matchState.status.name}  •  Clock: ${match.matchState.clock}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
}

class _StarsCard extends StatelessWidget {
  const _StarsCard({
    required this.teamName,
    required this.side,
    required this.rating,
    required this.stars,
    required this.label,
    required this.homeStyle,
  });

  final String teamName;
  final TeamSide side;
  final double rating;
  final int stars;
  final String label;
  final bool homeStyle;

  @override
  Widget build(BuildContext context) {
    final background = homeStyle ? const Color(0xFFF6F8F1) : const Color(0xFF15171C);
    final foreground = homeStyle ? Colors.black87 : Colors.white;
    final accent = homeStyle ? const Color(0xFF166534) : const Color(0xFFF0F0F0);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                index < stars ? Icons.star_rounded : Icons.star_border_rounded,
                color: accent,
                size: 30,
              );
            }),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '${rating.toStringAsFixed(1)} / 5.0',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Side: ${side.name}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: foreground.withValues(alpha: 0.7),
                ),
          ),
        ],
      ),
    );
  }
}