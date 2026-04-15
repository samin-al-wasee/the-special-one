import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'tables/players.dart';
import 'tables/continents.dart';
import 'tables/countries.dart';
import 'tables/national_teams.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Players, Continents, Countries, NationalTeams])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from == 1) {
        await m.createTable(continents);
        await m.createTable(countries);
        await m.createTable(nationalTeams);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('ts1.db');
    return NativeDatabase(file);
  });
}
