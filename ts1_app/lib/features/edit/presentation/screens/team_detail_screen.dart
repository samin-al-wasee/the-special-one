import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../application/edit_data_providers.dart';

class TeamDetailScreen extends ConsumerWidget {
  const TeamDetailScreen({required this.teamId, super.key});

  final int teamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTeam = ref.watch(teamByIdProvider(teamId));

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Team Detail'),
      ),
      body: asyncTeam.when(
        data: (team) {
          if (team == null) {
            return const Center(child: Text('Team not found'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(team.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Formation: ${team.lineup.formationShape.code}'),
              const SizedBox(height: 12),
              Text('Tactics', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(team.tactic.summary()),
              const SizedBox(height: 16),
              Text(
                'Lineup (Starters)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ...team.lineup.slotAssignments.map(
                (assignment) => ListTile(
                  dense: true,
                  title: Text(assignment.player.name),
                  subtitle: Text(
                    '${assignment.formationSlot.slotId.code} | ${assignment.player.position.label}',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text('Bench', style: Theme.of(context).textTheme.titleMedium),
              ...team.lineup.bench.map(
                (player) => ListTile(
                  dense: true,
                  title: Text(player.name),
                  subtitle: Text(player.position.label),
                ),
              ),
              const SizedBox(height: 12),
              Text('Reserves', style: Theme.of(context).textTheme.titleMedium),
              ...team.lineup.reserves.map(
                (player) => ListTile(
                  dense: true,
                  title: Text(player.name),
                  subtitle: Text(player.position.label),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
