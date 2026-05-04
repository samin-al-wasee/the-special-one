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
  final String primaryColor;
  final String secondaryColor;
  final String tertiaryColor;
  const NationalTeamRecord({
    required this.id,
    required this.countryId,
    required this.name,
    required this.lineup,
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
    String? primaryColor,
    String? secondaryColor,
    String? tertiaryColor,
  }) => NationalTeamRecord(
    id: id ?? this.id,
    countryId: countryId ?? this.countryId,
    name: name ?? this.name,
    lineup: lineup ?? this.lineup,
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
          other.primaryColor == this.primaryColor &&
          other.secondaryColor == this.secondaryColor &&
          other.tertiaryColor == this.tertiaryColor);
}

class NationalTeamsCompanion extends UpdateCompanion<NationalTeamRecord> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<String> name;
  final Value<String> lineup;
  final Value<String> primaryColor;
  final Value<String> secondaryColor;
  final Value<String> tertiaryColor;
  const NationalTeamsCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.name = const Value.absent(),
    this.lineup = const Value.absent(),
    this.primaryColor = const Value.absent(),
    this.secondaryColor = const Value.absent(),
    this.tertiaryColor = const Value.absent(),
  });
  NationalTeamsCompanion.insert({
    this.id = const Value.absent(),
    required int countryId,
    required String name,
    this.lineup = const Value.absent(),
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
    Expression<String>? primaryColor,
    Expression<String>? secondaryColor,
    Expression<String>? tertiaryColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (name != null) 'name': name,
      if (lineup != null) 'lineup': lineup,
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
    Value<String>? primaryColor,
    Value<String>? secondaryColor,
    Value<String>? tertiaryColor,
  }) {
    return NationalTeamsCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      lineup: lineup ?? this.lineup,
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
          ..write('primaryColor: $primaryColor, ')
          ..write('secondaryColor: $secondaryColor, ')
          ..write('tertiaryColor: $tertiaryColor')
          ..write(')'))
        .toString();
  }
}

class $NationalTeamTacticsTable extends NationalTeamTactics
    with TableInfo<$NationalTeamTacticsTable, NationalTeamTacticRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NationalTeamTacticsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<int> teamId = GeneratedColumn<int>(
    'team_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _presetNameMeta = const VerificationMeta(
    'presetName',
  );
  @override
  late final GeneratedColumn<String> presetName = GeneratedColumn<String>(
    'preset_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (preset_name IN (\'Possession Control\', \'Vertical Attack\', \'Counter-Attack\', \'Wing Play\', \'High Press\', \'Low Block\', \'Direct Football\', \'Balanced\', \'Set-Piece Focus\', \'Tiki-Taka\', \'Gegenpress\', \'Catenaccio\', \'Route One\', \'Total Football\', \'Joga Bonito\', \'Compact Transition\', \'Positional Press\'))',
  );
  static const VerificationMeta _buildUpStyleMeta = const VerificationMeta(
    'buildUpStyle',
  );
  @override
  late final GeneratedColumn<String> buildUpStyle = GeneratedColumn<String>(
    'build_up_style',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (build_up_style IN (\'buildFromBack\', \'mixedBuildUp\', \'directProgression\', \'longBall\', \'counterBuildUp\'))',
  );
  static const VerificationMeta _tempoMeta = const VerificationMeta('tempo');
  @override
  late final GeneratedColumn<String> tempo = GeneratedColumn<String>(
    'tempo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (tempo IN (\'veryLow\', \'low\', \'balanced\', \'high\', \'veryHigh\'))',
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<String> width = GeneratedColumn<String>(
    'width',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (width IN (\'veryNarrow\', \'narrow\', \'balanced\', \'wide\', \'veryWide\'))',
  );
  static const VerificationMeta _finalThirdFocusMeta = const VerificationMeta(
    'finalThirdFocus',
  );
  @override
  late final GeneratedColumn<String> finalThirdFocus = GeneratedColumn<String>(
    'final_third_focus',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (final_third_focus IN (\'workBallIntoBox\', \'mixedAttacking\', \'shootOnSight\', \'crossEarly\', \'overlapWide\', \'underlapInside\', \'throughBallFocus\', \'dribbleMore\', \'holdPossession\'))',
  );
  static const VerificationMeta _attackingFocusMeta = const VerificationMeta(
    'attackingFocus',
  );
  @override
  late final GeneratedColumn<String> attackingFocus = GeneratedColumn<String>(
    'attacking_focus',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (attacking_focus IN (\'attackLeft\', \'attackRight\', \'attackCentre\', \'mixed\', \'switchFlanksOften\', \'targetHalfSpaces\'))',
  );
  static const VerificationMeta _defensiveLineMeta = const VerificationMeta(
    'defensiveLine',
  );
  @override
  late final GeneratedColumn<String> defensiveLine = GeneratedColumn<String>(
    'defensive_line',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (defensive_line IN (\'veryDeep\', \'deep\', \'standard\', \'high\', \'veryHigh\'))',
  );
  static const VerificationMeta _lineOfEngagementMeta = const VerificationMeta(
    'lineOfEngagement',
  );
  @override
  late final GeneratedColumn<String> lineOfEngagement = GeneratedColumn<String>(
    'line_of_engagement',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (line_of_engagement IN (\'lowBlock\', \'midBlock\', \'highBlock\', \'fullPress\'))',
  );
  static const VerificationMeta _pressingIntensityMeta = const VerificationMeta(
    'pressingIntensity',
  );
  @override
  late final GeneratedColumn<String>
  pressingIntensity = GeneratedColumn<String>(
    'pressing_intensity',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (pressing_intensity IN (\'veryLow\', \'low\', \'balanced\', \'high\', \'extreme\'))',
  );
  static const VerificationMeta _defensiveWidthMeta = const VerificationMeta(
    'defensiveWidth',
  );
  @override
  late final GeneratedColumn<String> defensiveWidth = GeneratedColumn<String>(
    'defensive_width',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (defensive_width IN (\'veryNarrow\', \'narrow\', \'balanced\', \'wide\', \'veryWide\'))',
  );
  static const VerificationMeta _markingStyleMeta = const VerificationMeta(
    'markingStyle',
  );
  @override
  late final GeneratedColumn<String> markingStyle = GeneratedColumn<String>(
    'marking_style',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (marking_style IN (\'zonal\', \'mixed\', \'tightManOriented\'))',
  );
  static const VerificationMeta _tacklingAggressionMeta =
      const VerificationMeta('tacklingAggression');
  @override
  late final GeneratedColumn<String>
  tacklingAggression = GeneratedColumn<String>(
    'tackling_aggression',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (tackling_aggression IN (\'stayOnFeet\', \'balanced\', \'aggressive\', \'veryAggressive\'))',
  );
  static const VerificationMeta _transitionOnWinMeta = const VerificationMeta(
    'transitionOnWin',
  );
  @override
  late final GeneratedColumn<String> transitionOnWin = GeneratedColumn<String>(
    'transition_on_win',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (transition_on_win IN (\'counterImmediately\', \'progressSafely\', \'holdShape\', \'feedPlaymaker\', \'feedWinger\', \'goLongToStriker\', \'attackWeakSide\'))',
  );
  static const VerificationMeta _transitionOnLossMeta = const VerificationMeta(
    'transitionOnLoss',
  );
  @override
  late final GeneratedColumn<String> transitionOnLoss = GeneratedColumn<String>(
    'transition_on_loss',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (transition_on_loss IN (\'counterpress\', \'delay\', \'regroup\', \'tacticalFoul\', \'dropDeepImmediately\'))',
  );
  static const VerificationMeta _teamMentalityMeta = const VerificationMeta(
    'teamMentality',
  );
  @override
  late final GeneratedColumn<String> teamMentality = GeneratedColumn<String>(
    'team_mentality',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (team_mentality IN (\'veryDefensive\', \'defensive\', \'cautious\', \'balanced\', \'positive\', \'attacking\', \'veryAttacking\'))',
  );
  static const VerificationMeta _passingRiskMeta = const VerificationMeta(
    'passingRisk',
  );
  @override
  late final GeneratedColumn<String> passingRisk = GeneratedColumn<String>(
    'passing_risk',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (passing_risk IN (\'verySafe\', \'safe\', \'balanced\', \'risky\', \'veryRisky\'))',
  );
  static const VerificationMeta _dribblingRiskMeta = const VerificationMeta(
    'dribblingRisk',
  );
  @override
  late final GeneratedColumn<String> dribblingRisk = GeneratedColumn<String>(
    'dribbling_risk',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 25,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (dribbling_risk IN (\'veryConservative\', \'balanced\', \'aggressive\'))',
  );
  static const VerificationMeta _shootingPolicyMeta = const VerificationMeta(
    'shootingPolicy',
  );
  @override
  late final GeneratedColumn<String> shootingPolicy = GeneratedColumn<String>(
    'shooting_policy',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 25,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (shooting_policy IN (\'shootLess\', \'balanced\', \'shootMore\', \'shootAggressively\'))',
  );
  static const VerificationMeta _compactnessMeta = const VerificationMeta(
    'compactness',
  );
  @override
  late final GeneratedColumn<String> compactness = GeneratedColumn<String>(
    'compactness',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (compactness IN (\'veryCompact\', \'compact\', \'balanced\', \'loose\', \'veryLoose\'))',
  );
  static const VerificationMeta _verticalStretchMeta = const VerificationMeta(
    'verticalStretch',
  );
  @override
  late final GeneratedColumn<String> verticalStretch = GeneratedColumn<String>(
    'vertical_stretch',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (vertical_stretch IN (\'compressed\', \'balanced\', \'stretched\'))',
  );
  static const VerificationMeta _overloadFocusMeta = const VerificationMeta(
    'overloadFocus',
  );
  @override
  late final GeneratedColumn<String> overloadFocus = GeneratedColumn<String>(
    'overload_focus',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (overload_focus IN (\'leftOverload\', \'rightOverload\', \'centralOverload\', \'noSpecificOverload\'))',
  );
  static const VerificationMeta _setPieceAttackMeta = const VerificationMeta(
    'setPieceAttack',
  );
  @override
  late final GeneratedColumn<String> setPieceAttack = GeneratedColumn<String>(
    'set_piece_attack',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (set_piece_attack IN (\'nearPostCorners\', \'farPostCorners\', \'mixedCorners\', \'shortCorners\', \'crowdGoalkeeper\', \'edgeOfBoxSetup\', \'tallPlayerTargeting\', \'reboundHunting\'))',
  );
  static const VerificationMeta _setPieceDefenseMeta = const VerificationMeta(
    'setPieceDefense',
  );
  @override
  late final GeneratedColumn<String> setPieceDefense = GeneratedColumn<String>(
    'set_piece_defense',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (set_piece_defense IN (\'zonalMarking\', \'mixedMarking\', \'manMarking\', \'leavePlayersUp\', \'fullRetreat\', \'counterSetup\', \'nearPostGuard\'))',
  );
  static const VerificationMeta _freeKickStrategyMeta = const VerificationMeta(
    'freeKickStrategy',
  );
  @override
  late final GeneratedColumn<String> freeKickStrategy = GeneratedColumn<String>(
    'free_kick_strategy',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 25,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (free_kick_strategy IN (\'shootDirect\', \'crossIntoBox\', \'shortRoutine\', \'fastRestart\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teamId,
    presetName,
    buildUpStyle,
    tempo,
    width,
    finalThirdFocus,
    attackingFocus,
    defensiveLine,
    lineOfEngagement,
    pressingIntensity,
    defensiveWidth,
    markingStyle,
    tacklingAggression,
    transitionOnWin,
    transitionOnLoss,
    teamMentality,
    passingRisk,
    dribblingRisk,
    shootingPolicy,
    compactness,
    verticalStretch,
    overloadFocus,
    setPieceAttack,
    setPieceDefense,
    freeKickStrategy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'national_team_tactics';
  @override
  VerificationContext validateIntegrity(
    Insertable<NationalTeamTacticRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('team_id')) {
      context.handle(
        _teamIdMeta,
        teamId.isAcceptableOrUnknown(data['team_id']!, _teamIdMeta),
      );
    }
    if (data.containsKey('preset_name')) {
      context.handle(
        _presetNameMeta,
        presetName.isAcceptableOrUnknown(data['preset_name']!, _presetNameMeta),
      );
    } else if (isInserting) {
      context.missing(_presetNameMeta);
    }
    if (data.containsKey('build_up_style')) {
      context.handle(
        _buildUpStyleMeta,
        buildUpStyle.isAcceptableOrUnknown(
          data['build_up_style']!,
          _buildUpStyleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_buildUpStyleMeta);
    }
    if (data.containsKey('tempo')) {
      context.handle(
        _tempoMeta,
        tempo.isAcceptableOrUnknown(data['tempo']!, _tempoMeta),
      );
    } else if (isInserting) {
      context.missing(_tempoMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('final_third_focus')) {
      context.handle(
        _finalThirdFocusMeta,
        finalThirdFocus.isAcceptableOrUnknown(
          data['final_third_focus']!,
          _finalThirdFocusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_finalThirdFocusMeta);
    }
    if (data.containsKey('attacking_focus')) {
      context.handle(
        _attackingFocusMeta,
        attackingFocus.isAcceptableOrUnknown(
          data['attacking_focus']!,
          _attackingFocusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_attackingFocusMeta);
    }
    if (data.containsKey('defensive_line')) {
      context.handle(
        _defensiveLineMeta,
        defensiveLine.isAcceptableOrUnknown(
          data['defensive_line']!,
          _defensiveLineMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defensiveLineMeta);
    }
    if (data.containsKey('line_of_engagement')) {
      context.handle(
        _lineOfEngagementMeta,
        lineOfEngagement.isAcceptableOrUnknown(
          data['line_of_engagement']!,
          _lineOfEngagementMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lineOfEngagementMeta);
    }
    if (data.containsKey('pressing_intensity')) {
      context.handle(
        _pressingIntensityMeta,
        pressingIntensity.isAcceptableOrUnknown(
          data['pressing_intensity']!,
          _pressingIntensityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pressingIntensityMeta);
    }
    if (data.containsKey('defensive_width')) {
      context.handle(
        _defensiveWidthMeta,
        defensiveWidth.isAcceptableOrUnknown(
          data['defensive_width']!,
          _defensiveWidthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defensiveWidthMeta);
    }
    if (data.containsKey('marking_style')) {
      context.handle(
        _markingStyleMeta,
        markingStyle.isAcceptableOrUnknown(
          data['marking_style']!,
          _markingStyleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_markingStyleMeta);
    }
    if (data.containsKey('tackling_aggression')) {
      context.handle(
        _tacklingAggressionMeta,
        tacklingAggression.isAcceptableOrUnknown(
          data['tackling_aggression']!,
          _tacklingAggressionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tacklingAggressionMeta);
    }
    if (data.containsKey('transition_on_win')) {
      context.handle(
        _transitionOnWinMeta,
        transitionOnWin.isAcceptableOrUnknown(
          data['transition_on_win']!,
          _transitionOnWinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transitionOnWinMeta);
    }
    if (data.containsKey('transition_on_loss')) {
      context.handle(
        _transitionOnLossMeta,
        transitionOnLoss.isAcceptableOrUnknown(
          data['transition_on_loss']!,
          _transitionOnLossMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transitionOnLossMeta);
    }
    if (data.containsKey('team_mentality')) {
      context.handle(
        _teamMentalityMeta,
        teamMentality.isAcceptableOrUnknown(
          data['team_mentality']!,
          _teamMentalityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_teamMentalityMeta);
    }
    if (data.containsKey('passing_risk')) {
      context.handle(
        _passingRiskMeta,
        passingRisk.isAcceptableOrUnknown(
          data['passing_risk']!,
          _passingRiskMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passingRiskMeta);
    }
    if (data.containsKey('dribbling_risk')) {
      context.handle(
        _dribblingRiskMeta,
        dribblingRisk.isAcceptableOrUnknown(
          data['dribbling_risk']!,
          _dribblingRiskMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dribblingRiskMeta);
    }
    if (data.containsKey('shooting_policy')) {
      context.handle(
        _shootingPolicyMeta,
        shootingPolicy.isAcceptableOrUnknown(
          data['shooting_policy']!,
          _shootingPolicyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shootingPolicyMeta);
    }
    if (data.containsKey('compactness')) {
      context.handle(
        _compactnessMeta,
        compactness.isAcceptableOrUnknown(
          data['compactness']!,
          _compactnessMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_compactnessMeta);
    }
    if (data.containsKey('vertical_stretch')) {
      context.handle(
        _verticalStretchMeta,
        verticalStretch.isAcceptableOrUnknown(
          data['vertical_stretch']!,
          _verticalStretchMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verticalStretchMeta);
    }
    if (data.containsKey('overload_focus')) {
      context.handle(
        _overloadFocusMeta,
        overloadFocus.isAcceptableOrUnknown(
          data['overload_focus']!,
          _overloadFocusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_overloadFocusMeta);
    }
    if (data.containsKey('set_piece_attack')) {
      context.handle(
        _setPieceAttackMeta,
        setPieceAttack.isAcceptableOrUnknown(
          data['set_piece_attack']!,
          _setPieceAttackMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_setPieceAttackMeta);
    }
    if (data.containsKey('set_piece_defense')) {
      context.handle(
        _setPieceDefenseMeta,
        setPieceDefense.isAcceptableOrUnknown(
          data['set_piece_defense']!,
          _setPieceDefenseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_setPieceDefenseMeta);
    }
    if (data.containsKey('free_kick_strategy')) {
      context.handle(
        _freeKickStrategyMeta,
        freeKickStrategy.isAcceptableOrUnknown(
          data['free_kick_strategy']!,
          _freeKickStrategyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_freeKickStrategyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NationalTeamTacticRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NationalTeamTacticRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      ),
      presetName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preset_name'],
      )!,
      buildUpStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}build_up_style'],
      )!,
      tempo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tempo'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}width'],
      )!,
      finalThirdFocus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}final_third_focus'],
      )!,
      attackingFocus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attacking_focus'],
      )!,
      defensiveLine: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}defensive_line'],
      )!,
      lineOfEngagement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_of_engagement'],
      )!,
      pressingIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pressing_intensity'],
      )!,
      defensiveWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}defensive_width'],
      )!,
      markingStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marking_style'],
      )!,
      tacklingAggression: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tackling_aggression'],
      )!,
      transitionOnWin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transition_on_win'],
      )!,
      transitionOnLoss: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transition_on_loss'],
      )!,
      teamMentality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}team_mentality'],
      )!,
      passingRisk: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}passing_risk'],
      )!,
      dribblingRisk: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dribbling_risk'],
      )!,
      shootingPolicy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shooting_policy'],
      )!,
      compactness: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}compactness'],
      )!,
      verticalStretch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vertical_stretch'],
      )!,
      overloadFocus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overload_focus'],
      )!,
      setPieceAttack: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}set_piece_attack'],
      )!,
      setPieceDefense: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}set_piece_defense'],
      )!,
      freeKickStrategy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}free_kick_strategy'],
      )!,
    );
  }

  @override
  $NationalTeamTacticsTable createAlias(String alias) {
    return $NationalTeamTacticsTable(attachedDatabase, alias);
  }
}

class NationalTeamTacticRecord extends DataClass
    implements Insertable<NationalTeamTacticRecord> {
  final int id;
  final int? teamId;
  final String presetName;
  final String buildUpStyle;
  final String tempo;
  final String width;
  final String finalThirdFocus;
  final String attackingFocus;
  final String defensiveLine;
  final String lineOfEngagement;
  final String pressingIntensity;
  final String defensiveWidth;
  final String markingStyle;
  final String tacklingAggression;
  final String transitionOnWin;
  final String transitionOnLoss;
  final String teamMentality;
  final String passingRisk;
  final String dribblingRisk;
  final String shootingPolicy;
  final String compactness;
  final String verticalStretch;
  final String overloadFocus;
  final String setPieceAttack;
  final String setPieceDefense;
  final String freeKickStrategy;
  const NationalTeamTacticRecord({
    required this.id,
    this.teamId,
    required this.presetName,
    required this.buildUpStyle,
    required this.tempo,
    required this.width,
    required this.finalThirdFocus,
    required this.attackingFocus,
    required this.defensiveLine,
    required this.lineOfEngagement,
    required this.pressingIntensity,
    required this.defensiveWidth,
    required this.markingStyle,
    required this.tacklingAggression,
    required this.transitionOnWin,
    required this.transitionOnLoss,
    required this.teamMentality,
    required this.passingRisk,
    required this.dribblingRisk,
    required this.shootingPolicy,
    required this.compactness,
    required this.verticalStretch,
    required this.overloadFocus,
    required this.setPieceAttack,
    required this.setPieceDefense,
    required this.freeKickStrategy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || teamId != null) {
      map['team_id'] = Variable<int>(teamId);
    }
    map['preset_name'] = Variable<String>(presetName);
    map['build_up_style'] = Variable<String>(buildUpStyle);
    map['tempo'] = Variable<String>(tempo);
    map['width'] = Variable<String>(width);
    map['final_third_focus'] = Variable<String>(finalThirdFocus);
    map['attacking_focus'] = Variable<String>(attackingFocus);
    map['defensive_line'] = Variable<String>(defensiveLine);
    map['line_of_engagement'] = Variable<String>(lineOfEngagement);
    map['pressing_intensity'] = Variable<String>(pressingIntensity);
    map['defensive_width'] = Variable<String>(defensiveWidth);
    map['marking_style'] = Variable<String>(markingStyle);
    map['tackling_aggression'] = Variable<String>(tacklingAggression);
    map['transition_on_win'] = Variable<String>(transitionOnWin);
    map['transition_on_loss'] = Variable<String>(transitionOnLoss);
    map['team_mentality'] = Variable<String>(teamMentality);
    map['passing_risk'] = Variable<String>(passingRisk);
    map['dribbling_risk'] = Variable<String>(dribblingRisk);
    map['shooting_policy'] = Variable<String>(shootingPolicy);
    map['compactness'] = Variable<String>(compactness);
    map['vertical_stretch'] = Variable<String>(verticalStretch);
    map['overload_focus'] = Variable<String>(overloadFocus);
    map['set_piece_attack'] = Variable<String>(setPieceAttack);
    map['set_piece_defense'] = Variable<String>(setPieceDefense);
    map['free_kick_strategy'] = Variable<String>(freeKickStrategy);
    return map;
  }

  NationalTeamTacticsCompanion toCompanion(bool nullToAbsent) {
    return NationalTeamTacticsCompanion(
      id: Value(id),
      teamId: teamId == null && nullToAbsent
          ? const Value.absent()
          : Value(teamId),
      presetName: Value(presetName),
      buildUpStyle: Value(buildUpStyle),
      tempo: Value(tempo),
      width: Value(width),
      finalThirdFocus: Value(finalThirdFocus),
      attackingFocus: Value(attackingFocus),
      defensiveLine: Value(defensiveLine),
      lineOfEngagement: Value(lineOfEngagement),
      pressingIntensity: Value(pressingIntensity),
      defensiveWidth: Value(defensiveWidth),
      markingStyle: Value(markingStyle),
      tacklingAggression: Value(tacklingAggression),
      transitionOnWin: Value(transitionOnWin),
      transitionOnLoss: Value(transitionOnLoss),
      teamMentality: Value(teamMentality),
      passingRisk: Value(passingRisk),
      dribblingRisk: Value(dribblingRisk),
      shootingPolicy: Value(shootingPolicy),
      compactness: Value(compactness),
      verticalStretch: Value(verticalStretch),
      overloadFocus: Value(overloadFocus),
      setPieceAttack: Value(setPieceAttack),
      setPieceDefense: Value(setPieceDefense),
      freeKickStrategy: Value(freeKickStrategy),
    );
  }

  factory NationalTeamTacticRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NationalTeamTacticRecord(
      id: serializer.fromJson<int>(json['id']),
      teamId: serializer.fromJson<int?>(json['teamId']),
      presetName: serializer.fromJson<String>(json['presetName']),
      buildUpStyle: serializer.fromJson<String>(json['buildUpStyle']),
      tempo: serializer.fromJson<String>(json['tempo']),
      width: serializer.fromJson<String>(json['width']),
      finalThirdFocus: serializer.fromJson<String>(json['finalThirdFocus']),
      attackingFocus: serializer.fromJson<String>(json['attackingFocus']),
      defensiveLine: serializer.fromJson<String>(json['defensiveLine']),
      lineOfEngagement: serializer.fromJson<String>(json['lineOfEngagement']),
      pressingIntensity: serializer.fromJson<String>(json['pressingIntensity']),
      defensiveWidth: serializer.fromJson<String>(json['defensiveWidth']),
      markingStyle: serializer.fromJson<String>(json['markingStyle']),
      tacklingAggression: serializer.fromJson<String>(
        json['tacklingAggression'],
      ),
      transitionOnWin: serializer.fromJson<String>(json['transitionOnWin']),
      transitionOnLoss: serializer.fromJson<String>(json['transitionOnLoss']),
      teamMentality: serializer.fromJson<String>(json['teamMentality']),
      passingRisk: serializer.fromJson<String>(json['passingRisk']),
      dribblingRisk: serializer.fromJson<String>(json['dribblingRisk']),
      shootingPolicy: serializer.fromJson<String>(json['shootingPolicy']),
      compactness: serializer.fromJson<String>(json['compactness']),
      verticalStretch: serializer.fromJson<String>(json['verticalStretch']),
      overloadFocus: serializer.fromJson<String>(json['overloadFocus']),
      setPieceAttack: serializer.fromJson<String>(json['setPieceAttack']),
      setPieceDefense: serializer.fromJson<String>(json['setPieceDefense']),
      freeKickStrategy: serializer.fromJson<String>(json['freeKickStrategy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamId': serializer.toJson<int?>(teamId),
      'presetName': serializer.toJson<String>(presetName),
      'buildUpStyle': serializer.toJson<String>(buildUpStyle),
      'tempo': serializer.toJson<String>(tempo),
      'width': serializer.toJson<String>(width),
      'finalThirdFocus': serializer.toJson<String>(finalThirdFocus),
      'attackingFocus': serializer.toJson<String>(attackingFocus),
      'defensiveLine': serializer.toJson<String>(defensiveLine),
      'lineOfEngagement': serializer.toJson<String>(lineOfEngagement),
      'pressingIntensity': serializer.toJson<String>(pressingIntensity),
      'defensiveWidth': serializer.toJson<String>(defensiveWidth),
      'markingStyle': serializer.toJson<String>(markingStyle),
      'tacklingAggression': serializer.toJson<String>(tacklingAggression),
      'transitionOnWin': serializer.toJson<String>(transitionOnWin),
      'transitionOnLoss': serializer.toJson<String>(transitionOnLoss),
      'teamMentality': serializer.toJson<String>(teamMentality),
      'passingRisk': serializer.toJson<String>(passingRisk),
      'dribblingRisk': serializer.toJson<String>(dribblingRisk),
      'shootingPolicy': serializer.toJson<String>(shootingPolicy),
      'compactness': serializer.toJson<String>(compactness),
      'verticalStretch': serializer.toJson<String>(verticalStretch),
      'overloadFocus': serializer.toJson<String>(overloadFocus),
      'setPieceAttack': serializer.toJson<String>(setPieceAttack),
      'setPieceDefense': serializer.toJson<String>(setPieceDefense),
      'freeKickStrategy': serializer.toJson<String>(freeKickStrategy),
    };
  }

  NationalTeamTacticRecord copyWith({
    int? id,
    Value<int?> teamId = const Value.absent(),
    String? presetName,
    String? buildUpStyle,
    String? tempo,
    String? width,
    String? finalThirdFocus,
    String? attackingFocus,
    String? defensiveLine,
    String? lineOfEngagement,
    String? pressingIntensity,
    String? defensiveWidth,
    String? markingStyle,
    String? tacklingAggression,
    String? transitionOnWin,
    String? transitionOnLoss,
    String? teamMentality,
    String? passingRisk,
    String? dribblingRisk,
    String? shootingPolicy,
    String? compactness,
    String? verticalStretch,
    String? overloadFocus,
    String? setPieceAttack,
    String? setPieceDefense,
    String? freeKickStrategy,
  }) => NationalTeamTacticRecord(
    id: id ?? this.id,
    teamId: teamId.present ? teamId.value : this.teamId,
    presetName: presetName ?? this.presetName,
    buildUpStyle: buildUpStyle ?? this.buildUpStyle,
    tempo: tempo ?? this.tempo,
    width: width ?? this.width,
    finalThirdFocus: finalThirdFocus ?? this.finalThirdFocus,
    attackingFocus: attackingFocus ?? this.attackingFocus,
    defensiveLine: defensiveLine ?? this.defensiveLine,
    lineOfEngagement: lineOfEngagement ?? this.lineOfEngagement,
    pressingIntensity: pressingIntensity ?? this.pressingIntensity,
    defensiveWidth: defensiveWidth ?? this.defensiveWidth,
    markingStyle: markingStyle ?? this.markingStyle,
    tacklingAggression: tacklingAggression ?? this.tacklingAggression,
    transitionOnWin: transitionOnWin ?? this.transitionOnWin,
    transitionOnLoss: transitionOnLoss ?? this.transitionOnLoss,
    teamMentality: teamMentality ?? this.teamMentality,
    passingRisk: passingRisk ?? this.passingRisk,
    dribblingRisk: dribblingRisk ?? this.dribblingRisk,
    shootingPolicy: shootingPolicy ?? this.shootingPolicy,
    compactness: compactness ?? this.compactness,
    verticalStretch: verticalStretch ?? this.verticalStretch,
    overloadFocus: overloadFocus ?? this.overloadFocus,
    setPieceAttack: setPieceAttack ?? this.setPieceAttack,
    setPieceDefense: setPieceDefense ?? this.setPieceDefense,
    freeKickStrategy: freeKickStrategy ?? this.freeKickStrategy,
  );
  NationalTeamTacticRecord copyWithCompanion(
    NationalTeamTacticsCompanion data,
  ) {
    return NationalTeamTacticRecord(
      id: data.id.present ? data.id.value : this.id,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
      presetName: data.presetName.present
          ? data.presetName.value
          : this.presetName,
      buildUpStyle: data.buildUpStyle.present
          ? data.buildUpStyle.value
          : this.buildUpStyle,
      tempo: data.tempo.present ? data.tempo.value : this.tempo,
      width: data.width.present ? data.width.value : this.width,
      finalThirdFocus: data.finalThirdFocus.present
          ? data.finalThirdFocus.value
          : this.finalThirdFocus,
      attackingFocus: data.attackingFocus.present
          ? data.attackingFocus.value
          : this.attackingFocus,
      defensiveLine: data.defensiveLine.present
          ? data.defensiveLine.value
          : this.defensiveLine,
      lineOfEngagement: data.lineOfEngagement.present
          ? data.lineOfEngagement.value
          : this.lineOfEngagement,
      pressingIntensity: data.pressingIntensity.present
          ? data.pressingIntensity.value
          : this.pressingIntensity,
      defensiveWidth: data.defensiveWidth.present
          ? data.defensiveWidth.value
          : this.defensiveWidth,
      markingStyle: data.markingStyle.present
          ? data.markingStyle.value
          : this.markingStyle,
      tacklingAggression: data.tacklingAggression.present
          ? data.tacklingAggression.value
          : this.tacklingAggression,
      transitionOnWin: data.transitionOnWin.present
          ? data.transitionOnWin.value
          : this.transitionOnWin,
      transitionOnLoss: data.transitionOnLoss.present
          ? data.transitionOnLoss.value
          : this.transitionOnLoss,
      teamMentality: data.teamMentality.present
          ? data.teamMentality.value
          : this.teamMentality,
      passingRisk: data.passingRisk.present
          ? data.passingRisk.value
          : this.passingRisk,
      dribblingRisk: data.dribblingRisk.present
          ? data.dribblingRisk.value
          : this.dribblingRisk,
      shootingPolicy: data.shootingPolicy.present
          ? data.shootingPolicy.value
          : this.shootingPolicy,
      compactness: data.compactness.present
          ? data.compactness.value
          : this.compactness,
      verticalStretch: data.verticalStretch.present
          ? data.verticalStretch.value
          : this.verticalStretch,
      overloadFocus: data.overloadFocus.present
          ? data.overloadFocus.value
          : this.overloadFocus,
      setPieceAttack: data.setPieceAttack.present
          ? data.setPieceAttack.value
          : this.setPieceAttack,
      setPieceDefense: data.setPieceDefense.present
          ? data.setPieceDefense.value
          : this.setPieceDefense,
      freeKickStrategy: data.freeKickStrategy.present
          ? data.freeKickStrategy.value
          : this.freeKickStrategy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NationalTeamTacticRecord(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('presetName: $presetName, ')
          ..write('buildUpStyle: $buildUpStyle, ')
          ..write('tempo: $tempo, ')
          ..write('width: $width, ')
          ..write('finalThirdFocus: $finalThirdFocus, ')
          ..write('attackingFocus: $attackingFocus, ')
          ..write('defensiveLine: $defensiveLine, ')
          ..write('lineOfEngagement: $lineOfEngagement, ')
          ..write('pressingIntensity: $pressingIntensity, ')
          ..write('defensiveWidth: $defensiveWidth, ')
          ..write('markingStyle: $markingStyle, ')
          ..write('tacklingAggression: $tacklingAggression, ')
          ..write('transitionOnWin: $transitionOnWin, ')
          ..write('transitionOnLoss: $transitionOnLoss, ')
          ..write('teamMentality: $teamMentality, ')
          ..write('passingRisk: $passingRisk, ')
          ..write('dribblingRisk: $dribblingRisk, ')
          ..write('shootingPolicy: $shootingPolicy, ')
          ..write('compactness: $compactness, ')
          ..write('verticalStretch: $verticalStretch, ')
          ..write('overloadFocus: $overloadFocus, ')
          ..write('setPieceAttack: $setPieceAttack, ')
          ..write('setPieceDefense: $setPieceDefense, ')
          ..write('freeKickStrategy: $freeKickStrategy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    teamId,
    presetName,
    buildUpStyle,
    tempo,
    width,
    finalThirdFocus,
    attackingFocus,
    defensiveLine,
    lineOfEngagement,
    pressingIntensity,
    defensiveWidth,
    markingStyle,
    tacklingAggression,
    transitionOnWin,
    transitionOnLoss,
    teamMentality,
    passingRisk,
    dribblingRisk,
    shootingPolicy,
    compactness,
    verticalStretch,
    overloadFocus,
    setPieceAttack,
    setPieceDefense,
    freeKickStrategy,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NationalTeamTacticRecord &&
          other.id == this.id &&
          other.teamId == this.teamId &&
          other.presetName == this.presetName &&
          other.buildUpStyle == this.buildUpStyle &&
          other.tempo == this.tempo &&
          other.width == this.width &&
          other.finalThirdFocus == this.finalThirdFocus &&
          other.attackingFocus == this.attackingFocus &&
          other.defensiveLine == this.defensiveLine &&
          other.lineOfEngagement == this.lineOfEngagement &&
          other.pressingIntensity == this.pressingIntensity &&
          other.defensiveWidth == this.defensiveWidth &&
          other.markingStyle == this.markingStyle &&
          other.tacklingAggression == this.tacklingAggression &&
          other.transitionOnWin == this.transitionOnWin &&
          other.transitionOnLoss == this.transitionOnLoss &&
          other.teamMentality == this.teamMentality &&
          other.passingRisk == this.passingRisk &&
          other.dribblingRisk == this.dribblingRisk &&
          other.shootingPolicy == this.shootingPolicy &&
          other.compactness == this.compactness &&
          other.verticalStretch == this.verticalStretch &&
          other.overloadFocus == this.overloadFocus &&
          other.setPieceAttack == this.setPieceAttack &&
          other.setPieceDefense == this.setPieceDefense &&
          other.freeKickStrategy == this.freeKickStrategy);
}

class NationalTeamTacticsCompanion
    extends UpdateCompanion<NationalTeamTacticRecord> {
  final Value<int> id;
  final Value<int?> teamId;
  final Value<String> presetName;
  final Value<String> buildUpStyle;
  final Value<String> tempo;
  final Value<String> width;
  final Value<String> finalThirdFocus;
  final Value<String> attackingFocus;
  final Value<String> defensiveLine;
  final Value<String> lineOfEngagement;
  final Value<String> pressingIntensity;
  final Value<String> defensiveWidth;
  final Value<String> markingStyle;
  final Value<String> tacklingAggression;
  final Value<String> transitionOnWin;
  final Value<String> transitionOnLoss;
  final Value<String> teamMentality;
  final Value<String> passingRisk;
  final Value<String> dribblingRisk;
  final Value<String> shootingPolicy;
  final Value<String> compactness;
  final Value<String> verticalStretch;
  final Value<String> overloadFocus;
  final Value<String> setPieceAttack;
  final Value<String> setPieceDefense;
  final Value<String> freeKickStrategy;
  const NationalTeamTacticsCompanion({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    this.presetName = const Value.absent(),
    this.buildUpStyle = const Value.absent(),
    this.tempo = const Value.absent(),
    this.width = const Value.absent(),
    this.finalThirdFocus = const Value.absent(),
    this.attackingFocus = const Value.absent(),
    this.defensiveLine = const Value.absent(),
    this.lineOfEngagement = const Value.absent(),
    this.pressingIntensity = const Value.absent(),
    this.defensiveWidth = const Value.absent(),
    this.markingStyle = const Value.absent(),
    this.tacklingAggression = const Value.absent(),
    this.transitionOnWin = const Value.absent(),
    this.transitionOnLoss = const Value.absent(),
    this.teamMentality = const Value.absent(),
    this.passingRisk = const Value.absent(),
    this.dribblingRisk = const Value.absent(),
    this.shootingPolicy = const Value.absent(),
    this.compactness = const Value.absent(),
    this.verticalStretch = const Value.absent(),
    this.overloadFocus = const Value.absent(),
    this.setPieceAttack = const Value.absent(),
    this.setPieceDefense = const Value.absent(),
    this.freeKickStrategy = const Value.absent(),
  });
  NationalTeamTacticsCompanion.insert({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    required String presetName,
    required String buildUpStyle,
    required String tempo,
    required String width,
    required String finalThirdFocus,
    required String attackingFocus,
    required String defensiveLine,
    required String lineOfEngagement,
    required String pressingIntensity,
    required String defensiveWidth,
    required String markingStyle,
    required String tacklingAggression,
    required String transitionOnWin,
    required String transitionOnLoss,
    required String teamMentality,
    required String passingRisk,
    required String dribblingRisk,
    required String shootingPolicy,
    required String compactness,
    required String verticalStretch,
    required String overloadFocus,
    required String setPieceAttack,
    required String setPieceDefense,
    required String freeKickStrategy,
  }) : presetName = Value(presetName),
       buildUpStyle = Value(buildUpStyle),
       tempo = Value(tempo),
       width = Value(width),
       finalThirdFocus = Value(finalThirdFocus),
       attackingFocus = Value(attackingFocus),
       defensiveLine = Value(defensiveLine),
       lineOfEngagement = Value(lineOfEngagement),
       pressingIntensity = Value(pressingIntensity),
       defensiveWidth = Value(defensiveWidth),
       markingStyle = Value(markingStyle),
       tacklingAggression = Value(tacklingAggression),
       transitionOnWin = Value(transitionOnWin),
       transitionOnLoss = Value(transitionOnLoss),
       teamMentality = Value(teamMentality),
       passingRisk = Value(passingRisk),
       dribblingRisk = Value(dribblingRisk),
       shootingPolicy = Value(shootingPolicy),
       compactness = Value(compactness),
       verticalStretch = Value(verticalStretch),
       overloadFocus = Value(overloadFocus),
       setPieceAttack = Value(setPieceAttack),
       setPieceDefense = Value(setPieceDefense),
       freeKickStrategy = Value(freeKickStrategy);
  static Insertable<NationalTeamTacticRecord> custom({
    Expression<int>? id,
    Expression<int>? teamId,
    Expression<String>? presetName,
    Expression<String>? buildUpStyle,
    Expression<String>? tempo,
    Expression<String>? width,
    Expression<String>? finalThirdFocus,
    Expression<String>? attackingFocus,
    Expression<String>? defensiveLine,
    Expression<String>? lineOfEngagement,
    Expression<String>? pressingIntensity,
    Expression<String>? defensiveWidth,
    Expression<String>? markingStyle,
    Expression<String>? tacklingAggression,
    Expression<String>? transitionOnWin,
    Expression<String>? transitionOnLoss,
    Expression<String>? teamMentality,
    Expression<String>? passingRisk,
    Expression<String>? dribblingRisk,
    Expression<String>? shootingPolicy,
    Expression<String>? compactness,
    Expression<String>? verticalStretch,
    Expression<String>? overloadFocus,
    Expression<String>? setPieceAttack,
    Expression<String>? setPieceDefense,
    Expression<String>? freeKickStrategy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamId != null) 'team_id': teamId,
      if (presetName != null) 'preset_name': presetName,
      if (buildUpStyle != null) 'build_up_style': buildUpStyle,
      if (tempo != null) 'tempo': tempo,
      if (width != null) 'width': width,
      if (finalThirdFocus != null) 'final_third_focus': finalThirdFocus,
      if (attackingFocus != null) 'attacking_focus': attackingFocus,
      if (defensiveLine != null) 'defensive_line': defensiveLine,
      if (lineOfEngagement != null) 'line_of_engagement': lineOfEngagement,
      if (pressingIntensity != null) 'pressing_intensity': pressingIntensity,
      if (defensiveWidth != null) 'defensive_width': defensiveWidth,
      if (markingStyle != null) 'marking_style': markingStyle,
      if (tacklingAggression != null) 'tackling_aggression': tacklingAggression,
      if (transitionOnWin != null) 'transition_on_win': transitionOnWin,
      if (transitionOnLoss != null) 'transition_on_loss': transitionOnLoss,
      if (teamMentality != null) 'team_mentality': teamMentality,
      if (passingRisk != null) 'passing_risk': passingRisk,
      if (dribblingRisk != null) 'dribbling_risk': dribblingRisk,
      if (shootingPolicy != null) 'shooting_policy': shootingPolicy,
      if (compactness != null) 'compactness': compactness,
      if (verticalStretch != null) 'vertical_stretch': verticalStretch,
      if (overloadFocus != null) 'overload_focus': overloadFocus,
      if (setPieceAttack != null) 'set_piece_attack': setPieceAttack,
      if (setPieceDefense != null) 'set_piece_defense': setPieceDefense,
      if (freeKickStrategy != null) 'free_kick_strategy': freeKickStrategy,
    });
  }

  NationalTeamTacticsCompanion copyWith({
    Value<int>? id,
    Value<int?>? teamId,
    Value<String>? presetName,
    Value<String>? buildUpStyle,
    Value<String>? tempo,
    Value<String>? width,
    Value<String>? finalThirdFocus,
    Value<String>? attackingFocus,
    Value<String>? defensiveLine,
    Value<String>? lineOfEngagement,
    Value<String>? pressingIntensity,
    Value<String>? defensiveWidth,
    Value<String>? markingStyle,
    Value<String>? tacklingAggression,
    Value<String>? transitionOnWin,
    Value<String>? transitionOnLoss,
    Value<String>? teamMentality,
    Value<String>? passingRisk,
    Value<String>? dribblingRisk,
    Value<String>? shootingPolicy,
    Value<String>? compactness,
    Value<String>? verticalStretch,
    Value<String>? overloadFocus,
    Value<String>? setPieceAttack,
    Value<String>? setPieceDefense,
    Value<String>? freeKickStrategy,
  }) {
    return NationalTeamTacticsCompanion(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      presetName: presetName ?? this.presetName,
      buildUpStyle: buildUpStyle ?? this.buildUpStyle,
      tempo: tempo ?? this.tempo,
      width: width ?? this.width,
      finalThirdFocus: finalThirdFocus ?? this.finalThirdFocus,
      attackingFocus: attackingFocus ?? this.attackingFocus,
      defensiveLine: defensiveLine ?? this.defensiveLine,
      lineOfEngagement: lineOfEngagement ?? this.lineOfEngagement,
      pressingIntensity: pressingIntensity ?? this.pressingIntensity,
      defensiveWidth: defensiveWidth ?? this.defensiveWidth,
      markingStyle: markingStyle ?? this.markingStyle,
      tacklingAggression: tacklingAggression ?? this.tacklingAggression,
      transitionOnWin: transitionOnWin ?? this.transitionOnWin,
      transitionOnLoss: transitionOnLoss ?? this.transitionOnLoss,
      teamMentality: teamMentality ?? this.teamMentality,
      passingRisk: passingRisk ?? this.passingRisk,
      dribblingRisk: dribblingRisk ?? this.dribblingRisk,
      shootingPolicy: shootingPolicy ?? this.shootingPolicy,
      compactness: compactness ?? this.compactness,
      verticalStretch: verticalStretch ?? this.verticalStretch,
      overloadFocus: overloadFocus ?? this.overloadFocus,
      setPieceAttack: setPieceAttack ?? this.setPieceAttack,
      setPieceDefense: setPieceDefense ?? this.setPieceDefense,
      freeKickStrategy: freeKickStrategy ?? this.freeKickStrategy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (presetName.present) {
      map['preset_name'] = Variable<String>(presetName.value);
    }
    if (buildUpStyle.present) {
      map['build_up_style'] = Variable<String>(buildUpStyle.value);
    }
    if (tempo.present) {
      map['tempo'] = Variable<String>(tempo.value);
    }
    if (width.present) {
      map['width'] = Variable<String>(width.value);
    }
    if (finalThirdFocus.present) {
      map['final_third_focus'] = Variable<String>(finalThirdFocus.value);
    }
    if (attackingFocus.present) {
      map['attacking_focus'] = Variable<String>(attackingFocus.value);
    }
    if (defensiveLine.present) {
      map['defensive_line'] = Variable<String>(defensiveLine.value);
    }
    if (lineOfEngagement.present) {
      map['line_of_engagement'] = Variable<String>(lineOfEngagement.value);
    }
    if (pressingIntensity.present) {
      map['pressing_intensity'] = Variable<String>(pressingIntensity.value);
    }
    if (defensiveWidth.present) {
      map['defensive_width'] = Variable<String>(defensiveWidth.value);
    }
    if (markingStyle.present) {
      map['marking_style'] = Variable<String>(markingStyle.value);
    }
    if (tacklingAggression.present) {
      map['tackling_aggression'] = Variable<String>(tacklingAggression.value);
    }
    if (transitionOnWin.present) {
      map['transition_on_win'] = Variable<String>(transitionOnWin.value);
    }
    if (transitionOnLoss.present) {
      map['transition_on_loss'] = Variable<String>(transitionOnLoss.value);
    }
    if (teamMentality.present) {
      map['team_mentality'] = Variable<String>(teamMentality.value);
    }
    if (passingRisk.present) {
      map['passing_risk'] = Variable<String>(passingRisk.value);
    }
    if (dribblingRisk.present) {
      map['dribbling_risk'] = Variable<String>(dribblingRisk.value);
    }
    if (shootingPolicy.present) {
      map['shooting_policy'] = Variable<String>(shootingPolicy.value);
    }
    if (compactness.present) {
      map['compactness'] = Variable<String>(compactness.value);
    }
    if (verticalStretch.present) {
      map['vertical_stretch'] = Variable<String>(verticalStretch.value);
    }
    if (overloadFocus.present) {
      map['overload_focus'] = Variable<String>(overloadFocus.value);
    }
    if (setPieceAttack.present) {
      map['set_piece_attack'] = Variable<String>(setPieceAttack.value);
    }
    if (setPieceDefense.present) {
      map['set_piece_defense'] = Variable<String>(setPieceDefense.value);
    }
    if (freeKickStrategy.present) {
      map['free_kick_strategy'] = Variable<String>(freeKickStrategy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NationalTeamTacticsCompanion(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('presetName: $presetName, ')
          ..write('buildUpStyle: $buildUpStyle, ')
          ..write('tempo: $tempo, ')
          ..write('width: $width, ')
          ..write('finalThirdFocus: $finalThirdFocus, ')
          ..write('attackingFocus: $attackingFocus, ')
          ..write('defensiveLine: $defensiveLine, ')
          ..write('lineOfEngagement: $lineOfEngagement, ')
          ..write('pressingIntensity: $pressingIntensity, ')
          ..write('defensiveWidth: $defensiveWidth, ')
          ..write('markingStyle: $markingStyle, ')
          ..write('tacklingAggression: $tacklingAggression, ')
          ..write('transitionOnWin: $transitionOnWin, ')
          ..write('transitionOnLoss: $transitionOnLoss, ')
          ..write('teamMentality: $teamMentality, ')
          ..write('passingRisk: $passingRisk, ')
          ..write('dribblingRisk: $dribblingRisk, ')
          ..write('shootingPolicy: $shootingPolicy, ')
          ..write('compactness: $compactness, ')
          ..write('verticalStretch: $verticalStretch, ')
          ..write('overloadFocus: $overloadFocus, ')
          ..write('setPieceAttack: $setPieceAttack, ')
          ..write('setPieceDefense: $setPieceDefense, ')
          ..write('freeKickStrategy: $freeKickStrategy')
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
  late final $NationalTeamTacticsTable nationalTeamTactics =
      $NationalTeamTacticsTable(this);
  late final CountryDao countryDao = CountryDao(this as AppDatabase);
  late final PlayerDao playerDao = PlayerDao(this as AppDatabase);
  late final NationalTeamDao nationalTeamDao = NationalTeamDao(
    this as AppDatabase,
  );
  late final NationalTeamTacticDao nationalTeamTacticDao =
      NationalTeamTacticDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    continents,
    countries,
    players,
    nationalTeams,
    nationalTeamTactics,
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
                Value<String> primaryColor = const Value.absent(),
                Value<String> secondaryColor = const Value.absent(),
                Value<String> tertiaryColor = const Value.absent(),
              }) => NationalTeamsCompanion(
                id: id,
                countryId: countryId,
                name: name,
                lineup: lineup,
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
                required String primaryColor,
                required String secondaryColor,
                required String tertiaryColor,
              }) => NationalTeamsCompanion.insert(
                id: id,
                countryId: countryId,
                name: name,
                lineup: lineup,
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
typedef $$NationalTeamTacticsTableCreateCompanionBuilder =
    NationalTeamTacticsCompanion Function({
      Value<int> id,
      Value<int?> teamId,
      required String presetName,
      required String buildUpStyle,
      required String tempo,
      required String width,
      required String finalThirdFocus,
      required String attackingFocus,
      required String defensiveLine,
      required String lineOfEngagement,
      required String pressingIntensity,
      required String defensiveWidth,
      required String markingStyle,
      required String tacklingAggression,
      required String transitionOnWin,
      required String transitionOnLoss,
      required String teamMentality,
      required String passingRisk,
      required String dribblingRisk,
      required String shootingPolicy,
      required String compactness,
      required String verticalStretch,
      required String overloadFocus,
      required String setPieceAttack,
      required String setPieceDefense,
      required String freeKickStrategy,
    });
typedef $$NationalTeamTacticsTableUpdateCompanionBuilder =
    NationalTeamTacticsCompanion Function({
      Value<int> id,
      Value<int?> teamId,
      Value<String> presetName,
      Value<String> buildUpStyle,
      Value<String> tempo,
      Value<String> width,
      Value<String> finalThirdFocus,
      Value<String> attackingFocus,
      Value<String> defensiveLine,
      Value<String> lineOfEngagement,
      Value<String> pressingIntensity,
      Value<String> defensiveWidth,
      Value<String> markingStyle,
      Value<String> tacklingAggression,
      Value<String> transitionOnWin,
      Value<String> transitionOnLoss,
      Value<String> teamMentality,
      Value<String> passingRisk,
      Value<String> dribblingRisk,
      Value<String> shootingPolicy,
      Value<String> compactness,
      Value<String> verticalStretch,
      Value<String> overloadFocus,
      Value<String> setPieceAttack,
      Value<String> setPieceDefense,
      Value<String> freeKickStrategy,
    });

class $$NationalTeamTacticsTableFilterComposer
    extends Composer<_$AppDatabase, $NationalTeamTacticsTable> {
  $$NationalTeamTacticsTableFilterComposer({
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

  ColumnFilters<int> get teamId => $composableBuilder(
    column: $table.teamId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get presetName => $composableBuilder(
    column: $table.presetName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buildUpStyle => $composableBuilder(
    column: $table.buildUpStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tempo => $composableBuilder(
    column: $table.tempo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get finalThirdFocus => $composableBuilder(
    column: $table.finalThirdFocus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attackingFocus => $composableBuilder(
    column: $table.attackingFocus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defensiveLine => $composableBuilder(
    column: $table.defensiveLine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineOfEngagement => $composableBuilder(
    column: $table.lineOfEngagement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pressingIntensity => $composableBuilder(
    column: $table.pressingIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defensiveWidth => $composableBuilder(
    column: $table.defensiveWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get markingStyle => $composableBuilder(
    column: $table.markingStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tacklingAggression => $composableBuilder(
    column: $table.tacklingAggression,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transitionOnWin => $composableBuilder(
    column: $table.transitionOnWin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transitionOnLoss => $composableBuilder(
    column: $table.transitionOnLoss,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teamMentality => $composableBuilder(
    column: $table.teamMentality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passingRisk => $composableBuilder(
    column: $table.passingRisk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dribblingRisk => $composableBuilder(
    column: $table.dribblingRisk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shootingPolicy => $composableBuilder(
    column: $table.shootingPolicy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get compactness => $composableBuilder(
    column: $table.compactness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verticalStretch => $composableBuilder(
    column: $table.verticalStretch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overloadFocus => $composableBuilder(
    column: $table.overloadFocus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setPieceAttack => $composableBuilder(
    column: $table.setPieceAttack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setPieceDefense => $composableBuilder(
    column: $table.setPieceDefense,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get freeKickStrategy => $composableBuilder(
    column: $table.freeKickStrategy,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NationalTeamTacticsTableOrderingComposer
    extends Composer<_$AppDatabase, $NationalTeamTacticsTable> {
  $$NationalTeamTacticsTableOrderingComposer({
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

  ColumnOrderings<int> get teamId => $composableBuilder(
    column: $table.teamId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get presetName => $composableBuilder(
    column: $table.presetName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buildUpStyle => $composableBuilder(
    column: $table.buildUpStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tempo => $composableBuilder(
    column: $table.tempo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get finalThirdFocus => $composableBuilder(
    column: $table.finalThirdFocus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attackingFocus => $composableBuilder(
    column: $table.attackingFocus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defensiveLine => $composableBuilder(
    column: $table.defensiveLine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineOfEngagement => $composableBuilder(
    column: $table.lineOfEngagement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pressingIntensity => $composableBuilder(
    column: $table.pressingIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defensiveWidth => $composableBuilder(
    column: $table.defensiveWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get markingStyle => $composableBuilder(
    column: $table.markingStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tacklingAggression => $composableBuilder(
    column: $table.tacklingAggression,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transitionOnWin => $composableBuilder(
    column: $table.transitionOnWin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transitionOnLoss => $composableBuilder(
    column: $table.transitionOnLoss,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teamMentality => $composableBuilder(
    column: $table.teamMentality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passingRisk => $composableBuilder(
    column: $table.passingRisk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dribblingRisk => $composableBuilder(
    column: $table.dribblingRisk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shootingPolicy => $composableBuilder(
    column: $table.shootingPolicy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get compactness => $composableBuilder(
    column: $table.compactness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verticalStretch => $composableBuilder(
    column: $table.verticalStretch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overloadFocus => $composableBuilder(
    column: $table.overloadFocus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setPieceAttack => $composableBuilder(
    column: $table.setPieceAttack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setPieceDefense => $composableBuilder(
    column: $table.setPieceDefense,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get freeKickStrategy => $composableBuilder(
    column: $table.freeKickStrategy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NationalTeamTacticsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NationalTeamTacticsTable> {
  $$NationalTeamTacticsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get teamId =>
      $composableBuilder(column: $table.teamId, builder: (column) => column);

  GeneratedColumn<String> get presetName => $composableBuilder(
    column: $table.presetName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get buildUpStyle => $composableBuilder(
    column: $table.buildUpStyle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tempo =>
      $composableBuilder(column: $table.tempo, builder: (column) => column);

  GeneratedColumn<String> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<String> get finalThirdFocus => $composableBuilder(
    column: $table.finalThirdFocus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attackingFocus => $composableBuilder(
    column: $table.attackingFocus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defensiveLine => $composableBuilder(
    column: $table.defensiveLine,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lineOfEngagement => $composableBuilder(
    column: $table.lineOfEngagement,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pressingIntensity => $composableBuilder(
    column: $table.pressingIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defensiveWidth => $composableBuilder(
    column: $table.defensiveWidth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get markingStyle => $composableBuilder(
    column: $table.markingStyle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tacklingAggression => $composableBuilder(
    column: $table.tacklingAggression,
    builder: (column) => column,
  );

  GeneratedColumn<String> get transitionOnWin => $composableBuilder(
    column: $table.transitionOnWin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get transitionOnLoss => $composableBuilder(
    column: $table.transitionOnLoss,
    builder: (column) => column,
  );

  GeneratedColumn<String> get teamMentality => $composableBuilder(
    column: $table.teamMentality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get passingRisk => $composableBuilder(
    column: $table.passingRisk,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dribblingRisk => $composableBuilder(
    column: $table.dribblingRisk,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shootingPolicy => $composableBuilder(
    column: $table.shootingPolicy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get compactness => $composableBuilder(
    column: $table.compactness,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verticalStretch => $composableBuilder(
    column: $table.verticalStretch,
    builder: (column) => column,
  );

  GeneratedColumn<String> get overloadFocus => $composableBuilder(
    column: $table.overloadFocus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get setPieceAttack => $composableBuilder(
    column: $table.setPieceAttack,
    builder: (column) => column,
  );

  GeneratedColumn<String> get setPieceDefense => $composableBuilder(
    column: $table.setPieceDefense,
    builder: (column) => column,
  );

  GeneratedColumn<String> get freeKickStrategy => $composableBuilder(
    column: $table.freeKickStrategy,
    builder: (column) => column,
  );
}

class $$NationalTeamTacticsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NationalTeamTacticsTable,
          NationalTeamTacticRecord,
          $$NationalTeamTacticsTableFilterComposer,
          $$NationalTeamTacticsTableOrderingComposer,
          $$NationalTeamTacticsTableAnnotationComposer,
          $$NationalTeamTacticsTableCreateCompanionBuilder,
          $$NationalTeamTacticsTableUpdateCompanionBuilder,
          (
            NationalTeamTacticRecord,
            BaseReferences<
              _$AppDatabase,
              $NationalTeamTacticsTable,
              NationalTeamTacticRecord
            >,
          ),
          NationalTeamTacticRecord,
          PrefetchHooks Function()
        > {
  $$NationalTeamTacticsTableTableManager(
    _$AppDatabase db,
    $NationalTeamTacticsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NationalTeamTacticsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NationalTeamTacticsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NationalTeamTacticsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> teamId = const Value.absent(),
                Value<String> presetName = const Value.absent(),
                Value<String> buildUpStyle = const Value.absent(),
                Value<String> tempo = const Value.absent(),
                Value<String> width = const Value.absent(),
                Value<String> finalThirdFocus = const Value.absent(),
                Value<String> attackingFocus = const Value.absent(),
                Value<String> defensiveLine = const Value.absent(),
                Value<String> lineOfEngagement = const Value.absent(),
                Value<String> pressingIntensity = const Value.absent(),
                Value<String> defensiveWidth = const Value.absent(),
                Value<String> markingStyle = const Value.absent(),
                Value<String> tacklingAggression = const Value.absent(),
                Value<String> transitionOnWin = const Value.absent(),
                Value<String> transitionOnLoss = const Value.absent(),
                Value<String> teamMentality = const Value.absent(),
                Value<String> passingRisk = const Value.absent(),
                Value<String> dribblingRisk = const Value.absent(),
                Value<String> shootingPolicy = const Value.absent(),
                Value<String> compactness = const Value.absent(),
                Value<String> verticalStretch = const Value.absent(),
                Value<String> overloadFocus = const Value.absent(),
                Value<String> setPieceAttack = const Value.absent(),
                Value<String> setPieceDefense = const Value.absent(),
                Value<String> freeKickStrategy = const Value.absent(),
              }) => NationalTeamTacticsCompanion(
                id: id,
                teamId: teamId,
                presetName: presetName,
                buildUpStyle: buildUpStyle,
                tempo: tempo,
                width: width,
                finalThirdFocus: finalThirdFocus,
                attackingFocus: attackingFocus,
                defensiveLine: defensiveLine,
                lineOfEngagement: lineOfEngagement,
                pressingIntensity: pressingIntensity,
                defensiveWidth: defensiveWidth,
                markingStyle: markingStyle,
                tacklingAggression: tacklingAggression,
                transitionOnWin: transitionOnWin,
                transitionOnLoss: transitionOnLoss,
                teamMentality: teamMentality,
                passingRisk: passingRisk,
                dribblingRisk: dribblingRisk,
                shootingPolicy: shootingPolicy,
                compactness: compactness,
                verticalStretch: verticalStretch,
                overloadFocus: overloadFocus,
                setPieceAttack: setPieceAttack,
                setPieceDefense: setPieceDefense,
                freeKickStrategy: freeKickStrategy,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> teamId = const Value.absent(),
                required String presetName,
                required String buildUpStyle,
                required String tempo,
                required String width,
                required String finalThirdFocus,
                required String attackingFocus,
                required String defensiveLine,
                required String lineOfEngagement,
                required String pressingIntensity,
                required String defensiveWidth,
                required String markingStyle,
                required String tacklingAggression,
                required String transitionOnWin,
                required String transitionOnLoss,
                required String teamMentality,
                required String passingRisk,
                required String dribblingRisk,
                required String shootingPolicy,
                required String compactness,
                required String verticalStretch,
                required String overloadFocus,
                required String setPieceAttack,
                required String setPieceDefense,
                required String freeKickStrategy,
              }) => NationalTeamTacticsCompanion.insert(
                id: id,
                teamId: teamId,
                presetName: presetName,
                buildUpStyle: buildUpStyle,
                tempo: tempo,
                width: width,
                finalThirdFocus: finalThirdFocus,
                attackingFocus: attackingFocus,
                defensiveLine: defensiveLine,
                lineOfEngagement: lineOfEngagement,
                pressingIntensity: pressingIntensity,
                defensiveWidth: defensiveWidth,
                markingStyle: markingStyle,
                tacklingAggression: tacklingAggression,
                transitionOnWin: transitionOnWin,
                transitionOnLoss: transitionOnLoss,
                teamMentality: teamMentality,
                passingRisk: passingRisk,
                dribblingRisk: dribblingRisk,
                shootingPolicy: shootingPolicy,
                compactness: compactness,
                verticalStretch: verticalStretch,
                overloadFocus: overloadFocus,
                setPieceAttack: setPieceAttack,
                setPieceDefense: setPieceDefense,
                freeKickStrategy: freeKickStrategy,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NationalTeamTacticsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NationalTeamTacticsTable,
      NationalTeamTacticRecord,
      $$NationalTeamTacticsTableFilterComposer,
      $$NationalTeamTacticsTableOrderingComposer,
      $$NationalTeamTacticsTableAnnotationComposer,
      $$NationalTeamTacticsTableCreateCompanionBuilder,
      $$NationalTeamTacticsTableUpdateCompanionBuilder,
      (
        NationalTeamTacticRecord,
        BaseReferences<
          _$AppDatabase,
          $NationalTeamTacticsTable,
          NationalTeamTacticRecord
        >,
      ),
      NationalTeamTacticRecord,
      PrefetchHooks Function()
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
  $$NationalTeamTacticsTableTableManager get nationalTeamTactics =>
      $$NationalTeamTacticsTableTableManager(_db, _db.nationalTeamTactics);
}
