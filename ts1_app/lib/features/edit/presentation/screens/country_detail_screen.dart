import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/edit_data_providers.dart';

class CountryDetailScreen extends ConsumerWidget {
  const CountryDetailScreen({required this.countryId, super.key});

  final int countryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(countryOverviewProvider(countryId));

    return Scaffold(
      appBar: AppBar(title: const Text('Country Detail')),
      body: asyncData.when(
        data: (item) {
          if (item == null) {
            return const Center(child: Text('Country not found'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(item.country.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Code: ${item.country.code}'),
              Text('Team: ${item.team?.name ?? 'No national team assigned'}'),
              Text('Player Count: ${item.playerCount}'),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
