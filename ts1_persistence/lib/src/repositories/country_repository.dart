import 'package:ts1_persistence/src/db/daos/country_dao.dart';
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/mappers/country_mapper.dart';

/// Repository for country data access and transformation.
/// 
/// Provides a domain-level interface for accessing country records from the database.
/// This repository wraps [CountryDao] and adds error handling and validation.
/// 
/// Usage:
/// ```dart
/// final repo = CountryRepository(countryDao);
/// final france = await repo.getCountryByName('France');
/// final countries = await repo.getAllCountries();
/// ```
class CountryRepository {
  final CountryDao _countryDao;

  CountryRepository(this._countryDao);

  // =========================
  // 🔹 READ OPERATIONS
  // =========================

  /// Retrieves all available countries.
  /// 
  /// Returns: List of all [CountryRecord]s (empty list if none exist)
  Future<List<CountryRecord>> getAllCountries() async {
    return await _countryDao.getAllCountries();
  }

  /// Retrieves a country by ID, throwing if not found.
  /// 
  /// Parameters:
  ///   - [id]: The country ID
  /// 
  /// Returns: The [CountryRecord]
  /// 
  /// Throws: Exception if country with this ID is not found
  Future<CountryRecord> getCountryById(int id) async {
    final country = await _countryDao.getCountryById(id);
    if (country == null) {
      throw Exception('Country with ID $id not found');
    }
    return country;
  }

  /// Retrieves multiple countries by their IDs.
  /// 
  /// Parameters:
  ///   - [ids]: List of country IDs
  /// 
  /// Returns: List of [CountryRecord]s (only includes IDs that exist)
  Future<List<CountryRecord>> getCountriesByIds(List<int> ids) async {
    final allCountries = await _countryDao.getAllCountries();
    return allCountries.where((c) => ids.contains(c.id)).toList();
  }

  /// Retrieves a country by its 3-letter code (case-insensitive).
  /// 
  /// Parameters:
  ///   - [code]: The ISO 3-letter code (e.g., 'FRA', 'USA')
  /// 
  /// Returns: The [CountryRecord] or null if not found
  Future<CountryRecord?> getCountryByCode(String code) async {
    final country = await _countryDao.getCountryByCode(code);
    return country;
  }

  /// Retrieves a country by name (case-sensitive exact match).
  /// 
  /// Parameters:
  ///   - [name]: The country name (e.g., 'France')
  /// 
  /// Returns: The [CountryRecord] or null if not found
  Future<CountryRecord?> getCountryByName(String name) async {
    final country = await _countryDao.getCountryByName(name);
    return country;
  }

  /// Retrieves all countries with continent information.
  Future<List<Map<String, dynamic>>> getAllCountriesWithContinent() async {
    final rows = await _countryDao.getAllCountriesWithContinent();
    return rows.map(CountryMapper.fromJoinedRow).toList();
  }

  /// Retrieves a country with its continent information by ID.
  Future<Map<String, dynamic>?> getCountryByIdWithContinent(int id) async {
    final row = await _countryDao.getCountryByIdWithContinent(id);
    return row == null ? null : CountryMapper.fromJoinedRow(row);
  }

  /// Retrieves a country with its continent information by code.
  Future<Map<String, dynamic>?> getCountryByCodeWithContinent(String code) async {
    final row = await _countryDao.getCountryByCodeWithContinent(code);
    return row == null ? null : CountryMapper.fromJoinedRow(row);
  }

  /// Retrieves a country with its continent information by name.
  Future<Map<String, dynamic>?> getCountryByNameWithContinent(String name) async {
    final row = await _countryDao.getCountryByNameWithContinent(name);
    return row == null ? null : CountryMapper.fromJoinedRow(row);
  }
  
  // =========================
  // 🔧 UTILITY METHODS
  // =========================
  
  /// Checks if a country exists by ID.
  /// 
  /// Parameters:
  ///   - [id]: The country ID to check
  /// 
  /// Returns: true if country exists, false otherwise
  Future<bool> existsById(int id) async {
    final country = await _countryDao.getCountryById(id);
    return country != null;
  }
  
  /// Checks if a country exists by code.
  /// 
  /// Parameters:
  ///   - [code]: The 3-letter country code
  /// 
  /// Returns: true if country exists, false otherwise
  Future<bool> existsByCode(String code) async {
    final country = await _countryDao.getCountryByCode(code);
    return country != null;
  }

  /// Creates a new country record.
  Future<int> createCountry(CountriesCompanion country) {
    return _countryDao.insertCountry(country);
  }

  /// Upserts a country record.
  Future<void> upsertCountry(CountriesCompanion country) {
    return _countryDao.upsertCountry(country);
  }

  /// Updates a country record.
  Future<int> updateCountry(CountriesCompanion country) {
    return _countryDao.updateCountry(country);
  }

  /// Deletes a country record by ID.
  Future<int> deleteCountry(int id) {
    return _countryDao.deleteCountry(id);
  }
  
  /// Gets a country summary map for UI display.
  /// 
  /// Parameters:
  ///   - [countryRecord]: The country to summarize
  /// 
  /// Returns: Map with 'name', 'id', 'code', and 'continent' keys
  Map<String, dynamic> toSummaryMap(CountryRecord countryRecord) {
    return {
      'id': countryRecord.id,
      'name': countryRecord.name,
      'code': countryRecord.code,
      'continentId': countryRecord.continentId,
    };
  }
}
