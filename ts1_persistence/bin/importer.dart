import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/db/services/PlayerImportService.dart';

Future<void> main() async {
  final db = AppDatabase();

  final importer = PlayerImportService(db);

  await importer.import();

  await db.close();
}
