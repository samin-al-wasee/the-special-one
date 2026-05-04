// generators/scripts/run_player_generation.dart
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/utils/player_generation_helper.dart';

// Usage
void main() async {
  final database = AppDatabase();
  final helper = PlayerGenerationHelper(database);

  await helper.run(playersPerCountry: 100);

  await database.close();
}
