import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/edit_data_providers.dart';

class ContinentDetailScreen extends ConsumerWidget {
  const ContinentDetailScreen({required this.continentId, super.key});

  final int continentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(continentOverviewProvider(continentId));

    return Scaffold(
      appBar: AppBar(title: const Text('Continent Detail')),
      body: asyncData.when(
        data: (item) {
          if (item == null) {
            return const Center(child: Text('Continent not found'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(item.continent.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Code: ${item.continent.code}'),
              Text('Team Count: ${item.teamCount}'),
              Text('Player Count: ${item.playerCount}'),
              const SizedBox(height: 16),
              Text('Country Names', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (item.countryNames.isEmpty)
                const Text('No countries in this continent')
              else
                ...item.countryNames.map((name) => ListTile(title: Text(name))),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
