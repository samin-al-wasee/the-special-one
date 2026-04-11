import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/catalog/role_catalog.dart';
import 'package:ts1_core/src/core/enums/player/duty.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';
import 'package:ts1_core/src/core/enums/player/role.dart';
import 'package:ts1_core/src/team/models/lineup/formation/shape/formation_shape.dart';
import 'package:ts1_core/src/team/models/lineup/slot_assignment/lineup_slot_assignment.dart';
import 'package:ts1_core/src/player/models/player.dart';
import 'package:ts1_core/src/team/models/lineup/slot_assignment/role_assignment/role_assignment.dart';

part 'team_lineup.freezed.dart';
part 'team_lineup.g.dart';

@freezed
abstract class TeamLineup with _$TeamLineup {
  /// Matchday lineup structure with formation and slot assignments.
  const factory TeamLineup({
    required int id,
    required FormationShape formationShape,
    @Default([]) List<LineupSlotAssignment> slotAssignments,
    @Default([]) List<Player> bench,
    @Default([]) List<Player> reserves,
    Player? captain,
  }) = _TeamLineup;

  factory TeamLineup.fromJson(Map<String, dynamic> json) =>
      _$TeamLineupFromJson(json);

  const TeamLineup._();

  List<int> starterIds() {
    return [for (final assignment in slotAssignments) assignment.player.id];
  }

  void validate() {
    final slotIds = <String>{
      for (final slot in formationShape.slotDefinitions) slot.slotId,
    };
    final assignedSlots = [
      for (final assignment in slotAssignments) assignment.formationSlot.slotId,
    ];
    final assignedSlotSet = assignedSlots.toSet();

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

    final missingSlots = [
      for (final slotId in slotIds)
        if (!assignedSlotSet.contains(slotId)) slotId,
    ];
    if (missingSlots.isNotEmpty) {
      throw ArgumentError('Missing formation slot assignments: $missingSlots');
    }

    final starters = starterIds();
    if (starters.toSet().length != starters.length) {
      throw ArgumentError(
        'Same player was assigned to multiple formation slots.',
      );
    }

    for (final assignment in slotAssignments) {
      final slotId = assignment.formationSlot.slotId;
      final canonicalSlot = formationShape.slotById(slotId);
      if (canonicalSlot == null) {
        continue;
      }

      // Prevent stale/contradictory slot snapshots in assignment payloads.
      if (assignment.formationSlot != canonicalSlot) {
        throw ArgumentError(
          'Slot snapshot mismatch for "$slotId". Use formationShape.slotById(slotId) as source of truth.',
        );
      }

      if (!canonicalSlot.hasCanonicalBandMapping()) {
        throw ArgumentError(
          'Non-canonical zone-band mapping in slot "$slotId": ${canonicalSlot.baseZone}/${canonicalSlot.lateralBand}/${canonicalSlot.verticalBand}.',
        );
      }

      final role = assignment.roleAssignment.roleName;
      final duty = assignment.roleAssignment.duty;
      final playerPosition = assignment.player.position;

      final supportedPositions =
          roleSupportedPositions[role] ?? const <Position>{};
      if (supportedPositions.isNotEmpty &&
          !supportedPositions.contains(playerPosition)) {
        throw ArgumentError(
          'Role-position mismatch for slot "$slotId": role "$role" does not support position "$playerPosition".',
        );
      }

      final supportedDuties = roleSupportedDuties[role] ?? const <Duty>{};
      if (supportedDuties.isNotEmpty && !supportedDuties.contains(duty)) {
        throw ArgumentError(
          'Role-duty mismatch for slot "$slotId": duty "$duty" is not valid for role "$role".',
        );
      }
    }

    if (captain != null) {
      final availablePlayerIds = <int>{
        ...starterIds(),
        for (final player in bench) player.id,
        for (final player in reserves) player.id,
      };
      if (!availablePlayerIds.contains(captain!.id)) {
        throw ArgumentError(
          'Captain must belong to starters, bench, or reserves.',
        );
      }
    }
  }

  Map<int, Player> toPlayerLookup(List<Player> players) {
    return {for (final player in players) player.id: player};
  }

  List<Player> orderedStarterPlayers(List<Player> players) {
    final byId = toPlayerLookup(players);
    final ordered = <Player>[];

    for (final slot in formationShape.slotDefinitions) {
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

  TeamLineup clone() {
    return TeamLineup(
      id: id,
      formationShape: formationShape,
      slotAssignments: List<LineupSlotAssignment>.from(slotAssignments),
      bench: List<Player>.from(bench),
      reserves: List<Player>.from(reserves),
      captain: captain,
    );
  }

  static TeamLineup fromPlayers({
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
        throw StateError(
          'Cannot build lineup: not enough players to fill formation slot ${slot.slotId}.',
        );
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

    final lineup = TeamLineup(
      id: 0, // Replace with actual ID if needed
      formationShape: formation,
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
