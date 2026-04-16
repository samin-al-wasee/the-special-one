import 'package:drift/drift.dart';

@DataClassName('ContinentRecord')
class Continents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()(); // Europe, South America
  TextColumn get code => text().unique().withLength(min: 2, max: 2)(); // EU, SA
}
