import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../application/edit_data_providers.dart';

class PlayerContinentScopeScreen extends ConsumerWidget {
  const PlayerContinentScopeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(playerContinentScopesProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Players by Nationality'),
      ),
      body: asyncData.when(
        data: (scopes) {
          if (scopes.isEmpty) {
            return const Center(child: Text('No player data found'));
          }

          return ListView.builder(
            itemCount: scopes.length,
            itemBuilder: (context, index) {
              final scope = scopes[index];
              return ListTile(
                title: Text(
                  '${scope.continent.name} (${scope.continent.code})',
                ),
                subtitle: Text('Players: ${scope.playerCount}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(
                  '/edit/players/continent/${scope.continent.id}',
                ),
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
