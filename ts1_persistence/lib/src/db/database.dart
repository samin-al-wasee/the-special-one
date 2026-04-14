import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'tables/players.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Players])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('ts1.db');
    return NativeDatabase(file);
  });
}
