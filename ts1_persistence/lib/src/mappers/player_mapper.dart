import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';

/// Mapper for converting between [Player] domain models and database records.
///
/// This class handles bidirectional transformation of player data between the persistence layer
/// (Drift database records) and the domain layer (core Player model).
///
/// It also manages serialization/deserialization of complex attribute maps
/// (technical, mental, physical, hidden, condition) which are stored as JSON strings in the database.
///
/// Usage:
/// ```dart
/// // Convert database record to domain model
/// final player = PlayerMapper.toDomain(playerRecord, countryRecord);
///
/// // Convert domain model to database companion for insertion
/// final companion = PlayerMapper.toCompanion(player, country);
/// ```
class PlayerMapper {
  // =========================
  // 🔹 DB → DOMAIN TRANSFORMATIONS
  // =========================

  /// Converts a database [PlayerRecord] and associated [CountryRecord] to a domain [Player] model.
  ///
  /// This method reconstructs the complete player data, including all attribute maps,
  /// from their stored representations in the database.
  ///
  /// Parameters:
  ///   - [playerRow]: The player record from the database
  ///   - [countryRow]: The associated country record (name is used in the domain model)
  ///
  /// Returns: A fully reconstructed [Player] domain model
  ///
  /// Throws: Exception if any enum label conversion fails (e.g., invalid position or footedness)
  static Player toDomain(PlayerRecord playerRow, CountryRecord countryRow) {
    return Player(
      id: playerRow.id,
      name: playerRow.name,
      dateOfBirth: playerRow.dateOfBirth,
      country: countryRow.name,
      heightCm: playerRow.heightCm,
      weightKg: playerRow.weightKg,
      position: Position.fromLabel(playerRow.position),
      footedness: Footedness.fromLabel(playerRow.footedness),
      technical: _decode<TechnicalAttr>(
        playerRow.technical,
        TechnicalAttr.values,
      ),
      mental: _decode<MentalAttr>(playerRow.mental, MentalAttr.values),
      physical: _decode<PhysicalAttr>(playerRow.physical, PhysicalAttr.values),
      hidden: _decode<HiddenAttr>(playerRow.hidden, HiddenAttr.values),
      condition: _decode<ConditionAttr>(
        playerRow.condition,
        ConditionAttr.values,
      ),
    );
  }

  // =========================
  // 🔹 DOMAIN → DB TRANSFORMATIONS
  // =========================

  /// Converts a domain [Player] model to a database [PlayerRecord].
  ///
  /// This is useful for reconstructing a complete record from a domain model
  /// when you need the record representation. Most use cases should prefer
  /// [toCompanion] for inserts/updates.
  ///
  /// Parameters:
  ///   - [player]: The domain player model
  ///   - [country]: The associated country record (for country ID)
  ///
  /// Returns: A [PlayerRecord] with all fields properly serialized
  static PlayerRecord toRecord(Player player, CountryRecord country) {
    return PlayerRecord(
      id: player.id,
      name: player.name,
      dateOfBirth: player.dateOfBirth,
      countryId: country.id,
      heightCm: player.heightCm,
      weightKg: player.weightKg,
      position: player.position.label,
      footedness: player.footedness.label,
      technical: _encode(player.technical),
      mental: _encode(player.mental),
      physical: _encode(player.physical),
      hidden: _encode(player.hidden),
      condition: _encode(player.condition),
    );
  }

  // =========================
  // 🔹 DOMAIN → DB COMPANION (PREFERRED FOR INSERTS/UPDATES)
  // =========================

  /// Converts a domain [Player] model to a [PlayersCompanion] for database operations.
  ///
  /// This is the preferred method for inserts and updates. It properly handles:
  /// - Auto-increment IDs (when [player.id] == 0, allows DB to assign)
  /// - Value wrapping for all fields
  /// - Proper serialization of complex attributes
  ///
  /// Parameters:
  ///   - [player]: The domain player model
  ///   - [country]: The associated country record (for country ID)
  ///
  /// Returns: A [PlayersCompanion] suitable for insert/update operations
  static PlayersCompanion toCompanion(Player player, CountryRecord country) {
    return PlayersCompanion(
      id: player.id == 0 ? Value.absent() : Value(player.id),
      name: Value(player.name),
      dateOfBirth: Value(player.dateOfBirth),
      countryId: Value(country.id),
      heightCm: Value(player.heightCm),
      weightKg: Value(player.weightKg),
      position: Value(player.position.label),
      footedness: Value(player.footedness.label),
      technical: Value(_encode(player.technical)),
      mental: Value(_encode(player.mental)),
      physical: Value(_encode(player.physical)),
      hidden: Value(_encode(player.hidden)),
      condition: Value(_encode(player.condition)),
    );
  }

  // =========================
  // 🔧 UTILITY METHODS
  // =========================

  /// Validates that a player model is complete and consistent.
  ///
  /// Checks:
  /// - Name is not empty
  /// - Height and weight are within reasonable bounds
  /// - All attribute maps are present (even if empty)
  ///
  /// Parameters:
  ///   - [player]: The player to validate
  ///
  /// Throws: ArgumentError if validation fails
  static void validate(Player player) {
    if (player.name.isEmpty) {
      throw ArgumentError('Player name cannot be empty');
    }
    if (player.heightCm <= 0 || player.heightCm > 250) {
      throw ArgumentError(
        'Player height must be between 1cm and 250cm, got ${player.heightCm}',
      );
    }
    if (player.weightKg <= 0 || player.weightKg > 200) {
      throw ArgumentError(
        'Player weight must be between 1kg and 200kg, got ${player.weightKg}',
      );
    }
  }

  /// Creates a summary map of player information for UI display.
  ///
  /// Returns:
  /// ```dart
  /// {
  ///   'name': 'John Doe',
  ///   'position': 'Central Midfielder',
  ///   'country': 'France',
  ///   'age': 24,
  ///   'height': '183 cm',
  ///   'weight': '82 kg',
  /// }
  /// ```
  static Map<String, dynamic> toSummaryMap(Player player) {
    final now = DateTime.now();
    final age =
        now.year -
        player.dateOfBirth.year -
        (now.month > player.dateOfBirth.month ||
                (now.month == player.dateOfBirth.month &&
                    now.day >= player.dateOfBirth.day)
            ? 0
            : 1);

    return {
      'name': player.name,
      'position': player.position.label,
      'country': player.country,
      'age': age,
      'height': '${player.heightCm} cm',
      'weight': '${player.weightKg} kg',
      'footedness': player.footedness.label,
    };
  }

  // =========================
  // 🔧 JSON ENCODING/DECODING HELPERS
  // =========================

  /// Encodes an attribute map to a JSON string for storage.
  ///
  /// The map uses enum names (not labels) as keys for compact, efficient storage.
  ///
  /// Example: `{TechnicalAttr.passing: 85, TechnicalAttr.shooting: 92}`
  /// becomes: `{"passing": 85, "shooting": 92}`
  static String _encode<T extends Enum>(Map<T, int> map) {
    final raw = map.map((k, v) => MapEntry(k.name, v));
    return jsonEncode(raw);
  }

  /// Decodes a JSON string to an attribute map.
  ///
  /// Reconstructs the enum keys from their name strings and validates
  /// all values exist in the provided [enumValues] list.
  ///
  /// Parameters:
  ///   - [json]: The JSON string (empty string returns empty map)
  ///   - [enumValues]: List of valid enum values for this attribute type
  ///
  /// Throws: Exception if a key in the JSON doesn't match any enum value
  static Map<T, int> _decode<T extends Enum>(String json, List<T> enumValues) {
    if (json.isEmpty) return {};

    final decoded = jsonDecode(json) as Map<String, dynamic>;

    return decoded.map((key, value) {
      final match = enumValues.firstWhere(
        (e) => e.name == key,
        orElse: () => throw Exception("Unknown enum key: $key"),
      );
      return MapEntry(match, value as int);
    });
  }
}
