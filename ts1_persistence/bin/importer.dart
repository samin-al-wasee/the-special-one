import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/services/player_import_service.dart';
import 'package:ts1_persistence/src/db/services/continent_import_service.dart';
import 'package:ts1_persistence/src/db/services/country_import_service.dart';

Future<void> main() async {
  final db = AppDatabase();

  final playerImporter = PlayerImportService(db);

  await playerImporter.import();

  final continentImporter = ContinentImportService(db);

  await continentImporter.import();

  final countryImporter = CountryImportService(db);
  
  await countryImporter.import();

  await db.close();
}
