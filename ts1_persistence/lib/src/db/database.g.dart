// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlayersTable extends Players
    with TableInfo<$PlayersTable, PlayerRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _footednessMeta = const VerificationMeta(
    'footedness',
  );
  @override
  late final GeneratedColumn<String> footedness = GeneratedColumn<String>(
    'footedness',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _technicalMeta = const VerificationMeta(
    'technical',
  );
  @override
  late final GeneratedColumn<String> technical = GeneratedColumn<String>(
    'technical',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mentalMeta = const VerificationMeta('mental');
  @override
  late final GeneratedColumn<String> mental = GeneratedColumn<String>(
    'mental',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _physicalMeta = const VerificationMeta(
    'physical',
  );
  @override
  late final GeneratedColumn<String> physical = GeneratedColumn<String>(
    'physical',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<String> hidden = GeneratedColumn<String>(
    'hidden',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    position,
    footedness,
    heightCm,
    weightKg,
    dateOfBirth,
    technical,
    mental,
    physical,
    hidden,
    condition,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('footedness')) {
      context.handle(
        _footednessMeta,
        footedness.isAcceptableOrUnknown(data['footedness']!, _footednessMeta),
      );
    } else if (isInserting) {
      context.missing(_footednessMeta);
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    } else if (isInserting) {
      context.missing(_heightCmMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('technical')) {
      context.handle(
        _technicalMeta,
        technical.isAcceptableOrUnknown(data['technical']!, _technicalMeta),
      );
    } else if (isInserting) {
      context.missing(_technicalMeta);
    }
    if (data.containsKey('mental')) {
      context.handle(
        _mentalMeta,
        mental.isAcceptableOrUnknown(data['mental']!, _mentalMeta),
      );
    } else if (isInserting) {
      context.missing(_mentalMeta);
    }
    if (data.containsKey('physical')) {
      context.handle(
        _physicalMeta,
        physical.isAcceptableOrUnknown(data['physical']!, _physicalMeta),
      );
    } else if (isInserting) {
      context.missing(_physicalMeta);
    }
    if (data.containsKey('hidden')) {
      context.handle(
        _hiddenMeta,
        hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta),
      );
    } else if (isInserting) {
      context.missing(_hiddenMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      )!,
      footedness: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}footedness'],
      )!,
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      )!,
      technical: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}technical'],
      )!,
      mental: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mental'],
      )!,
      physical: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}physical'],
      )!,
      hidden: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hidden'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class PlayerRecord extends DataClass implements Insertable<PlayerRecord> {
  final int id;
  final String name;
  final String position;
  final String footedness;
  final double heightCm;
  final double weightKg;
  final DateTime dateOfBirth;
  final String technical;
  final String mental;
  final String physical;
  final String hidden;
  final String condition;
  const PlayerRecord({
    required this.id,
    required this.name,
    required this.position,
    required this.footedness,
    required this.heightCm,
    required this.weightKg,
    required this.dateOfBirth,
    required this.technical,
    required this.mental,
    required this.physical,
    required this.hidden,
    required this.condition,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['position'] = Variable<String>(position);
    map['footedness'] = Variable<String>(footedness);
    map['height_cm'] = Variable<double>(heightCm);
    map['weight_kg'] = Variable<double>(weightKg);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    map['technical'] = Variable<String>(technical);
    map['mental'] = Variable<String>(mental);
    map['physical'] = Variable<String>(physical);
    map['hidden'] = Variable<String>(hidden);
    map['condition'] = Variable<String>(condition);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      name: Value(name),
      position: Value(position),
      footedness: Value(footedness),
      heightCm: Value(heightCm),
      weightKg: Value(weightKg),
      dateOfBirth: Value(dateOfBirth),
      technical: Value(technical),
      mental: Value(mental),
      physical: Value(physical),
      hidden: Value(hidden),
      condition: Value(condition),
    );
  }

  factory PlayerRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      position: serializer.fromJson<String>(json['position']),
      footedness: serializer.fromJson<String>(json['footedness']),
      heightCm: serializer.fromJson<double>(json['heightCm']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      technical: serializer.fromJson<String>(json['technical']),
      mental: serializer.fromJson<String>(json['mental']),
      physical: serializer.fromJson<String>(json['physical']),
      hidden: serializer.fromJson<String>(json['hidden']),
      condition: serializer.fromJson<String>(json['condition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'position': serializer.toJson<String>(position),
      'footedness': serializer.toJson<String>(footedness),
      'heightCm': serializer.toJson<double>(heightCm),
      'weightKg': serializer.toJson<double>(weightKg),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'technical': serializer.toJson<String>(technical),
      'mental': serializer.toJson<String>(mental),
      'physical': serializer.toJson<String>(physical),
      'hidden': serializer.toJson<String>(hidden),
      'condition': serializer.toJson<String>(condition),
    };
  }

  PlayerRecord copyWith({
    int? id,
    String? name,
    String? position,
    String? footedness,
    double? heightCm,
    double? weightKg,
    DateTime? dateOfBirth,
    String? technical,
    String? mental,
    String? physical,
    String? hidden,
    String? condition,
  }) => PlayerRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    position: position ?? this.position,
    footedness: footedness ?? this.footedness,
    heightCm: heightCm ?? this.heightCm,
    weightKg: weightKg ?? this.weightKg,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    technical: technical ?? this.technical,
    mental: mental ?? this.mental,
    physical: physical ?? this.physical,
    hidden: hidden ?? this.hidden,
    condition: condition ?? this.condition,
  );
  PlayerRecord copyWithCompanion(PlayersCompanion data) {
    return PlayerRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      position: data.position.present ? data.position.value : this.position,
      footedness: data.footedness.present
          ? data.footedness.value
          : this.footedness,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      technical: data.technical.present ? data.technical.value : this.technical,
      mental: data.mental.present ? data.mental.value : this.mental,
      physical: data.physical.present ? data.physical.value : this.physical,
      hidden: data.hidden.present ? data.hidden.value : this.hidden,
      condition: data.condition.present ? data.condition.value : this.condition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('position: $position, ')
          ..write('footedness: $footedness, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('technical: $technical, ')
          ..write('mental: $mental, ')
          ..write('physical: $physical, ')
          ..write('hidden: $hidden, ')
          ..write('condition: $condition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    position,
    footedness,
    heightCm,
    weightKg,
    dateOfBirth,
    technical,
    mental,
    physical,
    hidden,
    condition,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.position == this.position &&
          other.footedness == this.footedness &&
          other.heightCm == this.heightCm &&
          other.weightKg == this.weightKg &&
          other.dateOfBirth == this.dateOfBirth &&
          other.technical == this.technical &&
          other.mental == this.mental &&
          other.physical == this.physical &&
          other.hidden == this.hidden &&
          other.condition == this.condition);
}

class PlayersCompanion extends UpdateCompanion<PlayerRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> position;
  final Value<String> footedness;
  final Value<double> heightCm;
  final Value<double> weightKg;
  final Value<DateTime> dateOfBirth;
  final Value<String> technical;
  final Value<String> mental;
  final Value<String> physical;
  final Value<String> hidden;
  final Value<String> condition;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.position = const Value.absent(),
    this.footedness = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.technical = const Value.absent(),
    this.mental = const Value.absent(),
    this.physical = const Value.absent(),
    this.hidden = const Value.absent(),
    this.condition = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String position,
    required String footedness,
    required double heightCm,
    required double weightKg,
    required DateTime dateOfBirth,
    required String technical,
    required String mental,
    required String physical,
    required String hidden,
    required String condition,
  }) : name = Value(name),
       position = Value(position),
       footedness = Value(footedness),
       heightCm = Value(heightCm),
       weightKg = Value(weightKg),
       dateOfBirth = Value(dateOfBirth),
       technical = Value(technical),
       mental = Value(mental),
       physical = Value(physical),
       hidden = Value(hidden),
       condition = Value(condition);
  static Insertable<PlayerRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? position,
    Expression<String>? footedness,
    Expression<double>? heightCm,
    Expression<double>? weightKg,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? technical,
    Expression<String>? mental,
    Expression<String>? physical,
    Expression<String>? hidden,
    Expression<String>? condition,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
      if (footedness != null) 'footedness': footedness,
      if (heightCm != null) 'height_cm': heightCm,
      if (weightKg != null) 'weight_kg': weightKg,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (technical != null) 'technical': technical,
      if (mental != null) 'mental': mental,
      if (physical != null) 'physical': physical,
      if (hidden != null) 'hidden': hidden,
      if (condition != null) 'condition': condition,
    });
  }

  PlayersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? position,
    Value<String>? footedness,
    Value<double>? heightCm,
    Value<double>? weightKg,
    Value<DateTime>? dateOfBirth,
    Value<String>? technical,
    Value<String>? mental,
    Value<String>? physical,
    Value<String>? hidden,
    Value<String>? condition,
  }) {
    return PlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      footedness: footedness ?? this.footedness,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      technical: technical ?? this.technical,
      mental: mental ?? this.mental,
      physical: physical ?? this.physical,
      hidden: hidden ?? this.hidden,
      condition: condition ?? this.condition,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (footedness.present) {
      map['footedness'] = Variable<String>(footedness.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (technical.present) {
      map['technical'] = Variable<String>(technical.value);
    }
    if (mental.present) {
      map['mental'] = Variable<String>(mental.value);
    }
    if (physical.present) {
      map['physical'] = Variable<String>(physical.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<String>(hidden.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('position: $position, ')
          ..write('footedness: $footedness, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('technical: $technical, ')
          ..write('mental: $mental, ')
          ..write('physical: $physical, ')
          ..write('hidden: $hidden, ')
          ..write('condition: $condition')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayersTable players = $PlayersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [players];
}

typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      required String name,
      required String position,
      required String footedness,
      required double heightCm,
      required double weightKg,
      required DateTime dateOfBirth,
      required String technical,
      required String mental,
      required String physical,
      required String hidden,
      required String condition,
    });
typedef $$PlayersTableUpdateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> position,
      Value<String> footedness,
      Value<double> heightCm,
      Value<double> weightKg,
      Value<DateTime> dateOfBirth,
      Value<String> technical,
      Value<String> mental,
      Value<String> physical,
      Value<String> hidden,
      Value<String> condition,
    });

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get footedness => $composableBuilder(
    column: $table.footedness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get technical => $composableBuilder(
    column: $table.technical,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mental => $composableBuilder(
    column: $table.mental,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get physical => $composableBuilder(
    column: $table.physical,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hidden => $composableBuilder(
    column: $table.hidden,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get footedness => $composableBuilder(
    column: $table.footedness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get technical => $composableBuilder(
    column: $table.technical,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mental => $composableBuilder(
    column: $table.mental,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get physical => $composableBuilder(
    column: $table.physical,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hidden => $composableBuilder(
    column: $table.hidden,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get footedness => $composableBuilder(
    column: $table.footedness,
    builder: (column) => column,
  );

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get technical =>
      $composableBuilder(column: $table.technical, builder: (column) => column);

  GeneratedColumn<String> get mental =>
      $composableBuilder(column: $table.mental, builder: (column) => column);

  GeneratedColumn<String> get physical =>
      $composableBuilder(column: $table.physical, builder: (column) => column);

  GeneratedColumn<String> get hidden =>
      $composableBuilder(column: $table.hidden, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);
}

class $$PlayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayersTable,
          PlayerRecord,
          $$PlayersTableFilterComposer,
          $$PlayersTableOrderingComposer,
          $$PlayersTableAnnotationComposer,
          $$PlayersTableCreateCompanionBuilder,
          $$PlayersTableUpdateCompanionBuilder,
          (
            PlayerRecord,
            BaseReferences<_$AppDatabase, $PlayersTable, PlayerRecord>,
          ),
          PlayerRecord,
          PrefetchHooks Function()
        > {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> position = const Value.absent(),
                Value<String> footedness = const Value.absent(),
                Value<double> heightCm = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<DateTime> dateOfBirth = const Value.absent(),
                Value<String> technical = const Value.absent(),
                Value<String> mental = const Value.absent(),
                Value<String> physical = const Value.absent(),
                Value<String> hidden = const Value.absent(),
                Value<String> condition = const Value.absent(),
              }) => PlayersCompanion(
                id: id,
                name: name,
                position: position,
                footedness: footedness,
                heightCm: heightCm,
                weightKg: weightKg,
                dateOfBirth: dateOfBirth,
                technical: technical,
                mental: mental,
                physical: physical,
                hidden: hidden,
                condition: condition,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String position,
                required String footedness,
                required double heightCm,
                required double weightKg,
                required DateTime dateOfBirth,
                required String technical,
                required String mental,
                required String physical,
                required String hidden,
                required String condition,
              }) => PlayersCompanion.insert(
                id: id,
                name: name,
                position: position,
                footedness: footedness,
                heightCm: heightCm,
                weightKg: weightKg,
                dateOfBirth: dateOfBirth,
                technical: technical,
                mental: mental,
                physical: physical,
                hidden: hidden,
                condition: condition,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayersTable,
      PlayerRecord,
      $$PlayersTableFilterComposer,
      $$PlayersTableOrderingComposer,
      $$PlayersTableAnnotationComposer,
      $$PlayersTableCreateCompanionBuilder,
      $$PlayersTableUpdateCompanionBuilder,
      (
        PlayerRecord,
        BaseReferences<_$AppDatabase, $PlayersTable, PlayerRecord>,
      ),
      PlayerRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
}
