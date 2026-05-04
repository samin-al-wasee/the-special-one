import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/ts1_persistence.dart';

final appDatabaseProvider = FutureProvider<AppDatabase>((ref) async {
  final dbPath = await _initializeDatabase();
  AppDatabase.setDatabasePath(dbPath);
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

/// Initialize the database by copying the asset to the app's documents directory.
Future<String> _initializeDatabase() async {
  final docsDir = await getApplicationDocumentsDirectory();
  final dbFile = File('${docsDir.path}/ts1_default.db');

  // If the database doesn't exist, copy it from assets
  if (!await dbFile.exists()) {
    final data = await rootBundle.load('assets/db/ts1_default.db');
    await dbFile.writeAsBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  }

  return dbFile.path;
}

final continentDaoProvider = FutureProvider<ContinentDao>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);
  return ContinentDao(db);
});

final countryDaoProvider = FutureProvider<CountryDao>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);
  return CountryDao(db);
});

final playerDaoProvider = FutureProvider<PlayerDao>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);
  return PlayerDao(db);
});

final nationalTeamDaoProvider = FutureProvider<NationalTeamDao>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);
  return NationalTeamDao(db);
});

final nationalTeamTacticDaoProvider = FutureProvider<NationalTeamTacticDao>((
  ref,
) async {
  final db = await ref.watch(appDatabaseProvider.future);
  return NationalTeamTacticDao(db);
});

final countryRepositoryProvider = FutureProvider<CountryRepository>((
  ref,
) async {
  final dao = await ref.watch(countryDaoProvider.future);
  return CountryRepository(dao);
});

final continentRepositoryProvider = FutureProvider<ContinentRepository>((
  ref,
) async {
  final dao = await ref.watch(continentDaoProvider.future);
  return ContinentRepository(dao);
});

final playerRepositoryProvider = FutureProvider<PlayerRepository>((ref) async {
  final playerDao = await ref.watch(playerDaoProvider.future);
  final countryRepo = await ref.watch(countryRepositoryProvider.future);
  return PlayerRepository(playerDao, countryRepo);
});

final nationalTeamTacticRepositoryProvider =
    FutureProvider<NationalTeamTacticRepository>((ref) async {
      final dao = await ref.watch(nationalTeamTacticDaoProvider.future);
      return NationalTeamTacticRepository(dao);
    });

final nationalTeamRepositoryProvider = FutureProvider<NationalTeamRepository>((
  ref,
) async {
  final teamDao = await ref.watch(nationalTeamDaoProvider.future);
  final tacticRepo = await ref.watch(
    nationalTeamTacticRepositoryProvider.future,
  );
  final playerRepo = await ref.watch(playerRepositoryProvider.future);
  return NationalTeamRepository(teamDao, tacticRepo, playerRepo);
});

final availableNationalTeamsProvider = FutureProvider<List<Team>>((ref) async {
  final repo = await ref.watch(nationalTeamRepositoryProvider.future);
  return repo.getAllTeamsWithTactics();
});
