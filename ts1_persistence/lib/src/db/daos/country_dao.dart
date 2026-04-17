import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/countries.dart';

part 'country_dao.g.dart';

@DriftAccessor(tables: [Countries])
class CountryDao extends DatabaseAccessor<AppDatabase> with _$CountryDaoMixin {
  CountryDao(super.db);

  // Get all countries
  Future<List<CountryRecord>> getAllCountries() async {
    return await select(countries).get();
  }

  // Get country by ID
  Future<CountryRecord?> getCountryById(int id) async {
    return await (select(
      countries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Get country by code (3-letter code)
  Future<CountryRecord?> getCountryByCode(String code) async {
    return await (select(
      countries,
    )..where((t) => t.code.equals(code.toUpperCase()))).getSingleOrNull();
  }

  // Get country by name
  Future<CountryRecord?> getCountryByName(String name) async {
    return await (select(
      countries,
    )..where((t) => t.name.equals(name))).getSingleOrNull();
  }
}
