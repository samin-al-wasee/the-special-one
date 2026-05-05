import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/mappers/player_mapper.dart';
import 'package:ts1_persistence/src/mappers/team_lineup_mapper.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';
import 'package:ts1_persistence/src/db/daos/national_team_dao.dart';
import 'package:ts1_persistence/src/utils/player_generation_helper.dart';

import 'daos/country_dao.dart';
import 'tables/players.dart';
import 'tables/continents.dart';
import 'tables/countries.dart';
import 'tables/national_teams.dart';

import 'seeds/continent_seed.dart';
import 'seeds/country_seed.dart';
import 'seeds/national_team_color_seed.dart';
import 'seeds/national_team_tactics_seed.dart';
part 'database.g.dart';

@DriftDatabase(
  tables: [Players, Continents, Countries, NationalTeams],
  daos: [CountryDao, PlayerDao, NationalTeamDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static String? _dbPath;

  /// Set the database file path before opening the database.
  /// Call this during app initialization to use a custom location.
  static void setDatabasePath(String path) {
    _dbPath = path;
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      print('Creating database schema and seeding initial data...');
      await customStatement('PRAGMA foreign_keys = OFF');
      await customStatement('DROP TABLE IF EXISTS national_teams');
      await customStatement('DROP TABLE IF EXISTS players');
      await customStatement('DROP TABLE IF EXISTS countries');
      await customStatement('DROP TABLE IF EXISTS continents');

      await m.createAll();
      await _seedContinents();
      await _seedCountries();
      final helper = PlayerGenerationHelper(this);
      await helper.run(playersPerCountry: 100);
      await _seedNationalTeams();
      await customStatement('PRAGMA foreign_keys = ON');
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
      final lineupJson = await _buildLineupJsonForCountry(country);

      if (lineupJson == null) {
        throw StateError(
          'Cannot seed team "$teamName": no players found for country ${country.id}.',
        );
      }

      final colors = nationalTeamColorsSeed[country.id];
      if (colors == null) {
        throw StateError(
          'Cannot seed team "$teamName": no color seed found for country ${country.id}.',
        );
      }

      // Determine tactical preset for this country and serialize to JSON
      final preset = nationalTeamTacticsSeed[country.id] ?? TacticalPreset.balanced;
      final nationalTeamTactic = TacticalPresetFactory.create(preset);
      final tacticJson = jsonEncode(nationalTeamTactic.toJson());

      await into(nationalTeams).insert(
        NationalTeamsCompanion(
          id: Value(country.id), // Using same ID as country for consistency
          countryId: Value(country.id),
          name: Value(teamName),
          lineup: Value(lineupJson),
          tactics: Value(tacticJson),
          primaryColor: Value(colors['primaryColor']!),
          secondaryColor: Value(colors['secondaryColor']!),
          tertiaryColor: Value(colors['tertiaryColor']!),
        ),
      );
    }
  }

  Future<String?> _buildLineupJsonForCountry(CountryRecord country) async {
    final playerRows = await (select(
      players,
    )..where((p) => p.countryId.equals(country.id))).get();

    if (playerRows.isEmpty) {
      return null;
    }

    final roster = [
      for (final playerRow in playerRows)
        PlayerMapper.toDomain(playerRow, country),
    ];

    final formation = FormationFactory.byCode('4-3-3');
    final baseLineup = TeamLineup.fromPlayers(
      formation: formation,
      players: roster,
    );

    final starterIds = baseLineup.starterIds().toSet();
    final remainingPlayers = roster
        .where((player) => !starterIds.contains(player.id))
        .toList();
    final bench = remainingPlayers.take(7).toList();
    final reserves = remainingPlayers.skip(7).take(4).toList();
    final captain = _pickCaptain(baseLineup);

    final lineup = baseLineup.copyWith(
      id: country.id,
      bench: bench,
      reserves: reserves,
      captain: captain,
    );
    lineup.validate();

    return TeamLineupMapper.toJson(lineup);
  }

  Player _pickCaptain(TeamLineup lineup) {
    final midfieldCaptain = lineup.slotAssignments
        .map((assignment) => assignment.player)
        .where((player) => player.position == Position.centralMidfielder)
        .toList();

    if (midfieldCaptain.isNotEmpty) {
      return midfieldCaptain.first;
    }

    return lineup.slotAssignments.first.player;
  }

  // Tactics are seeded inline during _seedNationalTeams
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbPath = AppDatabase._dbPath ?? 'ts1_default.db';
    final file = File(dbPath);
    return NativeDatabase(file);
  });
}
