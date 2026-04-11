import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/theme/theme_mode_button.dart';
import '../../application/match_flow_controller.dart';

class MatchSetupScreen extends ConsumerWidget {
  const MatchSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(matchFlowProvider);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Match Setup'),
            actions: const [ThemeModeButton()],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Choose presets and formations',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The match engine will build both squads from the selected tactical presets.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final stacked = constraints.maxWidth < 720;
                      if (stacked) {
                        return Column(
                          children: [
                            _TeamSetupCard(
                              title: 'Home Team',
                              subtitle: 'Preset and formation',
                              preset: controller.homePreset,
                              formationCode: controller.homeFormationCode,
                              presetOptions: controller.availablePresets,
                              formationOptions: controller.availableFormations,
                              onPresetChanged: ref.read(matchFlowProvider).setHomePreset,
                              onFormationChanged: ref.read(matchFlowProvider).setHomeFormation,
                              lightCard: true,
                            ),
                            const SizedBox(height: 16),
                            _TeamSetupCard(
                              title: 'Away Team',
                              subtitle: 'Preset and formation',
                              preset: controller.awayPreset,
                              formationCode: controller.awayFormationCode,
                              presetOptions: controller.availablePresets,
                              formationOptions: controller.availableFormations,
                              onPresetChanged: ref.read(matchFlowProvider).setAwayPreset,
                              onFormationChanged: ref.read(matchFlowProvider).setAwayFormation,
                              lightCard: false,
                            ),
                          ],
                        );
                      }

                      return Row(
                        children: [
                          Expanded(
                            child: _TeamSetupCard(
                              title: 'Home Team',
                              subtitle: 'Preset and formation',
                              preset: controller.homePreset,
                              formationCode: controller.homeFormationCode,
                              presetOptions: controller.availablePresets,
                              formationOptions: controller.availableFormations,
                              onPresetChanged: ref.read(matchFlowProvider).setHomePreset,
                              onFormationChanged: ref.read(matchFlowProvider).setHomeFormation,
                              lightCard: true,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _TeamSetupCard(
                              title: 'Away Team',
                              subtitle: 'Preset and formation',
                              preset: controller.awayPreset,
                              formationCode: controller.awayFormationCode,
                              presetOptions: controller.availablePresets,
                              formationOptions: controller.availableFormations,
                              onPresetChanged: ref.read(matchFlowProvider).setAwayPreset,
                              onFormationChanged: ref.read(matchFlowProvider).setAwayFormation,
                              lightCard: false,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      ref.read(matchFlowProvider).prepareTeams();
                      context.go('/lineup');
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Advance'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.hasPreparedTeams
                        ? 'Draft ready: ${controller.draftHomeTeam?.summary()} vs ${controller.draftAwayTeam?.summary()}'
                        : 'Players are generated after you tap Advance.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TeamSetupCard extends StatelessWidget {
  const _TeamSetupCard({
    required this.title,
    required this.subtitle,
    required this.preset,
    required this.formationCode,
    required this.presetOptions,
    required this.formationOptions,
    required this.onPresetChanged,
    required this.onFormationChanged,
    required this.lightCard,
  });

  final String title;
  final String subtitle;
  final TacticalPreset preset;
  final String formationCode;
  final List<TacticalPreset> presetOptions;
  final List<String> formationOptions;
  final ValueChanged<TacticalPreset> onPresetChanged;
  final ValueChanged<String> onFormationChanged;
  final bool lightCard;

  @override
  Widget build(BuildContext context) {
    final background = lightCard ? const Color(0xFFF7F7F1) : const Color(0xFF121317);
    final foreground = lightCard ? Colors.black87 : Colors.white;
    final border = lightCard ? const Color(0xFF1B5E20) : const Color(0xFFEAEAEA);
    final menuTextStyle = TextStyle(color: foreground);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: border.withValues(alpha: 0.25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: lightCard ? 0.05 : 0.18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: foreground.withValues(alpha: 0.75),
                ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<TacticalPreset>(
            initialValue: preset,
            dropdownColor: background,
            style: menuTextStyle,
            iconEnabledColor: foreground,
            decoration: InputDecoration(
              labelText: 'Preset',
              labelStyle: TextStyle(color: foreground.withValues(alpha: 0.7)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border, width: 1.4),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            items: presetOptions
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option.label, style: menuTextStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                onPresetChanged(value);
              }
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: formationCode,
            dropdownColor: background,
            style: menuTextStyle,
            iconEnabledColor: foreground,
            decoration: InputDecoration(
              labelText: 'Formation',
              labelStyle: TextStyle(color: foreground.withValues(alpha: 0.7)),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border, width: 1.4),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            items: formationOptions
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option, style: menuTextStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                onFormationChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}