import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_mode_controller.dart';

class ThemeModeButton extends ConsumerWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(appThemeModeProvider);

    return PopupMenuButton<ThemeMode>(
      tooltip: 'Theme mode',
      icon: Icon(_iconFor(currentMode)),
      onSelected: (mode) {
        ref.read(appThemeModeProvider.notifier).setThemeMode(mode);
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: ThemeMode.system,
            child: _ThemeMenuItem(
              title: 'System',
              selected: currentMode == ThemeMode.system,
            ),
          ),
          PopupMenuItem(
            value: ThemeMode.light,
            child: _ThemeMenuItem(
              title: 'Light',
              selected: currentMode == ThemeMode.light,
            ),
          ),
          PopupMenuItem(
            value: ThemeMode.dark,
            child: _ThemeMenuItem(
              title: 'Dark',
              selected: currentMode == ThemeMode.dark,
            ),
          ),
        ];
      },
    );
  }

  IconData _iconFor(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => Icons.brightness_auto_rounded,
      ThemeMode.light => Icons.light_mode_rounded,
      ThemeMode.dark => Icons.dark_mode_rounded,
    };
  }
}

class _ThemeMenuItem extends StatelessWidget {
  const _ThemeMenuItem({
    required this.title,
    required this.selected,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        if (selected) const Icon(Icons.check_rounded, size: 18),
      ],
    );
  }
}
