// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dao.dart';

// ignore_for_file: type=lint
mixin _$CountryDaoMixin on DatabaseAccessor<AppDatabase> {
  $ContinentsTable get continents => attachedDatabase.continents;
  $CountriesTable get countries => attachedDatabase.countries;
  CountryDaoManager get managers => CountryDaoManager(this);
}

class CountryDaoManager {
  final _$CountryDaoMixin _db;
  CountryDaoManager(this._db);
  $$ContinentsTableTableManager get continents =>
      $$ContinentsTableTableManager(_db.attachedDatabase, _db.continents);
  $$CountriesTableTableManager get countries =>
      $$CountriesTableTableManager(_db.attachedDatabase, _db.countries);
}
