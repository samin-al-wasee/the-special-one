import 'dart:convert';

import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';

class TeamMapper {
  // =========================
  // 🔹 DB → DOMAIN
  // =========================
  static Team toDomain(
    NationalTeamRecord teamRow,
    TeamTactic nationalTeamTactic,
    TeamLineup nationalTeamLineup,
  ) {
    return Team(
      id: teamRow.id,
      name: teamRow.name,
      tactic: nationalTeamTactic,
      lineup: nationalTeamLineup,
      squad:
          [], // Squad is not stored in the lineup JSON, so we start with an empty list
    );
  }

  // =========================
  // 🔹 DOMAIN → DB
  // =========================
  static NationalTeamRecord toRecord(Team team) {
    return NationalTeamRecord(
      id: team.id,
      name: team.name,
      countryId:
          0, // Country ID is not directly stored in the Team model, so we set it to a default value (this may need to be handled differently based on your app's structure)
      lineup: jsonEncode(team.lineup.toJson()),
    );
  }
}
