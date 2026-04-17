import 'dart:convert';

import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/src/db/database.dart';

class PlayerMapper {
  // =========================
  // 🔹 DB → DOMAIN
  // =========================
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

      technical: _decode<TechnicalAttr>(playerRow.technical, TechnicalAttr.values),
      mental: _decode<MentalAttr>(playerRow.mental, MentalAttr.values),
      physical: _decode<PhysicalAttr>(playerRow.physical, PhysicalAttr.values),
      hidden: _decode<HiddenAttr>(playerRow.hidden, HiddenAttr.values),
      condition: _decode<ConditionAttr>(playerRow.condition, ConditionAttr.values),
    );
  }

  // =========================
  // 🔹 DOMAIN → DB
  // =========================
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
  // 🔧 JSON ENCODING
  // =========================

  static String _encode<T extends Enum>(Map<T, int> map) {
    final raw = map.map((k, v) => MapEntry(k.name, v));
    return jsonEncode(raw);
  }

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
