import 'package:ts1_persistence/src/db/daos/continent_dao.dart';
import 'package:ts1_persistence/src/db/database.dart';

/// Repository for continent data access and transformation.
class ContinentRepository {
  final ContinentDao dao;

  ContinentRepository(this.dao);

  Future<List<ContinentRecord>> getAllContinents() => dao.getAllContinents();

  Future<ContinentRecord?> getContinentById(int id) => dao.getContinentById(id);

  Future<ContinentRecord?> getContinentByCode(String code) =>
      dao.getContinentByCode(code);

  Future<ContinentRecord?> getContinentByName(String name) =>
      dao.getContinentByName(name);

  Future<int> createContinent(ContinentsCompanion continent) =>
      dao.insertContinent(continent);

  Future<void> upsertContinent(ContinentsCompanion continent) =>
      dao.upsertContinent(continent);

  Future<int> updateContinent(ContinentsCompanion continent) =>
      dao.updateContinent(continent);

  Future<int> deleteContinent(int id) => dao.deleteContinent(id);
}
