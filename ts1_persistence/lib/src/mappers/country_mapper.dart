import 'package:ts1_persistence/src/db/database.dart';

/// Mapper for country records joined with their continent.
///
/// This helper keeps join-shape conversion in one place so repositories can
/// expose country + continent data without duplicating map assembly logic.
class CountryMapper {
  /// Creates a compact display map for a country and its continent.
  static Map<String, dynamic> toSummaryMap(
    CountryRecord country,
    ContinentRecord continent,
  ) {
    return {
      'country': country,
      'continent': continent,
      'countryName': country.name,
      'countryCode': country.code,
      'continentName': continent.name,
      'continentCode': continent.code,
    };
  }

  /// Converts a joined database row into a typed summary map.
  static Map<String, dynamic> fromJoinedRow(Map<String, Object?> row) {
    return toSummaryMap(
      row['country'] as CountryRecord,
      row['continent'] as ContinentRecord,
    );
  }
}
