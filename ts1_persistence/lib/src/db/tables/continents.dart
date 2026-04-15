import 'package:drift/drift.dart';

@DataClassName('ContinentRecord')
class Continents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()(); // Europe, South America
  TextColumn get code => text().unique()(); // EU, SA
}
