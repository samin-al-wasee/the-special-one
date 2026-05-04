import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/persistence/persistence_providers.dart';
import '../../application/edit_data_providers.dart';

class PlayerDetailScreen extends ConsumerStatefulWidget {
  const PlayerDetailScreen({required this.playerId, super.key});

  final int playerId;

  @override
  ConsumerState<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends ConsumerState<PlayerDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _dobController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  Position? _position;
  Footedness? _footedness;
  int? _countryId;
  bool _initialized = false;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncPlayer = ref.watch(playerByIdProvider(widget.playerId));
    final countriesAsync = ref.watch(countryOverviewsProvider);

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

          if (!_initialized) {
            _nameController = TextEditingController(text: player.name);
            _dobController = TextEditingController(
              text: player.dateOfBirth.toIso8601String().split('T').first,
            );
            _heightController = TextEditingController(
              text: player.heightCm.toString(),
            );
            _weightController = TextEditingController(
              text: player.weightKg.toString(),
            );
            _position = player.position;
            _footedness = player.footedness;
            _initialized = true;
          }

          return countriesAsync.when(
            data: (countries) {
              _countryId ??= countries
                  .firstWhere((item) => item.country.name == player.country)
                  .country
                  .id;

              return Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'View and update player details',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Name is required'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _dobController,
                      decoration: const InputDecoration(
                        labelText: 'Date of birth (YYYY-MM-DD)',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Date of birth is required';
                        }
                        if (DateTime.tryParse(value.trim()) == null) {
                          return 'Invalid date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        labelText: 'Height (cm)',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => double.tryParse(value ?? '') == null
                          ? 'Invalid height'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => double.tryParse(value ?? '') == null
                          ? 'Invalid weight'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<Position>(
                      initialValue: _position,
                      decoration: const InputDecoration(labelText: 'Position'),
                      items: Position.values
                          .map(
                            (position) => DropdownMenuItem(
                              value: position,
                              child: Text(position.label),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setState(() => _position = value),
                      validator: (value) =>
                          value == null ? 'Position is required' : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<Footedness>(
                      initialValue: _footedness,
                      decoration: const InputDecoration(
                        labelText: 'Footedness',
                      ),
                      items: Footedness.values
                          .map(
                            (footedness) => DropdownMenuItem(
                              value: footedness,
                              child: Text(footedness.label),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setState(() => _footedness = value),
                      validator: (value) =>
                          value == null ? 'Footedness is required' : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<int>(
                      initialValue: _countryId,
                      decoration: const InputDecoration(labelText: 'Country'),
                      items: countries
                          .map(
                            (item) => DropdownMenuItem<int>(
                              value: item.country.id,
                              child: Text(
                                '${item.country.name} (${item.country.code})',
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setState(() => _countryId = value),
                      validator: (value) =>
                          value == null ? 'Country is required' : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _saving
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;
                              setState(() => _saving = true);
                              try {
                                final countryRepo = await ref.read(
                                  countryRepositoryProvider.future,
                                );
                                final playerRepo = await ref.read(
                                  playerRepositoryProvider.future,
                                );
                                final country = await countryRepo
                                    .getCountryById(_countryId!);
                                await playerRepo.save(
                                  Player(
                                    id: player.id,
                                    name: _nameController.text.trim(),
                                    dateOfBirth: DateTime.parse(
                                      _dobController.text.trim(),
                                    ),
                                    country: country.name,
                                    heightCm: double.parse(
                                      _heightController.text.trim(),
                                    ),
                                    weightKg: double.parse(
                                      _weightController.text.trim(),
                                    ),
                                    position: _position!,
                                    footedness: _footedness!,
                                    technical: player.technical,
                                    mental: player.mental,
                                    physical: player.physical,
                                    hidden: player.hidden,
                                    condition: player.condition,
                                  ),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Player saved'),
                                    ),
                                  );
                                }
                              } finally {
                                if (mounted) setState(() => _saving = false);
                              }
                            },
                      child: Text(_saving ? 'Saving...' : 'Save Changes'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Technical',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(player.technical.toString()),
                    const SizedBox(height: 8),
                    Text(
                      'Mental',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(player.mental.toString()),
                    const SizedBox(height: 8),
                    Text(
                      'Physical',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(player.physical.toString()),
                    const SizedBox(height: 8),
                    Text(
                      'Hidden',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(player.hidden.toString()),
                    const SizedBox(height: 8),
                    Text(
                      'Condition',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(player.condition.toString()),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
