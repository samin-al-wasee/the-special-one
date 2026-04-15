import 'package:drift/drift.dart';

import 'continents.dart';

@DataClassName('CountryRecord')
class Countries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()(); // Brazil
  TextColumn get code => text().unique()(); // BRA

  IntColumn get continentId => integer().references(Continents, #id)();
}
