import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/edit_data_providers.dart';

class CountryListScreen extends ConsumerWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(countryOverviewsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: asyncData.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No countries found'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text('${item.country.name} (${item.country.code})'),
                subtitle: Text(
                  'Team: ${item.team?.name ?? 'None'} | Player Count: ${item.playerCount}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/edit/countries/${item.country.id}'),
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
