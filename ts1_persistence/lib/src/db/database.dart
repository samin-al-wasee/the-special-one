import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';

import 'daos/country_dao.dart';
import 'tables/players.dart';
import 'tables/continents.dart';
import 'tables/countries.dart';
import 'tables/national_teams.dart';
import 'tables/national_team_tactics.dart';

import 'seeds/continent_seed.dart';
import 'seeds/country_seed.dart';
import 'seeds/national_team_tactics_seed.dart';
part 'database.g.dart';

@DriftDatabase(
  tables: [Players, Continents, Countries, NationalTeams, NationalTeamTactics],
  daos: [CountryDao, PlayerDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedContinents();
      await _seedCountries();
      await _seedNationalTeams();
      await _seedNationalTeamTactics();
    },
    onUpgrade: (m, from, to) async {
      if (from == 1) {
        await m.deleteTable('national_team_tactics');
        await m.createTable(nationalTeamTactics);
        await _seedNationalTeamTactics();
      }
    },
  );

  Future<void> _seedContinents() async {
    final List<dynamic> continents = jsonDecode(continentSeedJson);
    for (var continent in continents) {
      await into(this.continents).insert(
        ContinentsCompanion(
          id: Value(continent['id']),
          name: Value(continent['name']),
          code: Value(continent['code']),
        ),
      );
    }
  }

  Future<void> _seedCountries() async {
    final List<dynamic> countries = jsonDecode(countrySeedJson);
    for (var country in countries) {
      await into(this.countries).insert(
        CountriesCompanion(
          id: Value(country['id']),
          name: Value(country['name']),
          code: Value(country['code']),
          continentId: Value(country['continentId']),
        ),
      );
    }
  }

  Future<void> _seedNationalTeams() async {
    // First, ensure countries are already seeded
    final allCountries = await select(countries).get();

    for (var country in allCountries) {
      // Generate national team name: e.g., "France National Team"
      final teamName = '${country.name} National Team';

      await into(nationalTeams).insert(
        NationalTeamsCompanion(
          id: Value(country.id), // Using same ID as country for consistency
          countryId: Value(country.id),
          name: Value(teamName),
        ),
      );
    }
  }

  Future<void> _seedNationalTeamTactics() async {
    // First, ensure national teams are already seeded
    final allTeams = await select(nationalTeams).get();

    for (var team in allTeams) {
      // Get the tactical preset for this team from the seed data
      final preset =
          nationalTeamTacticsSeed[team.id] ?? TacticalPreset.balanced;
      final nationalTeamTactic = TacticalPresetFactory.create(preset);

      await into(nationalTeamTactics).insert(
        NationalTeamTacticsCompanion(
          teamId: Value(team.id),
          presetName: Value(preset.label),
          buildUpStyle: Value(nationalTeamTactic.buildUpStyle.label),
          tempo: Value(nationalTeamTactic.tempo.label),
          width: Value(nationalTeamTactic.width.label),
          finalThirdFocus: Value(nationalTeamTactic.finalThirdFocus.label),
          attackingFocus: Value(nationalTeamTactic.attackingFocus.label),
          defensiveLine: Value(nationalTeamTactic.defensiveLine.label),
          lineOfEngagement: Value(nationalTeamTactic.lineOfEngagement.label),
          pressingIntensity: Value(nationalTeamTactic.pressingIntensity.label),
          defensiveWidth: Value(nationalTeamTactic.defensiveWidth.label),
          markingStyle: Value(nationalTeamTactic.markingStyle.label),
          tacklingAggression: Value(
            nationalTeamTactic.tacklingAggression.label,
          ),
          transitionOnWin: Value(nationalTeamTactic.transitionOnWin.label),
          transitionOnLoss: Value(nationalTeamTactic.transitionOnLoss.label),
          teamMentality: Value(nationalTeamTactic.teamMentality.label),
          passingRisk: Value(nationalTeamTactic.passingRisk.label),
          dribblingRisk: Value(nationalTeamTactic.dribblingRisk.label),
          shootingPolicy: Value(nationalTeamTactic.shootingPolicy.label),
          compactness: Value(nationalTeamTactic.compactness.label),
          verticalStretch: Value(nationalTeamTactic.verticalStretch.label),
          overloadFocus: Value(nationalTeamTactic.overloadFocus.label),
          setPieceAttack: Value(nationalTeamTactic.setPieceAttack.label),
          setPieceDefense: Value(nationalTeamTactic.setPieceDefense.label),
          freeKickStrategy: Value(nationalTeamTactic.freeKickStrategy.label),
        ),
      );
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('ts1_default.db');
    return NativeDatabase(file);
  });
}
