import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/edit_data_providers.dart';

class TeamListScreen extends ConsumerWidget {
  const TeamListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(teamsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Teams')),
      body: asyncData.when(
        data: (teams) {
          if (teams.isEmpty) {
            return const Center(child: Text('No teams found'));
          }
          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return ListTile(
                title: Text(team.name),
                subtitle: Text(
                  'Formation: ${team.lineup.formationShape.code} | Starters: ${team.lineup.slotAssignments.length}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/edit/teams/${team.id}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
