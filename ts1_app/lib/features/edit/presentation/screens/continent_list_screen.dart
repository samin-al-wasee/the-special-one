import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/edit_data_providers.dart';

class ContinentListScreen extends ConsumerWidget {
  const ContinentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(continentOverviewsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Continents')),
      body: asyncData.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No continents found'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text('${item.continent.name} (${item.continent.code})'),
                subtitle: Text(
                  'Teams: ${item.teamCount} | Players: ${item.playerCount} | Countries: ${item.countryNames.length}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/edit/continents/${item.continent.id}'),
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
