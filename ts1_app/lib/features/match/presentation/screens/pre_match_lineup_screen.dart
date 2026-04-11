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
    final home = controller.draftHomeTeam;
    final away = controller.draftAwayTeam;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lineups & Tactics'),
        actions: const [ThemeModeButton()],
      ),
      body: home == null || away == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No prepared teams yet.'),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => context.go('/setup'),
                    child: const Text('Back to Setup'),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _TeamNamesRow(home: home, away: away),
                    const SizedBox(height: 12),
                    Expanded(
                      child: _PitchView(
                        home: home,
                        away: away,
                        onShowHomeSubs: () => _showSquadBottomSheet(
                          context,
                          title: '${home.name} Subs & Reserves',
                          bench: home.lineup.bench,
                          reserves: home.lineup.reserves,
                        ),
                        onShowAwaySubs: () => _showSquadBottomSheet(
                          context,
                          title: '${away.name} Subs & Reserves',
                          bench: away.lineup.bench,
                          reserves: away.lineup.reserves,
                        ),
                        onShowHomeTactics: () => _showTacticsDialog(
                          context,
                          title: '${home.name} Tactics',
                          tacticSummary: home.tactic.summary(),
                        ),
                        onShowAwayTactics: () => _showTacticsDialog(
                          context,
                          title: '${away.name} Tactics',
                          tacticSummary: away.tactic.summary(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          ref.read(matchFlowProvider).startMatch();
                          context.go('/match');
                        },
                        child: const Text('Kick Off'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _showTacticsDialog(
    BuildContext context, {
    required String title,
    required String tacticSummary,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(child: Text(tacticSummary)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showSquadBottomSheet(
    BuildContext context, {
    required String title,
    required List<Player> bench,
    required List<Player> reserves,
  }) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Text('Subs', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                ...bench.map((player) => Text('${player.name} (${player.position.name})')),
                const SizedBox(height: 12),
                Text('Reserves', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                ...reserves.map((player) => Text('${player.name} (${player.position.name})')),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TeamNamesRow extends StatelessWidget {
  const _TeamNamesRow({required this.home, required this.away});

  final Team home;
  final Team away;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${home.name} (${home.lineup.formationShape.code})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '${away.name} (${away.lineup.formationShape.code})',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

class _PitchView extends StatelessWidget {
  const _PitchView({
    required this.home,
    required this.away,
    required this.onShowHomeSubs,
    required this.onShowAwaySubs,
    required this.onShowHomeTactics,
    required this.onShowAwayTactics,
  });

  final Team home;
  final Team away;
  final VoidCallback onShowHomeSubs;
  final VoidCallback onShowAwaySubs;
  final VoidCallback onShowHomeTactics;
  final VoidCallback onShowAwayTactics;

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
              CustomPaint(
                size: Size(width, height),
                painter: _PitchPainter(),
              ),
              ..._buildPlayers(home, width, height, isHome: true),
              ..._buildPlayers(away, width, height, isHome: false),
              Positioned(
                top: 8,
                left: 8,
                child: OutlinedButton(
                  onPressed: onShowHomeSubs,
                  child: const Text('Home Subs'),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: OutlinedButton(
                  onPressed: onShowAwaySubs,
                  child: const Text('Away Subs'),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: OutlinedButton(
                  onPressed: onShowHomeTactics,
                  child: const Text('Home Tactics'),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: OutlinedButton(
                  onPressed: onShowAwayTactics,
                  child: const Text('Away Tactics'),
                ),
              ),
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
    final widgets = <Widget>[];
    for (final assignment in team.lineup.slotAssignments) {
      final player = assignment.player;
      final slot = assignment.formationSlot;
      final offset = _slotOffset(slot, width, height, isHome: isHome);
      widgets.add(
        Positioned(
          left: offset.dx - 16,
          top: offset.dy - 16,
          child: _PlayerDot(
            label: _shortName(player.name),
            isHome: isHome,
          ),
        ),
      );
    }
    return widgets;
  }

  Offset _slotOffset(
    FormationSlot slot,
    double width,
    double height, {
    required bool isHome,
  }) {
    final xBand = switch (slot.lateralBand) {
      SlotLateralBand.leftWide => 0.10,
      SlotLateralBand.leftHalfSpace => 0.30,
      SlotLateralBand.center => 0.50,
      SlotLateralBand.rightHalfSpace => 0.70,
      SlotLateralBand.rightWide => 0.90,
    };

    final yBand = switch (slot.verticalBand) {
      SlotVerticalBand.deep => 0.82,
      SlotVerticalBand.mid => 0.67,
      SlotVerticalBand.high => 0.52,
    };

    final y = isHome ? yBand : 1.0 - yBand;
    return Offset(width * xBand, height * y);
  }

  String _shortName(String name) {
    final chunks = name.split(' ');
    if (chunks.isEmpty) {
      return 'P';
    }
    if (chunks.length == 1) {
      return chunks.first.substring(0, math.min(2, chunks.first.length)).toUpperCase();
    }
    final first = chunks.first.isNotEmpty ? chunks.first[0] : '';
    final last = chunks.last.isNotEmpty ? chunks.last[0] : '';
    final value = '$first$last'.toUpperCase();
    return value.isEmpty ? 'P' : value;
  }
}

class _PlayerDot extends StatelessWidget {
  const _PlayerDot({required this.label, required this.isHome});

  final String label;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final color = isHome ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);
    final textColor = isHome ? Colors.white : Colors.black87;

    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.75)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
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

    final boxWidth = size.width * 0.46;
    final boxLeft = (size.width - boxWidth) / 2;
    canvas.drawRect(Rect.fromLTWH(boxLeft, 0, boxWidth, size.height * 0.16), line);
    canvas.drawRect(
      Rect.fromLTWH(boxLeft, size.height * 0.84, boxWidth, size.height * 0.16),
      line,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
