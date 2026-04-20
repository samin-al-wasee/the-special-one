// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'national_team_dao.dart';

// ignore_for_file: type=lint
mixin _$NationalTeamDaoMixin on DatabaseAccessor<AppDatabase> {
  $ContinentsTable get continents => attachedDatabase.continents;
  $CountriesTable get countries => attachedDatabase.countries;
  $NationalTeamsTable get nationalTeams => attachedDatabase.nationalTeams;
  $NationalTeamTacticsTable get nationalTeamTactics =>
      attachedDatabase.nationalTeamTactics;
  NationalTeamDaoManager get managers => NationalTeamDaoManager(this);
}

class NationalTeamDaoManager {
  final _$NationalTeamDaoMixin _db;
  NationalTeamDaoManager(this._db);
  $$ContinentsTableTableManager get continents =>
      $$ContinentsTableTableManager(_db.attachedDatabase, _db.continents);
  $$CountriesTableTableManager get countries =>
      $$CountriesTableTableManager(_db.attachedDatabase, _db.countries);
  $$NationalTeamsTableTableManager get nationalTeams =>
      $$NationalTeamsTableTableManager(_db.attachedDatabase, _db.nationalTeams);
  $$NationalTeamTacticsTableTableManager get nationalTeamTactics =>
      $$NationalTeamTacticsTableTableManager(
        _db.attachedDatabase,
        _db.nationalTeamTactics,
      );
}
