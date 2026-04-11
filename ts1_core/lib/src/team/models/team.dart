import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/team/models/lineup/team_lineup.dart';
import 'package:ts1_core/src/player/models/player.dart';
import 'package:ts1_core/src/team/models/tactic/team_tactic.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
abstract class Team with _$Team {
  const factory Team({
    required int id,
    required String name,
    required TeamTactic tactic,
    required TeamLineup lineup,
    @Default([]) List<Player> squad,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  const Team._();

  /// Combined unique players from lineup + squad.
  List<Player> get allPlayers {
    final fromLineup = lineup.orderedStarterPlayers(_candidatePlayers);
    final merged = <Player>[
      ...fromLineup,
      ...lineup.bench,
      ...lineup.reserves,
      ...squad,
    ];
    return _dedupePlayers(merged);
  }

  /// Total selected matchday group size.
  int squadSize() {
    return lineup.slotAssignments.length +
        lineup.bench.length +
        lineup.reserves.length;
  }

  String summary() {
    return '$name | Formation: ${lineup.formationShape.code} | Squad: ${squadSize()}';
  }

  Team setLineup(TeamLineup newLineup) {
    newLineup.validate();
    final mergedSquad = _dedupePlayers([
      ...squad,
      ...newLineup.bench,
      ...newLineup.reserves,
    ]);
    return copyWith(lineup: newLineup, squad: mergedSquad);
  }

  Team get matchdayCopy {
    return copyWith(lineup: lineup.clone(), squad: List<Player>.from(squad));
  }

  List<Player> get _candidatePlayers {
    return _dedupePlayers([...squad, ...lineup.bench, ...lineup.reserves]);
  }

  static List<Player> _dedupePlayers(List<Player> players) {
    final seen = <int>{};
    final unique = <Player>[];
    for (final player in players) {
      if (seen.add(player.id)) {
        unique.add(player);
      }
    }
    return unique;
  }
}
