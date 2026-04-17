import 'package:ts1_persistence/src/db/daos/country_dao.dart';
import 'package:ts1_persistence/src/db/database.dart';

// Simple repository
class CountryRepository {
  final CountryDao _countryDao;

  CountryRepository(this._countryDao);

  // Get all countries
  Future<List<CountryRecord>> getAllCountries() async {
    return await _countryDao.getAllCountries();
  }

  // Get country by ID (throws if not found)
  Future<CountryRecord> getCountryById(int id) async {
    final country = await _countryDao.getCountryById(id);
    if (country == null) {
      throw Exception('Country with ID $id not found');
    }
    return country;
  }

  // Get multiple countries by IDs (returns empty list if none found)
  Future<List<CountryRecord>> getCountriesByIds(List<int> ids) async {
    final allCountries = await _countryDao.getAllCountries();
    return allCountries.where((c) => ids.contains(c.id)).toList();
  }

  // Get country by code (returns null if not found)
  Future<CountryRecord?> getCountryByCode(String code) async {
    final country = await _countryDao.getCountryByCode(code);
    return country;
  }

  // Get country by name (returns null if not found)
  Future<CountryRecord?> getCountryByName(String name) async {
    final country = await _countryDao.getCountryByName(name);
    return country;
  }
}
