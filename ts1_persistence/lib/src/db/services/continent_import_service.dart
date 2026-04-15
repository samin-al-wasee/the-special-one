import 'dart:convert';

import 'package:drift/drift.dart';
import '../database.dart';
import '../seed/continent_seed.dart';

class ContinentImportService {
  final AppDatabase db;

  ContinentImportService(this.db);

  Future<void> import() async {
    final List<dynamic> jsonList = jsonDecode(continentSeedJson);

    final companions = jsonList
        .map((e) => _toCompanion(e as Map<String, dynamic>))
        .toList();

    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(db.continents, companions);
    });

    // ignore: avoid_print
    print("✅ Imported ${companions.length} continents successfully");
  }

  ContinentsCompanion _toCompanion(Map<String, dynamic> json) {
    return ContinentsCompanion(
      id: Value(json['id'] as int),
      name: Value(json['name'] as String),
      code: Value(json['code'] as String),
    );
  }
}
