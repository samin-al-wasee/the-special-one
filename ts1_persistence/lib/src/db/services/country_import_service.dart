import 'dart:convert';

import 'package:drift/drift.dart';
import '../database.dart';
import '../seed/country_seed.dart';

class CountryImportService {
  final AppDatabase db;

  CountryImportService(this.db);

  Future<void> import() async {
    final List<dynamic> jsonList = jsonDecode(countrySeedJson);

    final companions = jsonList
        .map((e) => _toCompanion(e as Map<String, dynamic>))
        .toList();

    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(db.countries, companions);
    });

    // ignore: avoid_print
    print("✅ Imported ${companions.length} countries successfully");
  }

  CountriesCompanion _toCompanion(Map<String, dynamic> json) {
    return CountriesCompanion(
      id: Value(json['id'] as int),
      name: Value(json['name'] as String),
      code: Value(json['code'] as String),
      continentId: Value(json['continentId'] as int),
    );
  }
}
