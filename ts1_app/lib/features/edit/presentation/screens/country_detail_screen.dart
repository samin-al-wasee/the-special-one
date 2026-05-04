import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ts1_persistence/ts1_persistence.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/persistence/persistence_providers.dart';
import '../../application/edit_data_providers.dart';

class CountryDetailScreen extends ConsumerStatefulWidget {
  const CountryDetailScreen({required this.countryId, super.key});

  final int countryId;

  @override
  ConsumerState<CountryDetailScreen> createState() =>
      _CountryDetailScreenState();
}

class _CountryDetailScreenState extends ConsumerState<CountryDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;
  int? _continentId;
  bool _initialized = false;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(countryOverviewProvider(widget.countryId));
    final continentsAsync = ref.watch(continentOverviewsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Country Detail'),
      ),
      body: asyncData.when(
        data: (item) {
          if (item == null) {
            return const Center(child: Text('Country not found'));
          }

          if (!_initialized) {
            _nameController = TextEditingController(text: item.country.name);
            _codeController = TextEditingController(text: item.country.code);
            _continentId = item.country.continentId;
            _initialized = true;
          }

          return continentsAsync.when(
            data: (continents) {
              return Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'Team: ${item.team?.name ?? 'No national team assigned'}',
                    ),
                    Text('Player Count: ${item.playerCount}'),
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
                      controller: _codeController,
                      decoration: const InputDecoration(labelText: 'Code'),
                      maxLength: 3,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Code is required';
                        }
                        if (value.trim().length != 3) {
                          return 'Code must be 3 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<int>(
                      initialValue: _continentId,
                      decoration: const InputDecoration(labelText: 'Continent'),
                      items: continents
                          .map(
                            (overview) => DropdownMenuItem<int>(
                              value: overview.continent.id,
                              child: Text(
                                '${overview.continent.name} (${overview.continent.code})',
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _continentId = value),
                      validator: (value) =>
                          value == null ? 'Continent is required' : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _saving
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;
                              setState(() => _saving = true);
                              try {
                                final repo = await ref.read(
                                  countryRepositoryProvider.future,
                                );
                                await repo.updateCountry(
                                  CountriesCompanion(
                                    id: Value(item.country.id),
                                    name: Value(_nameController.text.trim()),
                                    code: Value(
                                      _codeController.text.trim().toUpperCase(),
                                    ),
                                    continentId: Value(_continentId!),
                                  ),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Country saved'),
                                    ),
                                  );
                                }
                              } finally {
                                if (mounted) setState(() => _saving = false);
                              }
                            },
                      child: Text(_saving ? 'Saving...' : 'Save Changes'),
                    ),
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
