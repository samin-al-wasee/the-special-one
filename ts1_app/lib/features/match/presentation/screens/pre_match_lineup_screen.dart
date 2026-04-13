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
    final kickoffAt = controller.match?.kickoffAt ?? DateTime.now();

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
                    _MatchupHeader(
                      home: home,
                      away: away,
                      kickoffAt: kickoffAt,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
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
                                  Tab(text: 'Lineup'),
                                  Tab(text: 'Tactical Info'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  _LineupTab(home: home, away: away),
                                  _TacticalTab(home: home, away: away),
                                ],
                              ),
                            ),
                          ],
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
    final assignments = team.lineup.slotAssignments.toList()
      ..sort((a, b) {
        final depthA = _depthSectionForAssignment(a);
        final depthB = _depthSectionForAssignment(b);
        if (depthA != depthB) {
          return depthA.compareTo(depthB);
        }
        return _lateralLaneForAssignment(a).compareTo(_lateralLaneForAssignment(b));
      });

    final occupancy = <String, int>{};
    final widgets = <Widget>[];
    for (final assignment in assignments) {
      final section = _depthSectionForAssignment(assignment);
      final lane = _lateralLaneForAssignment(assignment);
      final key = '$section-$lane';
      final usedCount = occupancy[key] ?? 0;
      occupancy[key] = usedCount + 1;

      final center = _zoneOffset(
        width: width,
        height: height,
        section: section,
        lane: lane,
        isHome: isHome,
      );

      final spreadOffsets = <double>[0, -10, 10, -18, 18, -24, 24];
      final dx = usedCount < spreadOffsets.length
          ? spreadOffsets[usedCount]
          : (usedCount - 3) * 7.0;

      widgets.add(
        _positionedMarker(
          player: assignment.player,
          center: center.translate(dx, 0),
          isHome: isHome,
        ),
      );
    }

    return widgets;
  }

  Widget _positionedMarker({
    required Player player,
    required Offset center,
    required bool isHome,
  }) {
    return Positioned(
      left: center.dx - 30,
      top: center.dy - 20,
      child: _PlayerMarker(
        name: _shortName(player.name),
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
    final sectionStep = halfHeight / 7;
    final baseInHalf = sectionStep * (section - 0.5);
    final y = isHome ? (height - baseInHalf) : baseInHalf;

    final xFraction = 0.10 + ((lane - 1) * 0.20);
    return Offset(width * xFraction, y);
  }

  int _depthSectionForAssignment(LineupSlotAssignment assignment) {
    final position = assignment.player.position;
    return switch (position) {
      Position.goalKeeper => 1,
      Position.centerBack => 2,
      Position.rightBack || Position.leftBack => 3,
      Position.defensiveMidfielder => 4,
      Position.centralMidfielder => 5,
      Position.attackingMidfielder || Position.rightWinger || Position.leftWinger => 6,
      Position.striker => 7,
    };
  }

  int _lateralLaneForAssignment(LineupSlotAssignment assignment) {
    return switch (assignment.formationSlot.baseZone) {
      PitchZone.lw || PitchZone.lm || PitchZone.lb => 1,
      PitchZone.lhs || PitchZone.lcm || PitchZone.lcb => 2,
      PitchZone.cf || PitchZone.cm || PitchZone.cb => 3,
      PitchZone.rhs || PitchZone.rcm || PitchZone.rcb => 4,
      PitchZone.rw || PitchZone.rm || PitchZone.rb => 5,
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

  String _shortName(String name) {
    final chunks = name.split(' ');
    if (chunks.isEmpty) {
      return 'Player';
    }
    if (chunks.length == 1) {
      return chunks.first;
    }
    return chunks.last;
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
    final color = isHome ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);
    final textColor = isHome ? Colors.white : Colors.black87;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
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
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Container(
          constraints: const BoxConstraints(maxWidth: 60),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.28),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w600,
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

    _drawPenaltyArea(canvas, size, line, top: true);
    _drawPenaltyArea(canvas, size, line, top: false);

    for (var i = 1; i < 7; i++) {
      final y = (size.height / 2 / 7) * i;
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
              Expanded(child: Text(row.homeValue)),
              Expanded(
                child: Text(
                  row.category,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(child: Text(row.awayValue, textAlign: TextAlign.right)),
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
