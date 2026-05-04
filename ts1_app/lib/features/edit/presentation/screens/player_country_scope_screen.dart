import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/edit_data_providers.dart';

class PlayerCountryScopeScreen extends ConsumerWidget {
  const PlayerCountryScopeScreen({required this.continentId, super.key});

  final int continentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(playerCountryScopesByContinentProvider(continentId));

    return Scaffold(
      appBar: AppBar(title: const Text('Countries (Nationality Scope)')),
      body: asyncData.when(
        data: (scopes) {
          if (scopes.isEmpty) {
            return const Center(child: Text('No countries found for this continent'));
          }

          return ListView.builder(
            itemCount: scopes.length,
            itemBuilder: (context, index) {
              final scope = scopes[index];
              return ListTile(
                title: Text('${scope.country.name} (${scope.country.code})'),
                subtitle: Text('Players: ${scope.playerCount}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/edit/players/country/${scope.country.id}'),
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
