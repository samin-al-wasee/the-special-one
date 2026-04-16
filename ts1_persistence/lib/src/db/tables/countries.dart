import 'package:drift/drift.dart';

import 'continents.dart';

@DataClassName('CountryRecord')
class Countries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().unique()();
  TextColumn get code => text().unique().withLength(min: 3, max: 3)();

  IntColumn get continentId => integer().references(Continents, #id)();
}
