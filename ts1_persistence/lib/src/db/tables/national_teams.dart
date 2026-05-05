import 'package:drift/drift.dart';

import 'countries.dart';

@DataClassName('NationalTeamRecord')
class NationalTeams extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get countryId => integer().references(Countries, #id)();

  TextColumn get name => text().unique()();

  TextColumn get lineup => text().withDefault(const Constant('{}'))();

  // Tactical configuration as JSON. Stores the complete TeamTactic serialized.
  TextColumn get tactics => text().withDefault(const Constant('{}'))();

  // Team colors in hex format (e.g. #ff0000). Normalization and validation are
  // enforced at the repository layer.
  TextColumn get primaryColor =>
    text().named('primary_color').withLength(min: 4, max: 7)();

  TextColumn get secondaryColor =>
    text().named('secondary_color').withLength(min: 4, max: 7)();

  TextColumn get tertiaryColor =>
    text().named('tertiary_color').withLength(min: 4, max: 7)();
}
