import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ts1_persistence/ts1_persistence.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/persistence/persistence_providers.dart';
import '../../application/edit_data_providers.dart';

class ContinentDetailScreen extends ConsumerStatefulWidget {
  const ContinentDetailScreen({required this.continentId, super.key});

  final int continentId;

  @override
  ConsumerState<ContinentDetailScreen> createState() =>
      _ContinentDetailScreenState();
}

class _ContinentDetailScreenState extends ConsumerState<ContinentDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;
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
    final asyncData = ref.watch(continentOverviewProvider(widget.continentId));

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Continent Detail'),
      ),
      body: asyncData.when(
        data: (item) {
          if (item == null) {
            return const Center(child: Text('Continent not found'));
          }

          if (!_initialized) {
            _nameController = TextEditingController(text: item.continent.name);
            _codeController = TextEditingController(text: item.continent.code);
            _initialized = true;
          }

          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Teams: ${item.teamCount}'),
                Text('Players: ${item.playerCount}'),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Name is required'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(labelText: 'Code'),
                  maxLength: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Code is required';
                    }
                    if (value.trim().length != 2) {
                      return 'Code must be 2 characters';
                    }
                    return null;
                  },
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
                              continentRepositoryProvider.future,
                            );
                            await repo.updateContinent(
                              ContinentsCompanion(
                                id: Value(item.continent.id),
                                name: Value(_nameController.text.trim()),
                                code: Value(
                                  _codeController.text.trim().toUpperCase(),
                                ),
                              ),
                            );
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Continent saved'),
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
                  'Country Names',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                if (item.countryNames.isEmpty)
                  const Text('No countries in this continent')
                else
                  ...item.countryNames.map(
                    (name) => ListTile(title: Text(name)),
                  ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
