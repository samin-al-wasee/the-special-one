import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/enums/match_enums.dart';

part 'match_dynamics.freezed.dart';
part 'match_dynamics.g.dart';

@freezed
abstract class MatchDynamics with _$MatchDynamics {
  const factory MatchDynamics({
    @Default(0.0) double homeMomentum,
    @Default(0.0) double awayMomentum,
    @Default(0.5) double homeConfidence,
    @Default(0.5) double awayConfidence,
    @Default(0.0) double homeFatigue,
    @Default(0.0) double awayFatigue,
    @Default(0.0) double homeDisciplinePressure,
    @Default(0.0) double awayDisciplinePressure,
    @Default(<PitchZone, double>{}) Map<PitchZone, double> homeZoneDominance,
    @Default(<PitchZone, double>{}) Map<PitchZone, double> awayZoneDominance,
    @Default(<String, int>{}) Map<String, int> exploitationCounters,
  }) = _MatchDynamics;

  factory MatchDynamics.fromJson(Map<String, dynamic> json) =>
      _$MatchDynamicsFromJson(json);

  const MatchDynamics._();

  MatchDynamics increaseFatigue(TeamSide side, double amount) {
    if (side == TeamSide.home) {
      return copyWith(homeFatigue: (homeFatigue + amount).clamp(0.0, 1.0));
    }
    return copyWith(awayFatigue: (awayFatigue + amount).clamp(0.0, 1.0));
  }

  MatchDynamics swingMomentum(TeamSide side, double delta) {
    if (side == TeamSide.home) {
      return copyWith(
        homeMomentum: (homeMomentum + delta).clamp(-1.0, 1.0),
        awayMomentum: (awayMomentum - delta).clamp(-1.0, 1.0),
      );
    }
    return copyWith(
      awayMomentum: (awayMomentum + delta).clamp(-1.0, 1.0),
      homeMomentum: (homeMomentum - delta).clamp(-1.0, 1.0),
    );
  }

  MatchDynamics markExploitation(String key) {
    final next = Map<String, int>.from(exploitationCounters);
    next[key] = (next[key] ?? 0) + 1;
    return copyWith(exploitationCounters: next);
  }

  MatchDynamics updateZoneDominance(TeamSide side, PitchZone zone, double delta) {
    if (side == TeamSide.home) {
      final next = Map<PitchZone, double>.from(homeZoneDominance);
      next[zone] = ((next[zone] ?? 0.0) + delta).clamp(-1.0, 1.0);
      return copyWith(homeZoneDominance: next);
    }
    final next = Map<PitchZone, double>.from(awayZoneDominance);
    next[zone] = ((next[zone] ?? 0.0) + delta).clamp(-1.0, 1.0);
    return copyWith(awayZoneDominance: next);
  }

  MatchDynamics ensureZoneMapsInitialized() {
    if (homeZoneDominance.isNotEmpty && awayZoneDominance.isNotEmpty) {
      return this;
    }
    return copyWith(
      homeZoneDominance: _zoneDefaults(homeZoneDominance),
      awayZoneDominance: _zoneDefaults(awayZoneDominance),
    );
  }

  static Map<PitchZone, double> _zoneDefaults(Map<PitchZone, double> current) {
    final map = <PitchZone, double>{
      for (final zone in PitchZone.values) zone: 0.0,
    };
    map.addAll(current);
    return map;
  }
}