import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/navigation/app_back_button.dart';
import '../../../../app/theme/theme_mode_button.dart';
import '../../../../app/theme/team_color_utils.dart';
import '../../application/match_flow_controller.dart';
import '../widgets/responsive_pair_layout.dart';

class MatchConfigurationScreen extends ConsumerWidget {
  const MatchConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(matchFlowProvider);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
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
                  ResponsivePairLayout(
                    first: _TeamSetupCard(
                      title: 'Home Team',
                      subtitle: 'Preset and formation',
                      team: controller.draftHomeTeam,
                      opponent: controller.draftAwayTeam,
                      isHomeTeam: true,
                      preset: controller.homePreset,
                      formationCode: controller.homeFormationCode,
                      presetOptions: controller.availablePresets,
                      formationOptions: controller.availableFormations,
                      onPresetChanged: ref
                          .read(matchFlowProvider)
                          .setHomePreset,
                      onFormationChanged: ref
                          .read(matchFlowProvider)
                          .setHomeFormation,
                      lightCard: true,
                    ),
                    second: _TeamSetupCard(
                      title: 'Away Team',
                      subtitle: 'Preset and formation',
                      team: controller.draftAwayTeam,
                      opponent: controller.draftHomeTeam,
                      isHomeTeam: false,
                      preset: controller.awayPreset,
                      formationCode: controller.awayFormationCode,
                      presetOptions: controller.availablePresets,
                      formationOptions: controller.availableFormations,
                      onPresetChanged: ref
                          .read(matchFlowProvider)
                          .setAwayPreset,
                      onFormationChanged: ref
                          .read(matchFlowProvider)
                          .setAwayFormation,
                      lightCard: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      context.push('/lineup');
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Continue'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Draft ready: ${controller.draftHomeTeam?.summary()} vs ${controller.draftAwayTeam?.summary()}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.black54),
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
    required this.team,
    required this.opponent,
    required this.isHomeTeam,
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
  final Team? team;
  final Team? opponent;
  final bool isHomeTeam;
  final TacticalPreset preset;
  final String formationCode;
  final List<TacticalPreset> presetOptions;
  final List<String> formationOptions;
  final ValueChanged<TacticalPreset> onPresetChanged;
  final ValueChanged<String> onFormationChanged;
  final bool lightCard;

  @override
  Widget build(BuildContext context) {
    final fallbackBackground = lightCard
      ? const Color(0xFFF7F7F1)
      : const Color(0xFF121317);
    final fallbackForeground = lightCard ? Colors.black87 : Colors.white;
    final fallbackBorder = lightCard
      ? const Color(0xFF1B5E20)
      : const Color(0xFFEAEAEA);

    final palette = team == null
      ? null
      : teamColorPalette(
        team!,
        opponent: opponent,
        isHome: isHomeTeam,
        );

    final background = palette?.background ?? fallbackBackground;
    final foreground = palette?.text ?? fallbackForeground;
    final border = palette?.outline ?? fallbackBorder;
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
              labelStyle: TextStyle(color: foreground.withValues(alpha: 0.85)),
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
              labelStyle: TextStyle(color: foreground.withValues(alpha: 0.85)),
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
