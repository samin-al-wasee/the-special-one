// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continent_dao.dart';

// ignore_for_file: type=lint
mixin _$ContinentDaoMixin on DatabaseAccessor<AppDatabase> {
  $ContinentsTable get continents => attachedDatabase.continents;
  ContinentDaoManager get managers => ContinentDaoManager(this);
}

class ContinentDaoManager {
  final _$ContinentDaoMixin _db;
  ContinentDaoManager(this._db);
  $$ContinentsTableTableManager get continents =>
      $$ContinentsTableTableManager(_db.attachedDatabase, _db.continents);
}
