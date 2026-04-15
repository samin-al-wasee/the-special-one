import 'package:drift/drift.dart';

import 'countries.dart';

@DataClassName('NationalTeamRecord')
class NationalTeams extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get countryId => integer().references(Countries, #id)();

  TextColumn get name => text()(); // "Brazil National Team"

  IntColumn get fifaRanking => integer().nullable()();
}
