import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/continents.dart';

part 'continent_dao.g.dart';

/// Data Access Object for continent records in the database.
@DriftAccessor(tables: [Continents])
class ContinentDao extends DatabaseAccessor<AppDatabase> with _$ContinentDaoMixin {
  ContinentDao(super.db);

  /// Retrieves all continents.
  Future<List<ContinentRecord>> getAllContinents() async {
    return await select(continents).get();
  }

  /// Retrieves a continent by ID.
  Future<ContinentRecord?> getContinentById(int id) async {
    return await (select(continents)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Retrieves a continent by code.
  Future<ContinentRecord?> getContinentByCode(String code) async {
    return await (select(continents)..where((t) => t.code.equals(code.toUpperCase()))).getSingleOrNull();
  }

  /// Retrieves a continent by name.
  Future<ContinentRecord?> getContinentByName(String name) async {
    return await (select(continents)..where((t) => t.name.equals(name))).getSingleOrNull();
  }

  /// Inserts a continent.
  Future<int> insertContinent(ContinentsCompanion continent) {
    return into(continents).insert(continent);
  }

  /// Upserts a continent.
  Future<void> upsertContinent(ContinentsCompanion continent) {
    return into(continents).insertOnConflictUpdate(continent);
  }

  /// Updates a continent.
  Future<int> updateContinent(ContinentsCompanion continent) {
    return (update(continents)..where((t) => t.id.equals(continent.id.value))).write(continent);
  }

  /// Deletes a continent.
  Future<int> deleteContinent(int id) {
    return (delete(continents)..where((t) => t.id.equals(id))).go();
  }
}