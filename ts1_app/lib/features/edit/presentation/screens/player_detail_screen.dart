import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../application/edit_data_providers.dart';

class PlayerDetailScreen extends ConsumerWidget {
  const PlayerDetailScreen({required this.playerId, super.key});

  final int playerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPlayer = ref.watch(playerByIdProvider(playerId));

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Player Detail'),
      ),
      body: asyncPlayer.when(
        data: (player) {
          if (player == null) {
            return const Center(child: Text('Player not found'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                player.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text('Nationality: ${player.country}'),
              Text('Position: ${player.position.label}'),
              Text('Footedness: ${player.footedness.label}'),
              Text(
                'Date of Birth: ${player.dateOfBirth.toIso8601String().split('T').first}',
              ),
              Text('Height: ${player.heightCm} cm'),
              Text('Weight: ${player.weightKg} kg'),
              const SizedBox(height: 12),
              _attributeSection(context, 'Technical', player.technical),
              _attributeSection(context, 'Mental', player.mental),
              _attributeSection(context, 'Physical', player.physical),
              _attributeSection(context, 'Hidden', player.hidden),
              _attributeSection(context, 'Condition', player.condition),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _attributeSection(
    BuildContext context,
    String title,
    Map<dynamic, int> attrs,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        if (attrs.isEmpty)
          const Text('No attributes recorded')
        else
          ...attrs.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('${entry.key}: ${entry.value}'),
            ),
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}
