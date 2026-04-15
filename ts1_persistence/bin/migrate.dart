import 'package:ts1_persistence/src/db/database.dart';

Future<void> main() async {
  print('🚀 Opening database to trigger migrations...');

  final db = AppDatabase();

  try {
    // This forces Drift to initialize the DB fully
    await db.customSelect('SELECT 1').get();

    print('✅ Database opened successfully');
    print('✅ Migrations executed if schemaVersion changed');
  } catch (e, st) {
    print('❌ Migration failed: $e');
    print(st);
  } finally {
    await db.close();
    print('🧹 Database closed');
  }
}
