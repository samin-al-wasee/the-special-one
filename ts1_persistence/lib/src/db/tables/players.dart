import 'package:drift/drift.dart';

@DataClassName('PlayerRecord')
class Players extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get position => text()();
  TextColumn get footedness => text()();

  RealColumn get heightCm => real()();
  RealColumn get weightKg => real()();

  DateTimeColumn get dateOfBirth => dateTime()();

  // JSON fields for attributes
  TextColumn get technical => text()();
  TextColumn get mental => text()();
  TextColumn get physical => text()();
  TextColumn get hidden => text()();
  TextColumn get condition => text()();

  @override
  Set<Column> get primaryKey => {id};
}
