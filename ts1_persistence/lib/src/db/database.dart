import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';

import 'daos/country_dao.dart';
import 'tables/players.dart';
import 'tables/continents.dart';
import 'tables/countries.dart';
import 'tables/national_teams.dart';

import 'seeds/continent_seed.dart';
import 'seeds/country_seed.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Players, Continents, Countries, NationalTeams],
  daos: [CountryDao, PlayerDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedContinents();
      await _seedCountries();
      await _seedNationalTeams();
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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('ts1_default.db');
    return NativeDatabase(file);
  });
}
