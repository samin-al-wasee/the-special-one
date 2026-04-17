import 'package:drift/drift.dart';

import 'countries.dart';

@DataClassName('PlayerRecord')
class Players extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get position => text()();
  TextColumn get footedness => text()();

  RealColumn get heightCm => real()();
  RealColumn get weightKg => real()();

  DateTimeColumn get dateOfBirth => dateTime()();
  IntColumn get countryId => integer().references(Countries, #id)();

  // JSON fields for attributes
  TextColumn get technical => text()();
  TextColumn get mental => text()();
  TextColumn get physical => text()();
  TextColumn get hidden => text()();
  TextColumn get condition => text()();
}
