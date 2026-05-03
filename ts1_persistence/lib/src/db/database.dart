import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/mappers/player_mapper.dart';
import 'package:ts1_persistence/src/mappers/team_lineup_mapper.dart';
import 'package:ts1_persistence/src/db/daos/player_dao.dart';
import 'package:ts1_persistence/src/db/daos/national_team_dao.dart';
import 'package:ts1_persistence/src/db/daos/national_team_tactic_dao.dart';

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
  daos: [CountryDao, PlayerDao, NationalTeamDao, NationalTeamTacticDao],
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
  int get schemaVersion => 5;

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

      if (from < 3) {
        if (!await _hasNationalTeamLineupColumn()) {
          await m.addColumn(nationalTeams, nationalTeams.lineup);
        }

        await _seedNationalTeamLineups();
      }

      if (from < 5) {
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
      final lineupJson = await _buildLineupJsonForCountry(country);

      if (lineupJson == null) {
        throw StateError(
          'Cannot seed team "$teamName": no players found for country ${country.id}.',
        );
      }

      await into(nationalTeams).insert(
        NationalTeamsCompanion(
          id: Value(country.id), // Using same ID as country for consistency
          countryId: Value(country.id),
          name: Value(teamName),
          lineup: Value(lineupJson),
        ),
      );
    }
  }

  Future<void> _seedNationalTeamLineups() async {
    final allCountries = await select(countries).get();

    for (final country in allCountries) {
      final team = await (select(
        nationalTeams,
      )..where((t) => t.countryId.equals(country.id))).getSingleOrNull();
      if (team == null) {
        continue;
      }

      final lineupJson = await _buildLineupJsonForCountry(country);
      if (lineupJson == null) {
        throw StateError(
          'Cannot backfill lineup for team "${team.name}": no players found for country ${country.id}.',
        );
      }

      await (update(nationalTeams)..where((t) => t.id.equals(team.id))).write(
        NationalTeamsCompanion(lineup: Value(lineupJson)),
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

  Future<bool> _hasNationalTeamLineupColumn() async {
    final result = await customSelect(
      'PRAGMA table_info(national_teams)',
    ).get();
    return result.any((row) => row.data['name'] == 'lineup');
  }

  Future<void> _seedNationalTeamTactics() async {
    // First, ensure national teams are already seeded
    final allTeams = await select(nationalTeams).get();

    print('Seeding national team tactics for ${allTeams.length} teams...');

    for (var team in allTeams) {
      // Get the tactical preset for this team from the seed data
      final preset =
          nationalTeamTacticsSeed[team.id] ?? TacticalPreset.balanced;
      final nationalTeamTactic = TacticalPresetFactory.create(preset);

      await into(nationalTeamTactics).insert(
        NationalTeamTacticsCompanion(
          teamId: Value(team.id),
          presetName: Value(preset.label),
          buildUpStyle: Value(nationalTeamTactic.buildUpStyle.name),
          tempo: Value(nationalTeamTactic.tempo.name),
          width: Value(nationalTeamTactic.width.name),
          finalThirdFocus: Value(nationalTeamTactic.finalThirdFocus.name),
          attackingFocus: Value(nationalTeamTactic.attackingFocus.name),
          defensiveLine: Value(nationalTeamTactic.defensiveLine.name),
          lineOfEngagement: Value(nationalTeamTactic.lineOfEngagement.name),
          pressingIntensity: Value(nationalTeamTactic.pressingIntensity.name),
          defensiveWidth: Value(nationalTeamTactic.defensiveWidth.name),
          markingStyle: Value(nationalTeamTactic.markingStyle.name),
          tacklingAggression: Value(nationalTeamTactic.tacklingAggression.name),
          transitionOnWin: Value(nationalTeamTactic.transitionOnWin.name),
          transitionOnLoss: Value(nationalTeamTactic.transitionOnLoss.name),
          teamMentality: Value(nationalTeamTactic.teamMentality.name),
          passingRisk: Value(nationalTeamTactic.passingRisk.name),
          dribblingRisk: Value(nationalTeamTactic.dribblingRisk.name),
          shootingPolicy: Value(nationalTeamTactic.shootingPolicy.name),
          compactness: Value(nationalTeamTactic.compactness.name),
          verticalStretch: Value(nationalTeamTactic.verticalStretch.name),
          overloadFocus: Value(nationalTeamTactic.overloadFocus.name),
          setPieceAttack: Value(nationalTeamTactic.setPieceAttack.name),
          setPieceDefense: Value(nationalTeamTactic.setPieceDefense.name),
          freeKickStrategy: Value(nationalTeamTactic.freeKickStrategy.name),
        ),
      );
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbPath = AppDatabase._dbPath ?? 'ts1_default.db';
    final file = File(dbPath);
    return NativeDatabase(file);
  });
}
