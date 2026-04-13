import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ts1_core/ts1_core.dart';

import '../../../../app/theme/theme_mode_button.dart';
import '../../application/match_flow_controller.dart';

class PreMatchLineupScreen extends ConsumerWidget {
  const PreMatchLineupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(matchFlowProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lineups & Tactics'),
        actions: const [ThemeModeButton()],
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final home = controller.draftHomeTeam;
          final away = controller.draftAwayTeam;
          final kickoffAt = controller.match?.kickoffAt ?? DateTime.now();

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (home != null && away != null)
                    _MatchupHeader(
                      home: home,
                      away: away,
                      kickoffAt: kickoffAt,
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'Configure Teams',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Theme.of(context).colorScheme.onPrimary,
                              unselectedLabelColor:
                                  Theme.of(context).colorScheme.onSurfaceVariant,
                              tabs: const [
                                Tab(text: 'Tactics'),
                                Tab(text: 'Lineup'),
                                Tab(text: 'Tactical Info'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _TacticsSetupTab(controller: controller),
                                home != null && away != null
                                    ? _LineupTab(home: home, away: away)
                                    : const Center(
                                        child: Text('Select tactics to generate teams'),
                                      ),
                                home != null && away != null
                                    ? _TacticalTab(home: home, away: away)
                                    : const Center(
                                        child: Text('Select tactics to generate teams'),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (home != null && away != null)
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          ref.read(matchFlowProvider).startMatch();
                          context.go('/match');
                        },
                        child: const Text('Kick Off'),
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: null,
                        child: const Text('Kick Off (Select tactics first)'),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TacticsSetupTab extends StatelessWidget {
  const _TacticsSetupTab({required this.controller});

  final MatchFlowController controller;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lightBackground = const Color(0xFFF7F7F1);
    final darkBackground = const Color(0xFF121317);
    final background = isDark ? darkBackground : lightBackground;
    final foreground = isDark ? Colors.white : Colors.black87;
    final border = isDark ? const Color(0xFFEAEAEA) : const Color(0xFF1B5E20);
    final menuTextStyle = TextStyle(color: foreground);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Configure Teams',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select presets and formations for each team. The lineup will update automatically.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: foreground.withValues(alpha: 0.75),
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Home Team',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<TacticalPreset>(
            initialValue: controller.homePreset,
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
            items: controller.availablePresets
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option.label, style: menuTextStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.setHomePreset(value);
                controller.prepareTeams();
              }
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: controller.homeFormationCode,
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
            items: controller.availableFormations
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option, style: menuTextStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.setHomeFormation(value);
                controller.prepareTeams();
              }
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Away Team',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<TacticalPreset>(
            initialValue: controller.awayPreset,
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
            items: controller.availablePresets
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option.label, style: menuTextStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.setAwayPreset(value);
                controller.prepareTeams();
              }
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: controller.awayFormationCode,
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
            items: controller.availableFormations
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option, style: menuTextStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.setAwayFormation(value);
                controller.prepareTeams();
              }
            },
          ),
        ],
      ),
    );
  }
}


class _MatchupHeader extends StatelessWidget {
  const _MatchupHeader({
    required this.home,
    required this.away,
    required this.kickoffAt,
  });

  final Team home;
  final Team away;
  final DateTime kickoffAt;

  @override
  Widget build(BuildContext context) {
    final time = MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.fromDateTime(kickoffAt),
      alwaysUse24HourFormat: true,
    );
    final date = '${kickoffAt.day.toString().padLeft(2, '0')}/'
        '${kickoffAt.month.toString().padLeft(2, '0')}/'
        '${kickoffAt.year}';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            '${home.name} vs ${away.name}',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '$date  •  $time',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _LineupTab extends StatelessWidget {
  const _LineupTab({required this.home, required this.away});

  final Team home;
  final Team away;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 560,
            child: _PitchView(home: home, away: away),
          ),
          const SizedBox(height: 12),
          _FormationSummary(home: home, away: away),
          const SizedBox(height: 12),
          _SquadInfoComparison(home: home, away: away),
        ],
      ),
    );
  }
}

class _PitchView extends StatelessWidget {
  const _PitchView({required this.home, required this.away});

  static const int _halfDepthSections = 9;
  static const int _playerRows = 8;

  final Team home;
  final Team away;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2F7D39), Color(0xFF256B30)],
            ),
          ),
          child: Stack(
            children: [
              CustomPaint(size: Size(width, height), painter: _PitchPainter()),
              ..._buildPlayers(home, width, height, isHome: true),
              ..._buildPlayers(away, width, height, isHome: false),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildPlayers(
    Team team,
    double width,
    double height, {
    required bool isHome,
  }) {
    final sections = <int, List<LineupSlotAssignment>>{};
    for (final assignment in team.lineup.slotAssignments) {
      final section = _depthSectionForAssignment(assignment);
      sections.putIfAbsent(section, () => <LineupSlotAssignment>[]).add(assignment);
    }

    final widgets = <Widget>[];
    final orderedSections = sections.keys.toList()..sort();
    for (final section in orderedSections) {
      final line = sections[section]!
        ..sort((a, b) => _positionSortKey(a.player.position).compareTo(_positionSortKey(b.player.position)));

      for (var i = 0; i < line.length; i++) {
        final assignment = line[i];
        final lane = _columnForAssignment(
          assignment: assignment,
          sectionPlayers: line,
          indexInSection: i,
          section: section,
        );
        final center = _zoneOffset(
          width: width,
          height: height,
          section: section,
          lane: lane,
          isHome: isHome,
        );
        widgets.add(
          _positionedMarker(
            player: assignment.player,
            center: center,
            isHome: isHome,
          ),
        );
      }
    }

    return widgets;
  }

  Widget _positionedMarker({
    required Player player,
    required Offset center,
    required bool isHome,
  }) {
    final topOffset = isHome ? 10.0 : 21.0;
    return Positioned(
      left: center.dx - 32,
      top: center.dy - topOffset,
      child: _PlayerMarker(
        name: player.name,
        positionCode: _positionCode(player.position),
        isHome: isHome,
      ),
    );
  }

  Offset _zoneOffset({
    required double width,
    required double height,
    required int section,
    required int lane,
    required bool isHome,
  }) {
    final halfHeight = height / 2;
    const verticalPadding = 14.0;
    final usableHalf = halfHeight - (verticalPadding * 2);
    final sectionStep = usableHalf / _playerRows;
    final baseInHalf = verticalPadding + (sectionStep * (section - 0.5));
    final y = isHome ? baseInHalf : (height - baseInHalf);

    const laneFractions = <double>[0.14, 0.32, 0.50, 0.68, 0.86];
    final laneIndex = (lane - 1).clamp(0, laneFractions.length - 1);
    final xFraction = laneFractions[laneIndex];
    return Offset(width * xFraction, y);
  }

  List<int> _defaultColumnsForCount(int count) {
    switch (count) {
      case <= 1:
        return const [3];
      case 2:
        return const [2, 4];
      case 3:
        return const [2, 3, 4];
      case 4:
        return const [1, 2, 4, 5];
      default:
        return const [1, 2, 3, 4, 5];
    }
  }

  int _columnForAssignment({
    required LineupSlotAssignment assignment,
    required List<LineupSlotAssignment> sectionPlayers,
    required int indexInSection,
    required int section,
  }) {
    final position = assignment.player.position;

    // Exception rows:
    // Fullbacks (RB/LB) always at 1 and 5.
    if (section == 3 && (position == Position.rightBack || position == Position.leftBack)) {
      return position == Position.leftBack ? 1 : 5;
    }
    // Wingers (RW/LW) always at 1 and 5.
    if (section == 7 && (position == Position.rightWinger || position == Position.leftWinger)) {
      return position == Position.leftWinger ? 1 : 5;
    }

    final defaults = _defaultColumnsForCount(sectionPlayers.length);
    return indexInSection < defaults.length ? defaults[indexInSection] : 3;
  }

  int _positionSortKey(Position position) {
    return switch (position) {
      Position.goalKeeper => 0,
      Position.leftBack => 1,
      Position.centerBack => 2,
      Position.rightBack => 3,
      Position.defensiveMidfielder => 4,
      Position.centralMidfielder => 5,
      Position.attackingMidfielder => 6,
      Position.leftWinger => 7,
      Position.striker => 8,
      Position.rightWinger => 9,
    };
  }

  int _depthSectionForAssignment(LineupSlotAssignment assignment) {
    final position = assignment.player.position;
    return switch (position) {
      Position.goalKeeper => 1,
      Position.centerBack => 2,
      Position.rightBack || Position.leftBack => 3,
      Position.defensiveMidfielder => 4,
      Position.centralMidfielder => 5,
      Position.attackingMidfielder => 6,
      Position.rightWinger || Position.leftWinger => 7,
      Position.striker => 8,
    };
  }

  String _positionCode(Position position) {
    return switch (position) {
      Position.goalKeeper => 'GK',
      Position.rightBack => 'RB',
      Position.centerBack => 'CB',
      Position.leftBack => 'LB',
      Position.defensiveMidfielder => 'DM',
      Position.centralMidfielder => 'CM',
      Position.attackingMidfielder => 'AM',
      Position.rightWinger => 'RW',
      Position.leftWinger => 'LW',
      Position.striker => 'ST',
    };
  }

}

class _PlayerMarker extends StatelessWidget {
  const _PlayerMarker({
    required this.name,
    required this.positionCode,
    required this.isHome,
  });

  final String name;
  final String positionCode;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final color = isHome ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
    final textColor = isHome ? Colors.black87 : Colors.white;
    final nameBar = Container(
      width: 64,
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.30),
        borderRadius: BorderRadius.circular(6),
      ),
      child: _OscillatingMarquee(
        text: name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 7,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return SizedBox(
      width: 64,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isHome) ...[
            nameBar,
            const SizedBox(height: 1),
          ],
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.75)),
            ),
            child: Text(
              positionCode,
              style: TextStyle(
                color: textColor,
                fontSize: 7,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (isHome) ...[
            const SizedBox(height: 1),
            nameBar,
          ],
        ],
      ),
    );
  }
}

class _PitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Colors.white.withValues(alpha: 0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(20),
    );
    canvas.drawRRect(rect, line);

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      line,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.12,
      line,
    );

    _drawPenaltyArea(canvas, size, line, top: true);
    _drawPenaltyArea(canvas, size, line, top: false);

    for (var i = 1; i < _PitchView._halfDepthSections; i++) {
      final y = (size.height / 2 / _PitchView._halfDepthSections) * i;
      final guide = Paint()
        ..color = Colors.white.withValues(alpha: 0.06)
        ..strokeWidth = 1;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), guide);
      canvas.drawLine(
        Offset(0, size.height - y),
        Offset(size.width, size.height - y),
        guide,
      );
    }
  }

  void _drawPenaltyArea(Canvas canvas, Size size, Paint line, {required bool top}) {
    final penaltyWidth = size.width * 0.46;
    final sixYardWidth = size.width * 0.22;
    final penaltyLeft = (size.width - penaltyWidth) / 2;
    final sixYardLeft = (size.width - sixYardWidth) / 2;
    final penaltyHeight = size.height * 0.16;
    final sixYardHeight = size.height * 0.07;
    final y = top ? 0.0 : size.height - penaltyHeight;
    final sixYardY = top ? 0.0 : size.height - sixYardHeight;

    canvas.drawRect(Rect.fromLTWH(penaltyLeft, y, penaltyWidth, penaltyHeight), line);
    canvas.drawRect(Rect.fromLTWH(sixYardLeft, sixYardY, sixYardWidth, sixYardHeight), line);

    final spot = Offset(
      size.width / 2,
      top ? size.height * 0.11 : size.height * 0.89,
    );
    canvas.drawCircle(spot, 2.2, Paint()..color = Colors.white.withValues(alpha: 0.8));

    final arcRect = Rect.fromCircle(center: spot, radius: size.width * 0.10);
    final penaltyLineY = top ? penaltyHeight : size.height - penaltyHeight;
    final radius = size.width * 0.10;
    final delta = (penaltyLineY - spot.dy).abs();
    final ratio = (delta / radius).clamp(0.0, 1.0);
    final alpha = math.asin(ratio);
    final startAngle = top ? alpha : math.pi + alpha;
    final sweep = math.pi - (2 * alpha);
    canvas.drawArc(arcRect, startAngle, sweep, false, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FormationSummary extends StatelessWidget {
  const _FormationSummary({required this.home, required this.away});

  final Team home;
  final Team away;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _InfoChip(
            label: home.name,
            value: 'Formation ${home.lineup.formationShape.code}',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _InfoChip(
            label: away.name,
            value: 'Formation ${away.lineup.formationShape.code}',
            rightAlign: true,
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.value,
    this.rightAlign = false,
  });

  final String label;
  final String value;
  final bool rightAlign;

  @override
  Widget build(BuildContext context) {
    final align = rightAlign ? TextAlign.right : TextAlign.left;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Column(
        crossAxisAlignment:
            rightAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(label, textAlign: align, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 2),
          Text(value, textAlign: align, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _SquadInfoComparison extends StatelessWidget {
  const _SquadInfoComparison({required this.home, required this.away});

  final Team home;
  final Team away;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _TeamSquadPanel(team: home, titleAlign: TextAlign.left)),
        const SizedBox(width: 10),
        Expanded(child: _TeamSquadPanel(team: away, titleAlign: TextAlign.right)),
      ],
    );
  }
}

class _TeamSquadPanel extends StatelessWidget {
  const _TeamSquadPanel({required this.team, required this.titleAlign});

  final Team team;
  final TextAlign titleAlign;

  @override
  Widget build(BuildContext context) {
    final crossAxis =
        titleAlign == TextAlign.right ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bench = team.lineup.bench;
    final reserves = team.lineup.reserves;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Column(
        crossAxisAlignment: crossAxis,
        children: [
          Text(team.name, textAlign: titleAlign, style: Theme.of(context).textTheme.titleMedium),
          Text(
            'Coach: N/A',
            textAlign: titleAlign,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          Text('Subs', textAlign: titleAlign, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          ...bench.take(7).map(
            (p) => Text(
              '${_positionCode(p.position)}  ${p.name}',
              textAlign: titleAlign,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 10),
          Text('Reserves', textAlign: titleAlign, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          ...reserves.take(7).map(
            (p) => Text(
              '${_positionCode(p.position)}  ${p.name}',
              textAlign: titleAlign,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  String _positionCode(Position position) {
    return switch (position) {
      Position.goalKeeper => 'GK',
      Position.rightBack => 'RB',
      Position.centerBack => 'CB',
      Position.leftBack => 'LB',
      Position.defensiveMidfielder => 'DM',
      Position.centralMidfielder => 'CM',
      Position.attackingMidfielder => 'AM',
      Position.rightWinger => 'RW',
      Position.leftWinger => 'LW',
      Position.striker => 'ST',
    };
  }
}

class _TacticalTab extends StatelessWidget {
  const _TacticalTab({required this.home, required this.away});

  final Team home;
  final Team away;

  @override
  Widget build(BuildContext context) {
    final rows = _tacticRows(home.tactic, away.tactic);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: rows.length + 1,
        separatorBuilder: (_, _) => const Divider(height: 16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              children: [
                Expanded(
                  child: Text(home.name, style: Theme.of(context).textTheme.titleSmall),
                ),
                Expanded(
                  child: Text(
                    'Category',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  child: Text(
                    away.name,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            );
          }

          final row = rows[index - 1];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _TacticCell(
                  text: row.homeValue,
                  align: TextAlign.left,
                ),
              ),
              Expanded(
                child: _TacticCell(
                  text: row.category,
                  align: TextAlign.center,
                  bold: true,
                ),
              ),
              Expanded(
                child: _TacticCell(
                  text: row.awayValue,
                  align: TextAlign.right,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<_TacticRow> _tacticRows(TeamTactic homeTactic, TeamTactic awayTactic) {
    return [
      _TacticRow('Build Up', _enumName(homeTactic.buildUpStyle), _enumName(awayTactic.buildUpStyle)),
      _TacticRow('Tempo', _enumName(homeTactic.tempo), _enumName(awayTactic.tempo)),
      _TacticRow('Width', _enumName(homeTactic.width), _enumName(awayTactic.width)),
      _TacticRow('Final Third', _enumName(homeTactic.finalThirdFocus), _enumName(awayTactic.finalThirdFocus)),
      _TacticRow('Attack Focus', _enumName(homeTactic.attackingFocus), _enumName(awayTactic.attackingFocus)),
      _TacticRow('Defensive Line', _enumName(homeTactic.defensiveLine), _enumName(awayTactic.defensiveLine)),
      _TacticRow('Engagement', _enumName(homeTactic.lineOfEngagement), _enumName(awayTactic.lineOfEngagement)),
      _TacticRow('Pressing', _enumName(homeTactic.pressingIntensity), _enumName(awayTactic.pressingIntensity)),
      _TacticRow('Transition Win', _enumName(homeTactic.transitionOnWin), _enumName(awayTactic.transitionOnWin)),
      _TacticRow('Transition Loss', _enumName(homeTactic.transitionOnLoss), _enumName(awayTactic.transitionOnLoss)),
      _TacticRow('Mentality', _enumName(homeTactic.teamMentality), _enumName(awayTactic.teamMentality)),
      _TacticRow('Set Piece Attack', _enumName(homeTactic.setPieceAttack), _enumName(awayTactic.setPieceAttack)),
      _TacticRow('Set Piece Defense', _enumName(homeTactic.setPieceDefense), _enumName(awayTactic.setPieceDefense)),
    ];
  }

  String _enumName(Object value) {
    final raw = value.toString().split('.').last;
    final withSpaces = raw.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (m) => '${m[1]} ${m[2]}',
    );
    return withSpaces[0].toUpperCase() + withSpaces.substring(1);
  }
}

class _TacticRow {
  const _TacticRow(this.category, this.homeValue, this.awayValue);

  final String category;
  final String homeValue;
  final String awayValue;
}

class _TacticCell extends StatelessWidget {
  const _TacticCell({
    required this.text,
    required this.align,
    this.bold = false,
  });

  final String text;
  final TextAlign align;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final cellWidth = align == TextAlign.center ? 120.0 : 110.0;
    final cellAlignment = align == TextAlign.right
        ? Alignment.centerRight
        : align == TextAlign.center
        ? Alignment.center
        : Alignment.centerLeft;

    return SizedBox(
      height: 20,
      child: Align(
        alignment: cellAlignment,
        child: SizedBox(
          width: cellWidth,
          child: _OscillatingMarquee(
            text: text,
            textAlign: align,
            style: TextStyle(
              fontSize: 13,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _OscillatingMarquee extends StatefulWidget {
  const _OscillatingMarquee({
    required this.text,
    required this.style,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  State<_OscillatingMarquee> createState() => _OscillatingMarqueeState();
}

class _OscillatingMarqueeState extends State<_OscillatingMarquee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: widget.text, style: widget.style),
          maxLines: 1,
          textDirection: Directionality.of(context),
        )..layout();

        final available = constraints.maxWidth;
        final overflow = painter.width > available;
        if (!overflow) {
          return Align(
            alignment: _alignmentFor(widget.textAlign),
            child: Text(
              widget.text,
              style: widget.style,
              maxLines: 1,
              overflow: TextOverflow.clip,
              textAlign: widget.textAlign,
            ),
          );
        }

        const edgeSafety = 2.0;
        final shift = (painter.width - available + edgeSafety).clamp(0.0, double.infinity);
        return ClipRect(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-shift * _controller.value, 0),
                child: child,
              );
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  widget.text,
                  maxLines: 1,
                  softWrap: false,
                  style: widget.style,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Alignment _alignmentFor(TextAlign align) {
    switch (align) {
      case TextAlign.right:
      case TextAlign.end:
        return Alignment.centerRight;
      case TextAlign.center:
        return Alignment.center;
      default:
        return Alignment.centerLeft;
    }
  }
}
