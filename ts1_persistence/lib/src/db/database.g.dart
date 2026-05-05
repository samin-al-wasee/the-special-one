// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ContinentsTable extends Continents
    with TableInfo<$ContinentsTable, ContinentRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContinentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 2,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, code];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'continents';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContinentRecord> instance, {
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
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContinentRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContinentRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
    );
  }

  @override
  $ContinentsTable createAlias(String alias) {
    return $ContinentsTable(attachedDatabase, alias);
  }
}

class ContinentRecord extends DataClass implements Insertable<ContinentRecord> {
  final int id;
  final String name;
  final String code;
  const ContinentRecord({
    required this.id,
    required this.name,
    required this.code,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    return map;
  }

  ContinentsCompanion toCompanion(bool nullToAbsent) {
    return ContinentsCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
    );
  }

  factory ContinentRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContinentRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
    };
  }

  ContinentRecord copyWith({int? id, String? name, String? code}) =>
      ContinentRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );
  ContinentRecord copyWithCompanion(ContinentsCompanion data) {
    return ContinentRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContinentRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContinentRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code);
}

class ContinentsCompanion extends UpdateCompanion<ContinentRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  const ContinentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
  });
  ContinentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
  }) : name = Value(name),
       code = Value(code);
  static Insertable<ContinentRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
    });
  }

  ContinentsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? code,
  }) {
    return ContinentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContinentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }
}

class $CountriesTable extends Countries
    with TableInfo<$CountriesTable, CountryRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 3,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _continentIdMeta = const VerificationMeta(
    'continentId',
  );
  @override
  late final GeneratedColumn<int> continentId = GeneratedColumn<int>(
    'continent_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES continents (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, code, continentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountryRecord> instance, {
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
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('continent_id')) {
      context.handle(
        _continentIdMeta,
        continentId.isAcceptableOrUnknown(
          data['continent_id']!,
          _continentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_continentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountryRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      continentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}continent_id'],
      )!,
    );
  }

  @override
  $CountriesTable createAlias(String alias) {
    return $CountriesTable(attachedDatabase, alias);
  }
}

class CountryRecord extends DataClass implements Insertable<CountryRecord> {
  final int id;
  final String name;
  final String code;
  final int continentId;
  const CountryRecord({
    required this.id,
    required this.name,
    required this.code,
    required this.continentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    map['continent_id'] = Variable<int>(continentId);
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
      continentId: Value(continentId),
    );
  }

  factory CountryRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      continentId: serializer.fromJson<int>(json['continentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'continentId': serializer.toJson<int>(continentId),
    };
  }

  CountryRecord copyWith({
    int? id,
    String? name,
    String? code,
    int? continentId,
  }) => CountryRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    code: code ?? this.code,
    continentId: continentId ?? this.continentId,
  );
  CountryRecord copyWithCompanion(CountriesCompanion data) {
    return CountryRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      continentId: data.continentId.present
          ? data.continentId.value
          : this.continentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('continentId: $continentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, continentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.continentId == this.continentId);
}

class CountriesCompanion extends UpdateCompanion<CountryRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  final Value<int> continentId;
  const CountriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.continentId = const Value.absent(),
  });
  CountriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
    required int continentId,
  }) : name = Value(name),
       code = Value(code),
       continentId = Value(continentId);
  static Insertable<CountryRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<int>? continentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (continentId != null) 'continent_id': continentId,
    });
  }

  CountriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? code,
    Value<int>? continentId,
  }) {
    return CountriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      continentId: continentId ?? this.continentId,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (continentId.present) {
      map['continent_id'] = Variable<int>(continentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('continentId: $continentId')
          ..write(')'))
        .toString();
  }
}

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
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
    'country_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES countries (id)',
    ),
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
    countryId,
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
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
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
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}country_id'],
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
  final int countryId;
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
    required this.countryId,
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
    map['country_id'] = Variable<int>(countryId);
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
      countryId: Value(countryId),
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
      countryId: serializer.fromJson<int>(json['countryId']),
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
      'countryId': serializer.toJson<int>(countryId),
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
    int? countryId,
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
    countryId: countryId ?? this.countryId,
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
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
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
          ..write('countryId: $countryId, ')
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
    countryId,
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
          other.countryId == this.countryId &&
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
  final Value<int> countryId;
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
    this.countryId = const Value.absent(),
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
    required int countryId,
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
       countryId = Value(countryId),
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
    Expression<int>? countryId,
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
      if (countryId != null) 'country_id': countryId,
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
    Value<int>? countryId,
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
      countryId: countryId ?? this.countryId,
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
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
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
          ..write('countryId: $countryId, ')
          ..write('technical: $technical, ')
          ..write('mental: $mental, ')
          ..write('physical: $physical, ')
          ..write('hidden: $hidden, ')
          ..write('condition: $condition')
          ..write(')'))
        .toString();
  }
}

class $NationalTeamsTable extends NationalTeams
    with TableInfo<$NationalTeamsTable, NationalTeamRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NationalTeamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
    'country_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES countries (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _lineupMeta = const VerificationMeta('lineup');
  @override
  late final GeneratedColumn<String> lineup = GeneratedColumn<String>(
    'lineup',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _tacticsMeta = const VerificationMeta(
    'tactics',
  );
  @override
  late final GeneratedColumn<String> tactics = GeneratedColumn<String>(
    'tactics',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _primaryColorMeta = const VerificationMeta(
    'primaryColor',
  );
  @override
  late final GeneratedColumn<String> primaryColor = GeneratedColumn<String>(
    'primary_color',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 4,
      maxTextLength: 7,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _secondaryColorMeta = const VerificationMeta(
    'secondaryColor',
  );
  @override
  late final GeneratedColumn<String> secondaryColor = GeneratedColumn<String>(
    'secondary_color',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 4,
      maxTextLength: 7,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tertiaryColorMeta = const VerificationMeta(
    'tertiaryColor',
  );
  @override
  late final GeneratedColumn<String> tertiaryColor = GeneratedColumn<String>(
    'tertiary_color',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 4,
      maxTextLength: 7,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    countryId,
    name,
    lineup,
    tactics,
    primaryColor,
    secondaryColor,
    tertiaryColor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'national_teams';
  @override
  VerificationContext validateIntegrity(
    Insertable<NationalTeamRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lineup')) {
      context.handle(
        _lineupMeta,
        lineup.isAcceptableOrUnknown(data['lineup']!, _lineupMeta),
      );
    }
    if (data.containsKey('tactics')) {
      context.handle(
        _tacticsMeta,
        tactics.isAcceptableOrUnknown(data['tactics']!, _tacticsMeta),
      );
    }
    if (data.containsKey('primary_color')) {
      context.handle(
        _primaryColorMeta,
        primaryColor.isAcceptableOrUnknown(
          data['primary_color']!,
          _primaryColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_primaryColorMeta);
    }
    if (data.containsKey('secondary_color')) {
      context.handle(
        _secondaryColorMeta,
        secondaryColor.isAcceptableOrUnknown(
          data['secondary_color']!,
          _secondaryColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_secondaryColorMeta);
    }
    if (data.containsKey('tertiary_color')) {
      context.handle(
        _tertiaryColorMeta,
        tertiaryColor.isAcceptableOrUnknown(
          data['tertiary_color']!,
          _tertiaryColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tertiaryColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NationalTeamRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NationalTeamRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}country_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lineup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lineup'],
      )!,
      tactics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tactics'],
      )!,
      primaryColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_color'],
      )!,
      secondaryColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secondary_color'],
      )!,
      tertiaryColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tertiary_color'],
      )!,
    );
  }

  @override
  $NationalTeamsTable createAlias(String alias) {
    return $NationalTeamsTable(attachedDatabase, alias);
  }
}

class NationalTeamRecord extends DataClass
    implements Insertable<NationalTeamRecord> {
  final int id;
  final int countryId;
  final String name;
  final String lineup;
  final String tactics;
  final String primaryColor;
  final String secondaryColor;
  final String tertiaryColor;
  const NationalTeamRecord({
    required this.id,
    required this.countryId,
    required this.name,
    required this.lineup,
    required this.tactics,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['country_id'] = Variable<int>(countryId);
    map['name'] = Variable<String>(name);
    map['lineup'] = Variable<String>(lineup);
    map['tactics'] = Variable<String>(tactics);
    map['primary_color'] = Variable<String>(primaryColor);
    map['secondary_color'] = Variable<String>(secondaryColor);
    map['tertiary_color'] = Variable<String>(tertiaryColor);
    return map;
  }

  NationalTeamsCompanion toCompanion(bool nullToAbsent) {
    return NationalTeamsCompanion(
      id: Value(id),
      countryId: Value(countryId),
      name: Value(name),
      lineup: Value(lineup),
      tactics: Value(tactics),
      primaryColor: Value(primaryColor),
      secondaryColor: Value(secondaryColor),
      tertiaryColor: Value(tertiaryColor),
    );
  }

  factory NationalTeamRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NationalTeamRecord(
      id: serializer.fromJson<int>(json['id']),
      countryId: serializer.fromJson<int>(json['countryId']),
      name: serializer.fromJson<String>(json['name']),
      lineup: serializer.fromJson<String>(json['lineup']),
      tactics: serializer.fromJson<String>(json['tactics']),
      primaryColor: serializer.fromJson<String>(json['primaryColor']),
      secondaryColor: serializer.fromJson<String>(json['secondaryColor']),
      tertiaryColor: serializer.fromJson<String>(json['tertiaryColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryId': serializer.toJson<int>(countryId),
      'name': serializer.toJson<String>(name),
      'lineup': serializer.toJson<String>(lineup),
      'tactics': serializer.toJson<String>(tactics),
      'primaryColor': serializer.toJson<String>(primaryColor),
      'secondaryColor': serializer.toJson<String>(secondaryColor),
      'tertiaryColor': serializer.toJson<String>(tertiaryColor),
    };
  }

  NationalTeamRecord copyWith({
    int? id,
    int? countryId,
    String? name,
    String? lineup,
    String? tactics,
    String? primaryColor,
    String? secondaryColor,
    String? tertiaryColor,
  }) => NationalTeamRecord(
    id: id ?? this.id,
    countryId: countryId ?? this.countryId,
    name: name ?? this.name,
    lineup: lineup ?? this.lineup,
    tactics: tactics ?? this.tactics,
    primaryColor: primaryColor ?? this.primaryColor,
    secondaryColor: secondaryColor ?? this.secondaryColor,
    tertiaryColor: tertiaryColor ?? this.tertiaryColor,
  );
  NationalTeamRecord copyWithCompanion(NationalTeamsCompanion data) {
    return NationalTeamRecord(
      id: data.id.present ? data.id.value : this.id,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      name: data.name.present ? data.name.value : this.name,
      lineup: data.lineup.present ? data.lineup.value : this.lineup,
      tactics: data.tactics.present ? data.tactics.value : this.tactics,
      primaryColor: data.primaryColor.present
          ? data.primaryColor.value
          : this.primaryColor,
      secondaryColor: data.secondaryColor.present
          ? data.secondaryColor.value
          : this.secondaryColor,
      tertiaryColor: data.tertiaryColor.present
          ? data.tertiaryColor.value
          : this.tertiaryColor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NationalTeamRecord(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('lineup: $lineup, ')
          ..write('tactics: $tactics, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('secondaryColor: $secondaryColor, ')
          ..write('tertiaryColor: $tertiaryColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    countryId,
    name,
    lineup,
    tactics,
    primaryColor,
    secondaryColor,
    tertiaryColor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NationalTeamRecord &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.name == this.name &&
          other.lineup == this.lineup &&
          other.tactics == this.tactics &&
          other.primaryColor == this.primaryColor &&
          other.secondaryColor == this.secondaryColor &&
          other.tertiaryColor == this.tertiaryColor);
}

class NationalTeamsCompanion extends UpdateCompanion<NationalTeamRecord> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<String> name;
  final Value<String> lineup;
  final Value<String> tactics;
  final Value<String> primaryColor;
  final Value<String> secondaryColor;
  final Value<String> tertiaryColor;
  const NationalTeamsCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.name = const Value.absent(),
    this.lineup = const Value.absent(),
    this.tactics = const Value.absent(),
    this.primaryColor = const Value.absent(),
    this.secondaryColor = const Value.absent(),
    this.tertiaryColor = const Value.absent(),
  });
  NationalTeamsCompanion.insert({
    this.id = const Value.absent(),
    required int countryId,
    required String name,
    this.lineup = const Value.absent(),
    this.tactics = const Value.absent(),
    required String primaryColor,
    required String secondaryColor,
    required String tertiaryColor,
  }) : countryId = Value(countryId),
       name = Value(name),
       primaryColor = Value(primaryColor),
       secondaryColor = Value(secondaryColor),
       tertiaryColor = Value(tertiaryColor);
  static Insertable<NationalTeamRecord> custom({
    Expression<int>? id,
    Expression<int>? countryId,
    Expression<String>? name,
    Expression<String>? lineup,
    Expression<String>? tactics,
    Expression<String>? primaryColor,
    Expression<String>? secondaryColor,
    Expression<String>? tertiaryColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (name != null) 'name': name,
      if (lineup != null) 'lineup': lineup,
      if (tactics != null) 'tactics': tactics,
      if (primaryColor != null) 'primary_color': primaryColor,
      if (secondaryColor != null) 'secondary_color': secondaryColor,
      if (tertiaryColor != null) 'tertiary_color': tertiaryColor,
    });
  }

  NationalTeamsCompanion copyWith({
    Value<int>? id,
    Value<int>? countryId,
    Value<String>? name,
    Value<String>? lineup,
    Value<String>? tactics,
    Value<String>? primaryColor,
    Value<String>? secondaryColor,
    Value<String>? tertiaryColor,
  }) {
    return NationalTeamsCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      lineup: lineup ?? this.lineup,
      tactics: tactics ?? this.tactics,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lineup.present) {
      map['lineup'] = Variable<String>(lineup.value);
    }
    if (tactics.present) {
      map['tactics'] = Variable<String>(tactics.value);
    }
    if (primaryColor.present) {
      map['primary_color'] = Variable<String>(primaryColor.value);
    }
    if (secondaryColor.present) {
      map['secondary_color'] = Variable<String>(secondaryColor.value);
    }
    if (tertiaryColor.present) {
      map['tertiary_color'] = Variable<String>(tertiaryColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NationalTeamsCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('lineup: $lineup, ')
          ..write('tactics: $tactics, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('secondaryColor: $secondaryColor, ')
          ..write('tertiaryColor: $tertiaryColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContinentsTable continents = $ContinentsTable(this);
  late final $CountriesTable countries = $CountriesTable(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $NationalTeamsTable nationalTeams = $NationalTeamsTable(this);
  late final CountryDao countryDao = CountryDao(this as AppDatabase);
  late final PlayerDao playerDao = PlayerDao(this as AppDatabase);
  late final NationalTeamDao nationalTeamDao = NationalTeamDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    continents,
    countries,
    players,
    nationalTeams,
  ];
}

typedef $$ContinentsTableCreateCompanionBuilder =
    ContinentsCompanion Function({
      Value<int> id,
      required String name,
      required String code,
    });
typedef $$ContinentsTableUpdateCompanionBuilder =
    ContinentsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> code,
    });

final class $$ContinentsTableReferences
    extends BaseReferences<_$AppDatabase, $ContinentsTable, ContinentRecord> {
  $$ContinentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CountriesTable, List<CountryRecord>>
  _countriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.countries,
    aliasName: $_aliasNameGenerator(db.continents.id, db.countries.continentId),
  );

  $$CountriesTableProcessedTableManager get countriesRefs {
    final manager = $$CountriesTableTableManager(
      $_db,
      $_db.countries,
    ).filter((f) => f.continentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_countriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ContinentsTableFilterComposer
    extends Composer<_$AppDatabase, $ContinentsTable> {
  $$ContinentsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> countriesRefs(
    Expression<bool> Function($$CountriesTableFilterComposer f) f,
  ) {
    final $$CountriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.continentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableFilterComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContinentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContinentsTable> {
  $$ContinentsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContinentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContinentsTable> {
  $$ContinentsTableAnnotationComposer({
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

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  Expression<T> countriesRefs<T extends Object>(
    Expression<T> Function($$CountriesTableAnnotationComposer a) f,
  ) {
    final $$CountriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.continentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableAnnotationComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContinentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContinentsTable,
          ContinentRecord,
          $$ContinentsTableFilterComposer,
          $$ContinentsTableOrderingComposer,
          $$ContinentsTableAnnotationComposer,
          $$ContinentsTableCreateCompanionBuilder,
          $$ContinentsTableUpdateCompanionBuilder,
          (ContinentRecord, $$ContinentsTableReferences),
          ContinentRecord,
          PrefetchHooks Function({bool countriesRefs})
        > {
  $$ContinentsTableTableManager(_$AppDatabase db, $ContinentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContinentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContinentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContinentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> code = const Value.absent(),
              }) => ContinentsCompanion(id: id, name: name, code: code),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String code,
              }) => ContinentsCompanion.insert(id: id, name: name, code: code),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContinentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({countriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (countriesRefs) db.countries],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (countriesRefs)
                    await $_getPrefetchedData<
                      ContinentRecord,
                      $ContinentsTable,
                      CountryRecord
                    >(
                      currentTable: table,
                      referencedTable: $$ContinentsTableReferences
                          ._countriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ContinentsTableReferences(
                            db,
                            table,
                            p0,
                          ).countriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.continentId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ContinentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContinentsTable,
      ContinentRecord,
      $$ContinentsTableFilterComposer,
      $$ContinentsTableOrderingComposer,
      $$ContinentsTableAnnotationComposer,
      $$ContinentsTableCreateCompanionBuilder,
      $$ContinentsTableUpdateCompanionBuilder,
      (ContinentRecord, $$ContinentsTableReferences),
      ContinentRecord,
      PrefetchHooks Function({bool countriesRefs})
    >;
typedef $$CountriesTableCreateCompanionBuilder =
    CountriesCompanion Function({
      Value<int> id,
      required String name,
      required String code,
      required int continentId,
    });
typedef $$CountriesTableUpdateCompanionBuilder =
    CountriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> code,
      Value<int> continentId,
    });

final class $$CountriesTableReferences
    extends BaseReferences<_$AppDatabase, $CountriesTable, CountryRecord> {
  $$CountriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ContinentsTable _continentIdTable(_$AppDatabase db) =>
      db.continents.createAlias(
        $_aliasNameGenerator(db.countries.continentId, db.continents.id),
      );

  $$ContinentsTableProcessedTableManager get continentId {
    final $_column = $_itemColumn<int>('continent_id')!;

    final manager = $$ContinentsTableTableManager(
      $_db,
      $_db.continents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_continentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PlayersTable, List<PlayerRecord>>
  _playersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.players,
    aliasName: $_aliasNameGenerator(db.countries.id, db.players.countryId),
  );

  $$PlayersTableProcessedTableManager get playersRefs {
    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.countryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NationalTeamsTable, List<NationalTeamRecord>>
  _nationalTeamsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.nationalTeams,
    aliasName: $_aliasNameGenerator(
      db.countries.id,
      db.nationalTeams.countryId,
    ),
  );

  $$NationalTeamsTableProcessedTableManager get nationalTeamsRefs {
    final manager = $$NationalTeamsTableTableManager(
      $_db,
      $_db.nationalTeams,
    ).filter((f) => f.countryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_nationalTeamsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CountriesTableFilterComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  $$ContinentsTableFilterComposer get continentId {
    final $$ContinentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.continentId,
      referencedTable: $db.continents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContinentsTableFilterComposer(
            $db: $db,
            $table: $db.continents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> playersRefs(
    Expression<bool> Function($$PlayersTableFilterComposer f) f,
  ) {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> nationalTeamsRefs(
    Expression<bool> Function($$NationalTeamsTableFilterComposer f) f,
  ) {
    final $$NationalTeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nationalTeams,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NationalTeamsTableFilterComposer(
            $db: $db,
            $table: $db.nationalTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  $$ContinentsTableOrderingComposer get continentId {
    final $$ContinentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.continentId,
      referencedTable: $db.continents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContinentsTableOrderingComposer(
            $db: $db,
            $table: $db.continents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CountriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableAnnotationComposer({
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

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  $$ContinentsTableAnnotationComposer get continentId {
    final $$ContinentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.continentId,
      referencedTable: $db.continents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContinentsTableAnnotationComposer(
            $db: $db,
            $table: $db.continents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> playersRefs<T extends Object>(
    Expression<T> Function($$PlayersTableAnnotationComposer a) f,
  ) {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> nationalTeamsRefs<T extends Object>(
    Expression<T> Function($$NationalTeamsTableAnnotationComposer a) f,
  ) {
    final $$NationalTeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nationalTeams,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NationalTeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.nationalTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountriesTable,
          CountryRecord,
          $$CountriesTableFilterComposer,
          $$CountriesTableOrderingComposer,
          $$CountriesTableAnnotationComposer,
          $$CountriesTableCreateCompanionBuilder,
          $$CountriesTableUpdateCompanionBuilder,
          (CountryRecord, $$CountriesTableReferences),
          CountryRecord,
          PrefetchHooks Function({
            bool continentId,
            bool playersRefs,
            bool nationalTeamsRefs,
          })
        > {
  $$CountriesTableTableManager(_$AppDatabase db, $CountriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<int> continentId = const Value.absent(),
              }) => CountriesCompanion(
                id: id,
                name: name,
                code: code,
                continentId: continentId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String code,
                required int continentId,
              }) => CountriesCompanion.insert(
                id: id,
                name: name,
                code: code,
                continentId: continentId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CountriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                continentId = false,
                playersRefs = false,
                nationalTeamsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playersRefs) db.players,
                    if (nationalTeamsRefs) db.nationalTeams,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (continentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.continentId,
                                    referencedTable: $$CountriesTableReferences
                                        ._continentIdTable(db),
                                    referencedColumn: $$CountriesTableReferences
                                        ._continentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playersRefs)
                        await $_getPrefetchedData<
                          CountryRecord,
                          $CountriesTable,
                          PlayerRecord
                        >(
                          currentTable: table,
                          referencedTable: $$CountriesTableReferences
                              ._playersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CountriesTableReferences(
                                db,
                                table,
                                p0,
                              ).playersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.countryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (nationalTeamsRefs)
                        await $_getPrefetchedData<
                          CountryRecord,
                          $CountriesTable,
                          NationalTeamRecord
                        >(
                          currentTable: table,
                          referencedTable: $$CountriesTableReferences
                              ._nationalTeamsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CountriesTableReferences(
                                db,
                                table,
                                p0,
                              ).nationalTeamsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.countryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CountriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountriesTable,
      CountryRecord,
      $$CountriesTableFilterComposer,
      $$CountriesTableOrderingComposer,
      $$CountriesTableAnnotationComposer,
      $$CountriesTableCreateCompanionBuilder,
      $$CountriesTableUpdateCompanionBuilder,
      (CountryRecord, $$CountriesTableReferences),
      CountryRecord,
      PrefetchHooks Function({
        bool continentId,
        bool playersRefs,
        bool nationalTeamsRefs,
      })
    >;
typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      required String name,
      required String position,
      required String footedness,
      required double heightCm,
      required double weightKg,
      required DateTime dateOfBirth,
      required int countryId,
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
      Value<int> countryId,
      Value<String> technical,
      Value<String> mental,
      Value<String> physical,
      Value<String> hidden,
      Value<String> condition,
    });

final class $$PlayersTableReferences
    extends BaseReferences<_$AppDatabase, $PlayersTable, PlayerRecord> {
  $$PlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CountriesTable _countryIdTable(_$AppDatabase db) => db.countries
      .createAlias($_aliasNameGenerator(db.players.countryId, db.countries.id));

  $$CountriesTableProcessedTableManager get countryId {
    final $_column = $_itemColumn<int>('country_id')!;

    final manager = $$CountriesTableTableManager(
      $_db,
      $_db.countries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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

  $$CountriesTableFilterComposer get countryId {
    final $$CountriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableFilterComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$CountriesTableOrderingComposer get countryId {
    final $$CountriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableOrderingComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$CountriesTableAnnotationComposer get countryId {
    final $$CountriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableAnnotationComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (PlayerRecord, $$PlayersTableReferences),
          PlayerRecord,
          PrefetchHooks Function({bool countryId})
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
                Value<int> countryId = const Value.absent(),
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
                countryId: countryId,
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
                required int countryId,
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
                countryId: countryId,
                technical: technical,
                mental: mental,
                physical: physical,
                hidden: hidden,
                condition: condition,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({countryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (countryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.countryId,
                                referencedTable: $$PlayersTableReferences
                                    ._countryIdTable(db),
                                referencedColumn: $$PlayersTableReferences
                                    ._countryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (PlayerRecord, $$PlayersTableReferences),
      PlayerRecord,
      PrefetchHooks Function({bool countryId})
    >;
typedef $$NationalTeamsTableCreateCompanionBuilder =
    NationalTeamsCompanion Function({
      Value<int> id,
      required int countryId,
      required String name,
      Value<String> lineup,
      Value<String> tactics,
      required String primaryColor,
      required String secondaryColor,
      required String tertiaryColor,
    });
typedef $$NationalTeamsTableUpdateCompanionBuilder =
    NationalTeamsCompanion Function({
      Value<int> id,
      Value<int> countryId,
      Value<String> name,
      Value<String> lineup,
      Value<String> tactics,
      Value<String> primaryColor,
      Value<String> secondaryColor,
      Value<String> tertiaryColor,
    });

final class $$NationalTeamsTableReferences
    extends
        BaseReferences<_$AppDatabase, $NationalTeamsTable, NationalTeamRecord> {
  $$NationalTeamsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CountriesTable _countryIdTable(_$AppDatabase db) =>
      db.countries.createAlias(
        $_aliasNameGenerator(db.nationalTeams.countryId, db.countries.id),
      );

  $$CountriesTableProcessedTableManager get countryId {
    final $_column = $_itemColumn<int>('country_id')!;

    final manager = $$CountriesTableTableManager(
      $_db,
      $_db.countries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NationalTeamsTableFilterComposer
    extends Composer<_$AppDatabase, $NationalTeamsTable> {
  $$NationalTeamsTableFilterComposer({
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

  ColumnFilters<String> get lineup => $composableBuilder(
    column: $table.lineup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tactics => $composableBuilder(
    column: $table.tactics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get primaryColor => $composableBuilder(
    column: $table.primaryColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secondaryColor => $composableBuilder(
    column: $table.secondaryColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tertiaryColor => $composableBuilder(
    column: $table.tertiaryColor,
    builder: (column) => ColumnFilters(column),
  );

  $$CountriesTableFilterComposer get countryId {
    final $$CountriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableFilterComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NationalTeamsTableOrderingComposer
    extends Composer<_$AppDatabase, $NationalTeamsTable> {
  $$NationalTeamsTableOrderingComposer({
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

  ColumnOrderings<String> get lineup => $composableBuilder(
    column: $table.lineup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tactics => $composableBuilder(
    column: $table.tactics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryColor => $composableBuilder(
    column: $table.primaryColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondaryColor => $composableBuilder(
    column: $table.secondaryColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tertiaryColor => $composableBuilder(
    column: $table.tertiaryColor,
    builder: (column) => ColumnOrderings(column),
  );

  $$CountriesTableOrderingComposer get countryId {
    final $$CountriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableOrderingComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NationalTeamsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NationalTeamsTable> {
  $$NationalTeamsTableAnnotationComposer({
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

  GeneratedColumn<String> get lineup =>
      $composableBuilder(column: $table.lineup, builder: (column) => column);

  GeneratedColumn<String> get tactics =>
      $composableBuilder(column: $table.tactics, builder: (column) => column);

  GeneratedColumn<String> get primaryColor => $composableBuilder(
    column: $table.primaryColor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get secondaryColor => $composableBuilder(
    column: $table.secondaryColor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tertiaryColor => $composableBuilder(
    column: $table.tertiaryColor,
    builder: (column) => column,
  );

  $$CountriesTableAnnotationComposer get countryId {
    final $$CountriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountriesTableAnnotationComposer(
            $db: $db,
            $table: $db.countries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NationalTeamsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NationalTeamsTable,
          NationalTeamRecord,
          $$NationalTeamsTableFilterComposer,
          $$NationalTeamsTableOrderingComposer,
          $$NationalTeamsTableAnnotationComposer,
          $$NationalTeamsTableCreateCompanionBuilder,
          $$NationalTeamsTableUpdateCompanionBuilder,
          (NationalTeamRecord, $$NationalTeamsTableReferences),
          NationalTeamRecord,
          PrefetchHooks Function({bool countryId})
        > {
  $$NationalTeamsTableTableManager(_$AppDatabase db, $NationalTeamsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NationalTeamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NationalTeamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NationalTeamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> countryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> lineup = const Value.absent(),
                Value<String> tactics = const Value.absent(),
                Value<String> primaryColor = const Value.absent(),
                Value<String> secondaryColor = const Value.absent(),
                Value<String> tertiaryColor = const Value.absent(),
              }) => NationalTeamsCompanion(
                id: id,
                countryId: countryId,
                name: name,
                lineup: lineup,
                tactics: tactics,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                tertiaryColor: tertiaryColor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int countryId,
                required String name,
                Value<String> lineup = const Value.absent(),
                Value<String> tactics = const Value.absent(),
                required String primaryColor,
                required String secondaryColor,
                required String tertiaryColor,
              }) => NationalTeamsCompanion.insert(
                id: id,
                countryId: countryId,
                name: name,
                lineup: lineup,
                tactics: tactics,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                tertiaryColor: tertiaryColor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NationalTeamsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({countryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (countryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.countryId,
                                referencedTable: $$NationalTeamsTableReferences
                                    ._countryIdTable(db),
                                referencedColumn: $$NationalTeamsTableReferences
                                    ._countryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NationalTeamsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NationalTeamsTable,
      NationalTeamRecord,
      $$NationalTeamsTableFilterComposer,
      $$NationalTeamsTableOrderingComposer,
      $$NationalTeamsTableAnnotationComposer,
      $$NationalTeamsTableCreateCompanionBuilder,
      $$NationalTeamsTableUpdateCompanionBuilder,
      (NationalTeamRecord, $$NationalTeamsTableReferences),
      NationalTeamRecord,
      PrefetchHooks Function({bool countryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContinentsTableTableManager get continents =>
      $$ContinentsTableTableManager(_db, _db.continents);
  $$CountriesTableTableManager get countries =>
      $$CountriesTableTableManager(_db, _db.countries);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$NationalTeamsTableTableManager get nationalTeams =>
      $$NationalTeamsTableTableManager(_db, _db.nationalTeams);
}
