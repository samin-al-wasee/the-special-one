import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ts1_core/ts1_core.dart';

class TeamColorPalette {
  const TeamColorPalette({
    required this.background,
    required this.outline,
    required this.text,
  });

  final Color background;
  final Color outline;
  final Color text;
}

Color parseHexColor(String hex) {
  var s = hex.trim();
  if (s.startsWith('#')) s = s.substring(1);
  if (s.length == 3) {
    s = s.split('').map((c) => '$c$c').join();
  }
  return Color(int.parse('ff$s', radix: 16));
}

bool _isDifferentEnough(Color a, Color b, [double threshold = 120.0]) {
  final ar = a.r;
  final ag = a.g;
  final ab = a.b;

  final br = b.r;
  final bg = b.g;
  final bb = b.b;

  final dr = (ar - br).toDouble();
  final dg = (ag - bg).toDouble();
  final db = (ab - bb).toDouble();
  final dist = math.sqrt(dr * dr + dg * dg + db * db);
  return dist >= threshold;
}

Color foregroundForBackground(Color bg) {
  // Compute relative luminance
  final l = bg.computeLuminance();
  return l > 0.5 ? Colors.black87 : Colors.white;
}

TeamColorPalette teamColorPalette(
  Team team, {
  Team? opponent,
  required bool isHome,
}) {
  final primary = parseHexColor(team.primaryColor);
  final secondary = parseHexColor(team.secondaryColor);
  final tertiary = parseHexColor(team.tertiaryColor);

  final background = isHome
      ? primary
      : opponent == null
      ? secondary
      : _isDifferentEnough(secondary, parseHexColor(opponent.primaryColor))
      ? secondary
      : primary;

  return TeamColorPalette(
    background: background,
    outline: tertiary,
    text: tertiary,
  );
}

// Decide background and accent for home/away presentation.
// Home uses primary. Away uses secondary when it is distinct enough from the
// home primary, otherwise it falls back to its primary. Outline/text use tertiary.
Map<String, Color> colorsForTeams(Team home, Team away) {
  final homePalette = teamColorPalette(home, isHome: true);
  final awayPalette = teamColorPalette(away, opponent: home, isHome: false);

  return {
    'homeBg': homePalette.background,
    'homeAccent': homePalette.outline,
    'homeText': homePalette.text,
    'awayBg': awayPalette.background,
    'awayAccent': awayPalette.outline,
    'awayText': awayPalette.text,
  };
}
