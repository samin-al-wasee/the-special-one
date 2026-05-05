import 'package:drift/drift.dart' show Value;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/ts1_persistence.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/persistence/persistence_providers.dart';
import '../../application/edit_data_providers.dart';

class TeamDetailScreen extends ConsumerStatefulWidget {
  const TeamDetailScreen({required this.teamId, super.key});

  final int teamId;

  @override
  ConsumerState<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends ConsumerState<TeamDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _lineupController;
  late final TextEditingController _primaryColorController;
  late final TextEditingController _secondaryColorController;
  late final TextEditingController _tertiaryColorController;
  bool _initialized = false;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _lineupController.dispose();
    _primaryColorController.dispose();
    _secondaryColorController.dispose();
    _tertiaryColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncTeam = ref.watch(teamByIdProvider(widget.teamId));

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Team Detail'),
      ),
      body: asyncTeam.when(
        data: (team) {
          if (team == null) {
            return const Center(child: Text('Team not found'));
          }

          if (!_initialized) {
            _nameController = TextEditingController(text: team.name);
            _lineupController = TextEditingController(
              text: const JsonEncoder.withIndent(
                '  ',
              ).convert(team.lineup.toJson()),
            );
            _primaryColorController = TextEditingController(
              text: team.primaryColor,
            );
            _secondaryColorController = TextEditingController(
              text: team.secondaryColor,
            );
            _tertiaryColorController = TextEditingController(
              text: team.tertiaryColor,
            );
            _initialized = true;
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Tactics', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(team.tactic.summary()),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Team name'),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Team name is required'
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _primaryColorController,
                      decoration: const InputDecoration(
                        labelText: 'Primary color (#rrggbb)',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Primary color is required';
                        final v = value.trim().toLowerCase();
                        final s = v.startsWith('#') ? v : '#$v';
                        final hex = RegExp(r'^#[0-9a-fA-F]{6}$');
                        return hex.hasMatch(s) ? null : 'Invalid hex color';
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _secondaryColorController,
                      decoration: const InputDecoration(
                        labelText: 'Secondary color (#rrggbb)',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Secondary color is required';
                        final v = value.trim().toLowerCase();
                        final s = v.startsWith('#') ? v : '#$v';
                        final hex = RegExp(r'^#[0-9a-fA-F]{6}$');
                        return hex.hasMatch(s) ? null : 'Invalid hex color';
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _tertiaryColorController,
                      decoration: const InputDecoration(
                        labelText: 'Tertiary color (#rrggbb)',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Tertiary color is required';
                        final v = value.trim().toLowerCase();
                        final s = v.startsWith('#') ? v : '#$v';
                        final hex = RegExp(r'^#[0-9a-fA-F]{6}$');
                        return hex.hasMatch(s) ? null : 'Invalid hex color';
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lineupController,
                      decoration: const InputDecoration(
                        labelText: 'Lineup JSON',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 14,
                      minLines: 10,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Lineup JSON is required';
                        }
                        try {
                          final decoded =
                              jsonDecode(value) as Map<String, dynamic>;
                          TeamLineup.fromJson(decoded);
                        } catch (error) {
                          return 'Invalid lineup JSON: $error';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _saving
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;
                              setState(() => _saving = true);
                              try {
                                final repo = await ref.read(
                                  nationalTeamRepositoryProvider.future,
                                );
                                final lineup = TeamLineup.fromJson(
                                  Map<String, dynamic>.from(
                                    jsonDecode(_lineupController.text) as Map,
                                  ),
                                );
                                await repo.updateTeam(
                                  NationalTeamsCompanion(
                                    id: Value(team.id),
                                    countryId: Value(team.id),
                                    name: Value(_nameController.text.trim()),
                                    lineup: Value(
                                      TeamLineupMapper.toJson(lineup),
                                    ),
                                    primaryColor: Value(
                                      _primaryColorController.text
                                              .trim()
                                              .toLowerCase()
                                              .startsWith('#')
                                          ? _primaryColorController.text
                                                .trim()
                                                .toLowerCase()
                                          : '#${_primaryColorController.text.trim().toLowerCase()}',
                                    ),
                                    secondaryColor: Value(
                                      _secondaryColorController.text
                                              .trim()
                                              .toLowerCase()
                                              .startsWith('#')
                                          ? _secondaryColorController.text
                                                .trim()
                                                .toLowerCase()
                                          : '#${_secondaryColorController.text.trim().toLowerCase()}',
                                    ),
                                    tertiaryColor: Value(
                                      _tertiaryColorController.text
                                              .trim()
                                              .toLowerCase()
                                              .startsWith('#')
                                          ? _tertiaryColorController.text
                                                .trim()
                                                .toLowerCase()
                                          : '#${_tertiaryColorController.text.trim().toLowerCase()}',
                                    ),
                                  ),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Team saved')),
                                  );
                                }
                              } finally {
                                if (mounted) setState(() => _saving = false);
                              }
                            },
                      child: Text(_saving ? 'Saving...' : 'Save Team & Lineup'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Lineup (Starters)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ...team.lineup.slotAssignments.map(
                (assignment) => ListTile(
                  dense: true,
                  title: Text(assignment.player.name),
                  subtitle: Text(
                    '${assignment.formationSlot.slotId.code} | ${assignment.player.position.label}',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text('Bench', style: Theme.of(context).textTheme.titleMedium),
              ...team.lineup.bench.map(
                (player) => ListTile(
                  dense: true,
                  title: Text(player.name),
                  subtitle: Text(player.position.label),
                ),
              ),
              const SizedBox(height: 12),
              Text('Reserves', style: Theme.of(context).textTheme.titleMedium),
              ...team.lineup.reserves.map(
                (player) => ListTile(
                  dense: true,
                  title: Text(player.name),
                  subtitle: Text(player.position.label),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
