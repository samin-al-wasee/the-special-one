import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/catalog/role_catalog.dart';
import 'package:ts1_core/src/enums/duty.dart';
import 'package:ts1_core/src/enums/role.dart';
import 'package:ts1_core/src/models/formation_shape.dart';
import 'package:ts1_core/src/models/lineup_slot_assignment.dart';
import 'package:ts1_core/src/models/player.dart';
import 'package:ts1_core/src/models/role_assignment.dart';

part 'lineup.freezed.dart';
part 'lineup.g.dart';

@freezed
abstract class Lineup with _$Lineup {
  /// Matchday lineup structure with formation and slot assignments.
  const factory Lineup({
    required int id,
    required FormationShape formation,
    @Default([]) List<LineupSlotAssignment> slotAssignments,
    @Default([]) List<Player> bench,
    @Default([]) List<Player> reserves,
    Player? captain,
  }) = _Lineup;

  factory Lineup.fromJson(Map<String, dynamic> json) => _$LineupFromJson(json);

  const Lineup._();

  List<int> starterIds() {
    return [for (final assignment in slotAssignments) assignment.player.id];
  }

  void validate() {
    final slotIds = <String>{
      for (final slot in formation.slotDefinitions) slot.slotId,
    };
    final assignedSlots = [
      for (final assignment in slotAssignments) assignment.formationSlot.slotId,
    ];

    if (assignedSlots.toSet().length != assignedSlots.length) {
      throw ArgumentError('Duplicate slot assignment detected in lineup.');
    }

    final unknownSlots = [
      for (final slotId in assignedSlots)
        if (!slotIds.contains(slotId)) slotId,
    ];
    if (unknownSlots.isNotEmpty) {
      throw ArgumentError('Unknown formation slot ids: $unknownSlots');
    }

    final starters = starterIds();
    if (starters.toSet().length != starters.length) {
      throw ArgumentError(
        'Same player was assigned to multiple formation slots.',
      );
    }
  }

  Map<int, Player> toPlayerLookup(List<Player> players) {
    return {for (final player in players) player.id: player};
  }

  List<Player> orderedStarterPlayers(List<Player> players) {
    final byId = toPlayerLookup(players);
    final ordered = <Player>[];

    for (final slot in formation.slotDefinitions) {
      final assignment = slotAssignments
          .where((a) {
            return a.formationSlot.slotId == slot.slotId &&
                byId.containsKey(a.player.id);
          })
          .cast<LineupSlotAssignment?>()
          .firstWhere((a) => a != null, orElse: () => null);

      if (assignment != null) {
        ordered.add(byId[assignment.player.id]!);
      }
    }

    return ordered;
  }

  Lineup clone() {
    return Lineup(
      id: id,
      formation: formation,
      slotAssignments: List<LineupSlotAssignment>.from(slotAssignments),
      bench: List<Player>.from(bench),
      reserves: List<Player>.from(reserves),
      captain: captain,
    );
  }

  static Lineup fromPlayers({
    required FormationShape formation,
    required List<Player> players,
    List<Player>? bench,
    List<Player>? reserves,
    Player? captain,
  }) {
    final unassigned = List<Player>.from(players);
    final assignments = <LineupSlotAssignment>[];

    for (final slot in formation.slotDefinitions) {
      var chosenIdx = -1;

      for (var idx = 0; idx < unassigned.length; idx++) {
        final player = unassigned[idx];
        if (slot.preferredPositions.isNotEmpty &&
            slot.preferredPositions.contains(player.position)) {
          chosenIdx = idx;
          break;
        }
      }

      if (chosenIdx < 0 && unassigned.isNotEmpty) {
        chosenIdx = 0;
      }
      if (chosenIdx < 0) {
        break;
      }

      final player = unassigned.removeAt(chosenIdx);
      assignments.add(
        LineupSlotAssignment(
          id: 0, // Replace with actual ID if needed
          formationSlot: slot,
          player: player,
          roleAssignment: _defaultRoleAssignmentFor(player),
        ),
      );
    }

    final lineup = Lineup(
      id: 0, // Replace with actual ID if needed
      formation: formation,
      slotAssignments: assignments,
      bench: List<Player>.from(bench ?? const []),
      reserves: List<Player>.from(reserves ?? const []),
      captain: captain,
    );
    lineup.validate();
    return lineup;
  }

  static RoleAssignment _defaultRoleAssignmentFor(Player player) {
    final role =
        roleSupportedPositions.entries
            .where((entry) => entry.value.contains(player.position))
            .map((entry) => entry.key)
            .cast<Role?>()
            .firstWhere((r) => r != null, orElse: () => null) ??
        Role.advancedForward;

    final supportedDuties =
        roleSupportedDuties[role] ?? const <Duty>{Duty.support};
    final duty = supportedDuties.contains(Duty.support)
        ? Duty.support
        : supportedDuties.first;

    return RoleAssignment(id: 0, roleName: role, duty: duty);
  }
}
