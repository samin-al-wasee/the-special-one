import 'dart:convert';

import 'package:drift/drift.dart';
import '../database.dart';
import '../seed/player_seed.dart';

class PlayerImportService {
  final AppDatabase db;

  PlayerImportService(this.db);

  Future<void> import() async {
    final List<dynamic> jsonList = jsonDecode(playerSeedJson);

    final companions = jsonList
        .map((e) => _toCompanion(e as Map<String, dynamic>))
        .toList();

    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(db.players, companions);
    });

    // ignore: avoid_print
    print("✅ Imported ${companions.length} players successfully");
  }

  PlayersCompanion _toCompanion(Map<String, dynamic> json) {
    return PlayersCompanion(
      id: Value(json['id']),
      name: Value(json['name']),
      position: Value(json['position']),
      footedness: Value(json['footedness']),

      heightCm: Value((json['heightCm'] as num).toDouble()),
      weightKg: Value((json['weightKg'] as num).toDouble()),
      dateOfBirth: Value(DateTime.parse(json['dateOfBirth'])),

      technical: Value(jsonEncode(json['technical'] ?? {})),
      mental: Value(jsonEncode(json['mental'] ?? {})),
      physical: Value(jsonEncode(json['physical'] ?? {})),
      hidden: Value(jsonEncode(json['hidden'] ?? {})),
      condition: Value(jsonEncode(json['condition'] ?? {})),
    );
  }
}
