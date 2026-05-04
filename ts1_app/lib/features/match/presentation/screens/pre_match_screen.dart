import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/persistence/persistence_providers.dart';
import '../../../../app/theme/theme_mode_button.dart';
import '../../application/match_flow_controller.dart';

class PreMatchScreen extends ConsumerStatefulWidget {
  const PreMatchScreen({super.key});

  @override
  ConsumerState<PreMatchScreen> createState() => _PreMatchScreenState();
}

class _PreMatchScreenState extends ConsumerState<PreMatchScreen> {
  Team? _homeTeam;
  Team? _awayTeam;

  @override
  Widget build(BuildContext context) {
    final teamsAsync = ref.watch(availableNationalTeamsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColors = isDark
        ? const [Color(0xFF0B1015), Color(0xFF1A222A)]
        : const [Color(0xFFF5F4EE), Color(0xFFE2ECE1)];
    final foreground = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: backgroundColors,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: AppBackButton(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ThemeModeButton(),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 920),
                    child: teamsAsync.when(
                      data: (teams) {
                        final sortedTeams = [...teams]
                          ..sort((a, b) => a.name.compareTo(b.name));
                        final homeOptions = sortedTeams;
                        final awayOptions = _homeTeam == null
                            ? sortedTeams
                            : sortedTeams
                                  .where((team) => team.id != _homeTeam!.id)
                                  .toList();

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Pre-Match',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.6,
                                  ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Select two teams from the persistence database, then continue to the tactical setup.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: foreground, height: 1.45),
                            ),
                            const SizedBox(height: 24),
                            _SelectionPanel(
                              title: 'Home Team',
                              accent: const Color(0xFF1B5E20),
                              value: _homeTeam,
                              options: homeOptions,
                              onChanged: (team) {
                                setState(() {
                                  _homeTeam = team;
                                  if (_awayTeam != null &&
                                      _awayTeam!.id == team?.id) {
                                    _awayTeam = null;
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            _SelectionPanel(
                              title: 'Away Team',
                              accent: const Color(0xFF111827),
                              value: _awayTeam,
                              options: awayOptions,
                              onChanged: (team) {
                                setState(() {
                                  _awayTeam = team;
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: _homeTeam != null && _awayTeam != null
                                  ? () {
                                      ref
                                          .read(matchFlowProvider)
                                          .setSelectedTeams(
                                            homeTeam: _homeTeam!,
                                            awayTeam: _awayTeam!,
                                          );
                                      context.push('/setup');
                                    }
                                  : null,
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Text('Continue to Setup'),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _homeTeam != null && _awayTeam != null
                                  ? '${_homeTeam!.name} vs ${_awayTeam!.name}'
                                  : 'Pick two different teams to continue.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: foreground.withValues(alpha: 0.75),
                                  ),
                            ),
                          ],
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stackTrace) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            'Unable to load available teams from persistence.\n$error',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectionPanel extends StatelessWidget {
  const _SelectionPanel({
    required this.title,
    required this.accent,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String title;
  final Color accent;
  final Team? value;
  final List<Team> options;
  final ValueChanged<Team?> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark
        ? const Color(0xFF13171D)
        : const Color(0xFFF9F8F2);
    final foreground = isDark ? Colors.white : Colors.black87;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.06),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<Team>(
            initialValue: value,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Choose team',
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: accent.withValues(alpha: 0.25)),
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: accent, width: 1.4),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            items: options
                .map(
                  (team) => DropdownMenuItem<Team>(
                    value: team,
                    child: Text(team.name),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
          const SizedBox(height: 12),
          Text(
            value == null ? 'No team selected' : value!.summary(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: foreground.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}
