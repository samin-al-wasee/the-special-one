import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../application/edit_data_providers.dart';

class PlayerListScreen extends ConsumerWidget {
  const PlayerListScreen({required this.countryId, super.key});

  final int countryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCountry = ref.watch(countryByIdProvider(countryId));
    final asyncPlayers = ref.watch(playersByCountryProvider(countryId));

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: asyncCountry.maybeWhen(
          data: (country) =>
              Text(country == null ? 'Players' : 'Players - ${country.name}'),
          orElse: () => const Text('Players'),
        ),
      ),
      body: asyncPlayers.when(
        data: (players) {
          if (players.isEmpty) {
            return const Center(child: Text('No players for this country'));
          }

          return ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              return ListTile(
                title: Text(player.name),
                subtitle: Text(player.position.label),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/edit/players/detail/${player.id}'),
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
