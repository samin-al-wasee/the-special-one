// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'national_team_tactic_dao.dart';

// ignore_for_file: type=lint
mixin _$NationalTeamTacticDaoMixin on DatabaseAccessor<AppDatabase> {
  $NationalTeamTacticsTable get nationalTeamTactics =>
      attachedDatabase.nationalTeamTactics;
  NationalTeamTacticDaoManager get managers =>
      NationalTeamTacticDaoManager(this);
}

class NationalTeamTacticDaoManager {
  final _$NationalTeamTacticDaoMixin _db;
  NationalTeamTacticDaoManager(this._db);
  $$NationalTeamTacticsTableTableManager get nationalTeamTactics =>
      $$NationalTeamTacticsTableTableManager(
        _db.attachedDatabase,
        _db.nationalTeamTactics,
      );
}
