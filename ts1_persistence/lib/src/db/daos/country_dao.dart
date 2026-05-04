import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/countries.dart';

part 'country_dao.g.dart';

/// Data Access Object for country records in the database.
/// 
/// Provides direct database access for [Countries] table operations including
/// queries by ID, code, name, and batch operations.
/// 
/// Note: This DAO is used by [CountryRepository] for domain-level operations.
@DriftAccessor(tables: [Countries])
class CountryDao extends DatabaseAccessor<AppDatabase> with _$CountryDaoMixin {
  CountryDao(super.db);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves all countries from the database.
  /// 
  /// Returns: List of all [CountryRecord]s (empty list if none exist)
  Future<List<CountryRecord>> getAllCountries() async {
    return await select(countries).get();
  }

  /// Retrieves a single country by its ID.
  /// 
  /// Parameters:
  ///   - [id]: The country ID
  /// 
  /// Returns: The [CountryRecord] or null if not found
  Future<CountryRecord?> getCountryById(int id) async {
    return await (select(
      countries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Retrieves a country by its ISO 3-letter code (case-insensitive).
  /// 
  /// Parameters:
  ///   - [code]: The 3-letter country code (e.g., 'FRA', 'USA')
  /// 
  /// Returns: The [CountryRecord] or null if not found
  Future<CountryRecord?> getCountryByCode(String code) async {
    return await (select(
      countries,
    )..where((t) => t.code.equals(code.toUpperCase()))).getSingleOrNull();
  }

  /// Retrieves a country by its name (case-sensitive exact match).
  /// 
  /// Parameters:
  ///   - [name]: The country name (e.g., 'France', 'United States')
  /// 
  /// Returns: The [CountryRecord] or null if not found
  Future<CountryRecord?> getCountryByName(String name) async {
    return await (select(
      countries,
    )..where((t) => t.name.equals(name))).getSingleOrNull();
  }

  // =========================
  // 🔹 WRITE OPERATIONS
  // =========================

  /// Inserts a country record.
  Future<int> insertCountry(CountriesCompanion country) {
    return into(countries).insert(country);
  }

  /// Inserts or updates a country record.
  Future<void> upsertCountry(CountriesCompanion country) {
    return into(countries).insertOnConflictUpdate(country);
  }

  /// Updates an existing country record.
  Future<int> updateCountry(CountriesCompanion country) {
    return (update(countries)..where((t) => t.id.equals(country.id.value))).write(country);
  }

  /// Deletes a country by ID.
  Future<int> deleteCountry(int id) {
    return (delete(countries)..where((t) => t.id.equals(id))).go();
  }

  // =========================
  // 🔹 JOINED READ OPERATIONS
  // =========================

  /// Retrieves all countries with their continent information.
  Future<List<Map<String, Object?>>> getAllCountriesWithContinent() async {
    final query = select(countries).join([
      innerJoin(continents, continents.id.equalsExp(countries.continentId)),
    ]);

    final rows = await query.get();
    return rows
        .map((row) => {
              'country': row.readTable(countries),
              'continent': row.readTable(continents),
            })
        .toList();
  }

  /// Retrieves a country with its continent information by ID.
  Future<Map<String, Object?>?> getCountryByIdWithContinent(int id) async {
    final query = select(countries).join([
      innerJoin(continents, continents.id.equalsExp(countries.continentId)),
    ])
      ..where(countries.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return {
      'country': row.readTable(countries),
      'continent': row.readTable(continents),
    };
  }

  /// Retrieves a country with its continent information by code.
  Future<Map<String, Object?>?> getCountryByCodeWithContinent(String code) async {
    final query = select(countries).join([
      innerJoin(continents, continents.id.equalsExp(countries.continentId)),
    ])
      ..where(countries.code.equals(code.toUpperCase()));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return {
      'country': row.readTable(countries),
      'continent': row.readTable(continents),
    };
  }

  /// Retrieves a country with its continent information by name.
  Future<Map<String, Object?>?> getCountryByNameWithContinent(String name) async {
    final query = select(countries).join([
      innerJoin(continents, continents.id.equalsExp(countries.continentId)),
    ])
      ..where(countries.name.equals(name));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return {
      'country': row.readTable(countries),
      'continent': row.readTable(continents),
    };
  }

  /// Retrieves all countries in a given continent.
  Future<List<Map<String, Object?>>> getCountriesByContinentId(int continentId) async {
    final query = select(countries).join([
      innerJoin(continents, continents.id.equalsExp(countries.continentId)),
    ])
      ..where(continents.id.equals(continentId));

    final rows = await query.get();
    return rows
        .map((row) => {
              'country': row.readTable(countries),
              'continent': row.readTable(continents),
            })
        .toList();
  }
}
