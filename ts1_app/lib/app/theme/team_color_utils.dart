import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ts1_core/ts1_core.dart';

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

// Decide background and accent for home/away presentation.
// For home: background = primary, accent = secondary, tertiary for text/support
// For away: if primary is different enough from home primary, use it; else use secondary
Map<String, Color> colorsForTeams(Team home, Team away) {
  final homePrimary = parseHexColor(home.primaryColor);
  final homeSecondary = parseHexColor(home.secondaryColor);

  final awayPrimary = parseHexColor(away.primaryColor);
  final awaySecondary = parseHexColor(away.secondaryColor);
  final awayTertiary = parseHexColor(away.tertiaryColor);

  final awayBg = _isDifferentEnough(awayPrimary, homePrimary) ? awayPrimary : awaySecondary;

  return {
    'homeBg': homePrimary,
    'homeAccent': homeSecondary,
    'homeText': foregroundForBackground(homePrimary),
    'awayBg': awayBg,
    'awayAccent': awayTertiary,
    'awayText': foregroundForBackground(awayBg),
  };
}
