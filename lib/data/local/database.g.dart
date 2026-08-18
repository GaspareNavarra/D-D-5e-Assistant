// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClassesTable extends Classes with TableInfo<$ClassesTable, ClassRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClassesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(DataSource.official),
  );
  static const VerificationMeta _hitDieMeta = const VerificationMeta('hitDie');
  @override
  late final GeneratedColumn<int> hitDie = GeneratedColumn<int>(
    'hit_die',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    source,
    hitDie,
    description,
    dataJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'classes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClassRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('hit_die')) {
      context.handle(
        _hitDieMeta,
        hitDie.isAcceptableOrUnknown(data['hit_die']!, _hitDieMeta),
      );
    } else if (isInserting) {
      context.missing(_hitDieMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClassRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClassRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      hitDie: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hit_die'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ClassesTable createAlias(String alias) {
    return $ClassesTable(attachedDatabase, alias);
  }
}

class ClassRow extends DataClass implements Insertable<ClassRow> {
  final String id;
  final String name;

  /// 'official' | 'homebrew' | 'custom' — see [DataSource].
  final String source;
  final int hitDie;
  final String? description;

  /// Freeform JSON payload for SRD attributes not yet modeled as columns
  /// (spellcasting progression, class features, subclasses, ...). Keeps the
  /// schema stable while the SRD-import feature is still being designed.
  final String? dataJson;
  final DateTime createdAt;
  const ClassRow({
    required this.id,
    required this.name,
    required this.source,
    required this.hitDie,
    this.description,
    this.dataJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source'] = Variable<String>(source);
    map['hit_die'] = Variable<int>(hitDie);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dataJson != null) {
      map['data_json'] = Variable<String>(dataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ClassesCompanion toCompanion(bool nullToAbsent) {
    return ClassesCompanion(
      id: Value(id),
      name: Value(name),
      source: Value(source),
      hitDie: Value(hitDie),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dataJson: dataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dataJson),
      createdAt: Value(createdAt),
    );
  }

  factory ClassRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClassRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      source: serializer.fromJson<String>(json['source']),
      hitDie: serializer.fromJson<int>(json['hitDie']),
      description: serializer.fromJson<String?>(json['description']),
      dataJson: serializer.fromJson<String?>(json['dataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'source': serializer.toJson<String>(source),
      'hitDie': serializer.toJson<int>(hitDie),
      'description': serializer.toJson<String?>(description),
      'dataJson': serializer.toJson<String?>(dataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ClassRow copyWith({
    String? id,
    String? name,
    String? source,
    int? hitDie,
    Value<String?> description = const Value.absent(),
    Value<String?> dataJson = const Value.absent(),
    DateTime? createdAt,
  }) => ClassRow(
    id: id ?? this.id,
    name: name ?? this.name,
    source: source ?? this.source,
    hitDie: hitDie ?? this.hitDie,
    description: description.present ? description.value : this.description,
    dataJson: dataJson.present ? dataJson.value : this.dataJson,
    createdAt: createdAt ?? this.createdAt,
  );
  ClassRow copyWithCompanion(ClassesCompanion data) {
    return ClassRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      source: data.source.present ? data.source.value : this.source,
      hitDie: data.hitDie.present ? data.hitDie.value : this.hitDie,
      description: data.description.present
          ? data.description.value
          : this.description,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClassRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('hitDie: $hitDie, ')
          ..write('description: $description, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, source, hitDie, description, dataJson, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClassRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.source == this.source &&
          other.hitDie == this.hitDie &&
          other.description == this.description &&
          other.dataJson == this.dataJson &&
          other.createdAt == this.createdAt);
}

class ClassesCompanion extends UpdateCompanion<ClassRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> source;
  final Value<int> hitDie;
  final Value<String?> description;
  final Value<String?> dataJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ClassesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.source = const Value.absent(),
    this.hitDie = const Value.absent(),
    this.description = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClassesCompanion.insert({
    required String id,
    required String name,
    this.source = const Value.absent(),
    required int hitDie,
    this.description = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       hitDie = Value(hitDie);
  static Insertable<ClassRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? source,
    Expression<int>? hitDie,
    Expression<String>? description,
    Expression<String>? dataJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (hitDie != null) 'hit_die': hitDie,
      if (description != null) 'description': description,
      if (dataJson != null) 'data_json': dataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClassesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? source,
    Value<int>? hitDie,
    Value<String?>? description,
    Value<String?>? dataJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ClassesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      source: source ?? this.source,
      hitDie: hitDie ?? this.hitDie,
      description: description ?? this.description,
      dataJson: dataJson ?? this.dataJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (hitDie.present) {
      map['hit_die'] = Variable<int>(hitDie.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClassesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('hitDie: $hitDie, ')
          ..write('description: $description, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RacesTable extends Races with TableInfo<$RacesTable, RaceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(DataSource.official),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    source,
    description,
    dataJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'races';
  @override
  VerificationContext validateIntegrity(
    Insertable<RaceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RaceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RaceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RacesTable createAlias(String alias) {
    return $RacesTable(attachedDatabase, alias);
  }
}

class RaceRow extends DataClass implements Insertable<RaceRow> {
  final String id;
  final String name;
  final String source;
  final String? description;
  final String? dataJson;
  final DateTime createdAt;
  const RaceRow({
    required this.id,
    required this.name,
    required this.source,
    this.description,
    this.dataJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dataJson != null) {
      map['data_json'] = Variable<String>(dataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RacesCompanion toCompanion(bool nullToAbsent) {
    return RacesCompanion(
      id: Value(id),
      name: Value(name),
      source: Value(source),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dataJson: dataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dataJson),
      createdAt: Value(createdAt),
    );
  }

  factory RaceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RaceRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      source: serializer.fromJson<String>(json['source']),
      description: serializer.fromJson<String?>(json['description']),
      dataJson: serializer.fromJson<String?>(json['dataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'source': serializer.toJson<String>(source),
      'description': serializer.toJson<String?>(description),
      'dataJson': serializer.toJson<String?>(dataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RaceRow copyWith({
    String? id,
    String? name,
    String? source,
    Value<String?> description = const Value.absent(),
    Value<String?> dataJson = const Value.absent(),
    DateTime? createdAt,
  }) => RaceRow(
    id: id ?? this.id,
    name: name ?? this.name,
    source: source ?? this.source,
    description: description.present ? description.value : this.description,
    dataJson: dataJson.present ? dataJson.value : this.dataJson,
    createdAt: createdAt ?? this.createdAt,
  );
  RaceRow copyWithCompanion(RacesCompanion data) {
    return RaceRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      source: data.source.present ? data.source.value : this.source,
      description: data.description.present
          ? data.description.value
          : this.description,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RaceRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('description: $description, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, source, description, dataJson, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RaceRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.source == this.source &&
          other.description == this.description &&
          other.dataJson == this.dataJson &&
          other.createdAt == this.createdAt);
}

class RacesCompanion extends UpdateCompanion<RaceRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> source;
  final Value<String?> description;
  final Value<String?> dataJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.source = const Value.absent(),
    this.description = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RacesCompanion.insert({
    required String id,
    required String name,
    this.source = const Value.absent(),
    this.description = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<RaceRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? source,
    Expression<String>? description,
    Expression<String>? dataJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (description != null) 'description': description,
      if (dataJson != null) 'data_json': dataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RacesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? source,
    Value<String?>? description,
    Value<String?>? dataJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      source: source ?? this.source,
      description: description ?? this.description,
      dataJson: dataJson ?? this.dataJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('description: $description, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpellsTable extends Spells with TableInfo<$SpellsTable, SpellRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpellsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(DataSource.official),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolMeta = const VerificationMeta('school');
  @override
  late final GeneratedColumn<String> school = GeneratedColumn<String>(
    'school',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _castingTimeMeta = const VerificationMeta(
    'castingTime',
  );
  @override
  late final GeneratedColumn<String> castingTime = GeneratedColumn<String>(
    'casting_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rangeMeta = const VerificationMeta('range');
  @override
  late final GeneratedColumn<String> range = GeneratedColumn<String>(
    'range',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<String> duration = GeneratedColumn<String>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _concentrationMeta = const VerificationMeta(
    'concentration',
  );
  @override
  late final GeneratedColumn<bool> concentration = GeneratedColumn<bool>(
    'concentration',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("concentration" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _ritualMeta = const VerificationMeta('ritual');
  @override
  late final GeneratedColumn<bool> ritual = GeneratedColumn<bool>(
    'ritual',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("ritual" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _classesJsonMeta = const VerificationMeta(
    'classesJson',
  );
  @override
  late final GeneratedColumn<String> classesJson = GeneratedColumn<String>(
    'classes_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    source,
    level,
    school,
    castingTime,
    range,
    duration,
    concentration,
    ritual,
    description,
    classesJson,
    dataJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spells';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpellRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('school')) {
      context.handle(
        _schoolMeta,
        school.isAcceptableOrUnknown(data['school']!, _schoolMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolMeta);
    }
    if (data.containsKey('casting_time')) {
      context.handle(
        _castingTimeMeta,
        castingTime.isAcceptableOrUnknown(
          data['casting_time']!,
          _castingTimeMeta,
        ),
      );
    }
    if (data.containsKey('range')) {
      context.handle(
        _rangeMeta,
        range.isAcceptableOrUnknown(data['range']!, _rangeMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('concentration')) {
      context.handle(
        _concentrationMeta,
        concentration.isAcceptableOrUnknown(
          data['concentration']!,
          _concentrationMeta,
        ),
      );
    }
    if (data.containsKey('ritual')) {
      context.handle(
        _ritualMeta,
        ritual.isAcceptableOrUnknown(data['ritual']!, _ritualMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('classes_json')) {
      context.handle(
        _classesJsonMeta,
        classesJson.isAcceptableOrUnknown(
          data['classes_json']!,
          _classesJsonMeta,
        ),
      );
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpellRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpellRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      school: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school'],
      )!,
      castingTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}casting_time'],
      ),
      range: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}range'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duration'],
      ),
      concentration: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}concentration'],
      )!,
      ritual: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}ritual'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      classesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}classes_json'],
      ),
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SpellsTable createAlias(String alias) {
    return $SpellsTable(attachedDatabase, alias);
  }
}

class SpellRow extends DataClass implements Insertable<SpellRow> {
  final String id;
  final String name;

  /// 'official' | 'homebrew' | 'custom' — required so the spellbook and the
  /// card generator can filter "solo ufficiali" vs "ufficiali+homebrew" vs
  /// "custom" as described in the product brief.
  final String source;
  final int level;
  final String school;
  final String? castingTime;
  final String? range;
  final String? duration;
  final bool concentration;
  final bool ritual;
  final String? description;

  /// JSON-encoded list of class ids/names that can cast this spell.
  final String? classesJson;
  final String? dataJson;
  final DateTime createdAt;
  const SpellRow({
    required this.id,
    required this.name,
    required this.source,
    required this.level,
    required this.school,
    this.castingTime,
    this.range,
    this.duration,
    required this.concentration,
    required this.ritual,
    this.description,
    this.classesJson,
    this.dataJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source'] = Variable<String>(source);
    map['level'] = Variable<int>(level);
    map['school'] = Variable<String>(school);
    if (!nullToAbsent || castingTime != null) {
      map['casting_time'] = Variable<String>(castingTime);
    }
    if (!nullToAbsent || range != null) {
      map['range'] = Variable<String>(range);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<String>(duration);
    }
    map['concentration'] = Variable<bool>(concentration);
    map['ritual'] = Variable<bool>(ritual);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || classesJson != null) {
      map['classes_json'] = Variable<String>(classesJson);
    }
    if (!nullToAbsent || dataJson != null) {
      map['data_json'] = Variable<String>(dataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SpellsCompanion toCompanion(bool nullToAbsent) {
    return SpellsCompanion(
      id: Value(id),
      name: Value(name),
      source: Value(source),
      level: Value(level),
      school: Value(school),
      castingTime: castingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(castingTime),
      range: range == null && nullToAbsent
          ? const Value.absent()
          : Value(range),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      concentration: Value(concentration),
      ritual: Value(ritual),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      classesJson: classesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(classesJson),
      dataJson: dataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dataJson),
      createdAt: Value(createdAt),
    );
  }

  factory SpellRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpellRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      source: serializer.fromJson<String>(json['source']),
      level: serializer.fromJson<int>(json['level']),
      school: serializer.fromJson<String>(json['school']),
      castingTime: serializer.fromJson<String?>(json['castingTime']),
      range: serializer.fromJson<String?>(json['range']),
      duration: serializer.fromJson<String?>(json['duration']),
      concentration: serializer.fromJson<bool>(json['concentration']),
      ritual: serializer.fromJson<bool>(json['ritual']),
      description: serializer.fromJson<String?>(json['description']),
      classesJson: serializer.fromJson<String?>(json['classesJson']),
      dataJson: serializer.fromJson<String?>(json['dataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'source': serializer.toJson<String>(source),
      'level': serializer.toJson<int>(level),
      'school': serializer.toJson<String>(school),
      'castingTime': serializer.toJson<String?>(castingTime),
      'range': serializer.toJson<String?>(range),
      'duration': serializer.toJson<String?>(duration),
      'concentration': serializer.toJson<bool>(concentration),
      'ritual': serializer.toJson<bool>(ritual),
      'description': serializer.toJson<String?>(description),
      'classesJson': serializer.toJson<String?>(classesJson),
      'dataJson': serializer.toJson<String?>(dataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SpellRow copyWith({
    String? id,
    String? name,
    String? source,
    int? level,
    String? school,
    Value<String?> castingTime = const Value.absent(),
    Value<String?> range = const Value.absent(),
    Value<String?> duration = const Value.absent(),
    bool? concentration,
    bool? ritual,
    Value<String?> description = const Value.absent(),
    Value<String?> classesJson = const Value.absent(),
    Value<String?> dataJson = const Value.absent(),
    DateTime? createdAt,
  }) => SpellRow(
    id: id ?? this.id,
    name: name ?? this.name,
    source: source ?? this.source,
    level: level ?? this.level,
    school: school ?? this.school,
    castingTime: castingTime.present ? castingTime.value : this.castingTime,
    range: range.present ? range.value : this.range,
    duration: duration.present ? duration.value : this.duration,
    concentration: concentration ?? this.concentration,
    ritual: ritual ?? this.ritual,
    description: description.present ? description.value : this.description,
    classesJson: classesJson.present ? classesJson.value : this.classesJson,
    dataJson: dataJson.present ? dataJson.value : this.dataJson,
    createdAt: createdAt ?? this.createdAt,
  );
  SpellRow copyWithCompanion(SpellsCompanion data) {
    return SpellRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      source: data.source.present ? data.source.value : this.source,
      level: data.level.present ? data.level.value : this.level,
      school: data.school.present ? data.school.value : this.school,
      castingTime: data.castingTime.present
          ? data.castingTime.value
          : this.castingTime,
      range: data.range.present ? data.range.value : this.range,
      duration: data.duration.present ? data.duration.value : this.duration,
      concentration: data.concentration.present
          ? data.concentration.value
          : this.concentration,
      ritual: data.ritual.present ? data.ritual.value : this.ritual,
      description: data.description.present
          ? data.description.value
          : this.description,
      classesJson: data.classesJson.present
          ? data.classesJson.value
          : this.classesJson,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpellRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('level: $level, ')
          ..write('school: $school, ')
          ..write('castingTime: $castingTime, ')
          ..write('range: $range, ')
          ..write('duration: $duration, ')
          ..write('concentration: $concentration, ')
          ..write('ritual: $ritual, ')
          ..write('description: $description, ')
          ..write('classesJson: $classesJson, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    source,
    level,
    school,
    castingTime,
    range,
    duration,
    concentration,
    ritual,
    description,
    classesJson,
    dataJson,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpellRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.source == this.source &&
          other.level == this.level &&
          other.school == this.school &&
          other.castingTime == this.castingTime &&
          other.range == this.range &&
          other.duration == this.duration &&
          other.concentration == this.concentration &&
          other.ritual == this.ritual &&
          other.description == this.description &&
          other.classesJson == this.classesJson &&
          other.dataJson == this.dataJson &&
          other.createdAt == this.createdAt);
}

class SpellsCompanion extends UpdateCompanion<SpellRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> source;
  final Value<int> level;
  final Value<String> school;
  final Value<String?> castingTime;
  final Value<String?> range;
  final Value<String?> duration;
  final Value<bool> concentration;
  final Value<bool> ritual;
  final Value<String?> description;
  final Value<String?> classesJson;
  final Value<String?> dataJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SpellsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.source = const Value.absent(),
    this.level = const Value.absent(),
    this.school = const Value.absent(),
    this.castingTime = const Value.absent(),
    this.range = const Value.absent(),
    this.duration = const Value.absent(),
    this.concentration = const Value.absent(),
    this.ritual = const Value.absent(),
    this.description = const Value.absent(),
    this.classesJson = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpellsCompanion.insert({
    required String id,
    required String name,
    this.source = const Value.absent(),
    required int level,
    required String school,
    this.castingTime = const Value.absent(),
    this.range = const Value.absent(),
    this.duration = const Value.absent(),
    this.concentration = const Value.absent(),
    this.ritual = const Value.absent(),
    this.description = const Value.absent(),
    this.classesJson = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       level = Value(level),
       school = Value(school);
  static Insertable<SpellRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? source,
    Expression<int>? level,
    Expression<String>? school,
    Expression<String>? castingTime,
    Expression<String>? range,
    Expression<String>? duration,
    Expression<bool>? concentration,
    Expression<bool>? ritual,
    Expression<String>? description,
    Expression<String>? classesJson,
    Expression<String>? dataJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (level != null) 'level': level,
      if (school != null) 'school': school,
      if (castingTime != null) 'casting_time': castingTime,
      if (range != null) 'range': range,
      if (duration != null) 'duration': duration,
      if (concentration != null) 'concentration': concentration,
      if (ritual != null) 'ritual': ritual,
      if (description != null) 'description': description,
      if (classesJson != null) 'classes_json': classesJson,
      if (dataJson != null) 'data_json': dataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpellsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? source,
    Value<int>? level,
    Value<String>? school,
    Value<String?>? castingTime,
    Value<String?>? range,
    Value<String?>? duration,
    Value<bool>? concentration,
    Value<bool>? ritual,
    Value<String?>? description,
    Value<String?>? classesJson,
    Value<String?>? dataJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SpellsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      source: source ?? this.source,
      level: level ?? this.level,
      school: school ?? this.school,
      castingTime: castingTime ?? this.castingTime,
      range: range ?? this.range,
      duration: duration ?? this.duration,
      concentration: concentration ?? this.concentration,
      ritual: ritual ?? this.ritual,
      description: description ?? this.description,
      classesJson: classesJson ?? this.classesJson,
      dataJson: dataJson ?? this.dataJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (school.present) {
      map['school'] = Variable<String>(school.value);
    }
    if (castingTime.present) {
      map['casting_time'] = Variable<String>(castingTime.value);
    }
    if (range.present) {
      map['range'] = Variable<String>(range.value);
    }
    if (duration.present) {
      map['duration'] = Variable<String>(duration.value);
    }
    if (concentration.present) {
      map['concentration'] = Variable<bool>(concentration.value);
    }
    if (ritual.present) {
      map['ritual'] = Variable<bool>(ritual.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (classesJson.present) {
      map['classes_json'] = Variable<String>(classesJson.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpellsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('level: $level, ')
          ..write('school: $school, ')
          ..write('castingTime: $castingTime, ')
          ..write('range: $range, ')
          ..write('duration: $duration, ')
          ..write('concentration: $concentration, ')
          ..write('ritual: $ritual, ')
          ..write('description: $description, ')
          ..write('classesJson: $classesJson, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, ItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(DataSource.official),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
    'rarity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    source,
    type,
    rarity,
    description,
    dataJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('rarity')) {
      context.handle(
        _rarityMeta,
        rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      rarity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rarity'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class ItemRow extends DataClass implements Insertable<ItemRow> {
  final String id;
  final String name;
  final String source;

  /// e.g. weapon, armor, wondrous item, potion, ...
  final String type;
  final String? rarity;
  final String? description;
  final String? dataJson;
  final DateTime createdAt;
  const ItemRow({
    required this.id,
    required this.name,
    required this.source,
    required this.type,
    this.rarity,
    this.description,
    this.dataJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source'] = Variable<String>(source);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || rarity != null) {
      map['rarity'] = Variable<String>(rarity);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dataJson != null) {
      map['data_json'] = Variable<String>(dataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      source: Value(source),
      type: Value(type),
      rarity: rarity == null && nullToAbsent
          ? const Value.absent()
          : Value(rarity),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dataJson: dataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dataJson),
      createdAt: Value(createdAt),
    );
  }

  factory ItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      source: serializer.fromJson<String>(json['source']),
      type: serializer.fromJson<String>(json['type']),
      rarity: serializer.fromJson<String?>(json['rarity']),
      description: serializer.fromJson<String?>(json['description']),
      dataJson: serializer.fromJson<String?>(json['dataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'source': serializer.toJson<String>(source),
      'type': serializer.toJson<String>(type),
      'rarity': serializer.toJson<String?>(rarity),
      'description': serializer.toJson<String?>(description),
      'dataJson': serializer.toJson<String?>(dataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ItemRow copyWith({
    String? id,
    String? name,
    String? source,
    String? type,
    Value<String?> rarity = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> dataJson = const Value.absent(),
    DateTime? createdAt,
  }) => ItemRow(
    id: id ?? this.id,
    name: name ?? this.name,
    source: source ?? this.source,
    type: type ?? this.type,
    rarity: rarity.present ? rarity.value : this.rarity,
    description: description.present ? description.value : this.description,
    dataJson: dataJson.present ? dataJson.value : this.dataJson,
    createdAt: createdAt ?? this.createdAt,
  );
  ItemRow copyWithCompanion(ItemsCompanion data) {
    return ItemRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      source: data.source.present ? data.source.value : this.source,
      type: data.type.present ? data.type.value : this.type,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      description: data.description.present
          ? data.description.value
          : this.description,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('type: $type, ')
          ..write('rarity: $rarity, ')
          ..write('description: $description, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    source,
    type,
    rarity,
    description,
    dataJson,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.source == this.source &&
          other.type == this.type &&
          other.rarity == this.rarity &&
          other.description == this.description &&
          other.dataJson == this.dataJson &&
          other.createdAt == this.createdAt);
}

class ItemsCompanion extends UpdateCompanion<ItemRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> source;
  final Value<String> type;
  final Value<String?> rarity;
  final Value<String?> description;
  final Value<String?> dataJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.source = const Value.absent(),
    this.type = const Value.absent(),
    this.rarity = const Value.absent(),
    this.description = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsCompanion.insert({
    required String id,
    required String name,
    this.source = const Value.absent(),
    required String type,
    this.rarity = const Value.absent(),
    this.description = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type);
  static Insertable<ItemRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? source,
    Expression<String>? type,
    Expression<String>? rarity,
    Expression<String>? description,
    Expression<String>? dataJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (type != null) 'type': type,
      if (rarity != null) 'rarity': rarity,
      if (description != null) 'description': description,
      if (dataJson != null) 'data_json': dataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? source,
    Value<String>? type,
    Value<String?>? rarity,
    Value<String?>? description,
    Value<String?>? dataJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      source: source ?? this.source,
      type: type ?? this.type,
      rarity: rarity ?? this.rarity,
      description: description ?? this.description,
      dataJson: dataJson ?? this.dataJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('type: $type, ')
          ..write('rarity: $rarity, ')
          ..write('description: $description, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterBasesTable extends CharacterBases
    with TableInfo<$CharacterBasesTable, CharacterBaseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterBasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _raceIdMeta = const VerificationMeta('raceId');
  @override
  late final GeneratedColumn<String> raceId = GeneratedColumn<String>(
    'race_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES races (id)',
    ),
  );
  static const VerificationMeta _startingClassIdMeta = const VerificationMeta(
    'startingClassId',
  );
  @override
  late final GeneratedColumn<String> startingClassId = GeneratedColumn<String>(
    'starting_class_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES classes (id)',
    ),
  );
  static const VerificationMeta _backstoryMeta = const VerificationMeta(
    'backstory',
  );
  @override
  late final GeneratedColumn<String> backstory = GeneratedColumn<String>(
    'backstory',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataJsonMeta = const VerificationMeta(
    'dataJson',
  );
  @override
  late final GeneratedColumn<String> dataJson = GeneratedColumn<String>(
    'data_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    raceId,
    startingClassId,
    backstory,
    dataJson,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_bases';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterBaseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('race_id')) {
      context.handle(
        _raceIdMeta,
        raceId.isAcceptableOrUnknown(data['race_id']!, _raceIdMeta),
      );
    }
    if (data.containsKey('starting_class_id')) {
      context.handle(
        _startingClassIdMeta,
        startingClassId.isAcceptableOrUnknown(
          data['starting_class_id']!,
          _startingClassIdMeta,
        ),
      );
    }
    if (data.containsKey('backstory')) {
      context.handle(
        _backstoryMeta,
        backstory.isAcceptableOrUnknown(data['backstory']!, _backstoryMeta),
      );
    }
    if (data.containsKey('data_json')) {
      context.handle(
        _dataJsonMeta,
        dataJson.isAcceptableOrUnknown(data['data_json']!, _dataJsonMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterBaseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterBaseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      raceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race_id'],
      ),
      startingClassId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}starting_class_id'],
      ),
      backstory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backstory'],
      ),
      dataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CharacterBasesTable createAlias(String alias) {
    return $CharacterBasesTable(attachedDatabase, alias);
  }
}

class CharacterBaseRow extends DataClass
    implements Insertable<CharacterBaseRow> {
  final String id;
  final String name;

  /// Nullable FK: a base can point at a catalogued race/class, or leave
  /// these unset and describe a fully homebrew concept via [dataJson].
  final String? raceId;
  final String? startingClassId;
  final String? backstory;

  /// Freeform payload for anything the AI build assistant needs to persist
  /// at the character (not instance) level — e.g. the original concept
  /// prompt. Level-by-level build notes have their own table,
  /// [CharacterBuildNotes], since there can be more than one plan revision.
  final String? dataJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CharacterBaseRow({
    required this.id,
    required this.name,
    this.raceId,
    this.startingClassId,
    this.backstory,
    this.dataJson,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || raceId != null) {
      map['race_id'] = Variable<String>(raceId);
    }
    if (!nullToAbsent || startingClassId != null) {
      map['starting_class_id'] = Variable<String>(startingClassId);
    }
    if (!nullToAbsent || backstory != null) {
      map['backstory'] = Variable<String>(backstory);
    }
    if (!nullToAbsent || dataJson != null) {
      map['data_json'] = Variable<String>(dataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CharacterBasesCompanion toCompanion(bool nullToAbsent) {
    return CharacterBasesCompanion(
      id: Value(id),
      name: Value(name),
      raceId: raceId == null && nullToAbsent
          ? const Value.absent()
          : Value(raceId),
      startingClassId: startingClassId == null && nullToAbsent
          ? const Value.absent()
          : Value(startingClassId),
      backstory: backstory == null && nullToAbsent
          ? const Value.absent()
          : Value(backstory),
      dataJson: dataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dataJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CharacterBaseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterBaseRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      raceId: serializer.fromJson<String?>(json['raceId']),
      startingClassId: serializer.fromJson<String?>(json['startingClassId']),
      backstory: serializer.fromJson<String?>(json['backstory']),
      dataJson: serializer.fromJson<String?>(json['dataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'raceId': serializer.toJson<String?>(raceId),
      'startingClassId': serializer.toJson<String?>(startingClassId),
      'backstory': serializer.toJson<String?>(backstory),
      'dataJson': serializer.toJson<String?>(dataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CharacterBaseRow copyWith({
    String? id,
    String? name,
    Value<String?> raceId = const Value.absent(),
    Value<String?> startingClassId = const Value.absent(),
    Value<String?> backstory = const Value.absent(),
    Value<String?> dataJson = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CharacterBaseRow(
    id: id ?? this.id,
    name: name ?? this.name,
    raceId: raceId.present ? raceId.value : this.raceId,
    startingClassId: startingClassId.present
        ? startingClassId.value
        : this.startingClassId,
    backstory: backstory.present ? backstory.value : this.backstory,
    dataJson: dataJson.present ? dataJson.value : this.dataJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CharacterBaseRow copyWithCompanion(CharacterBasesCompanion data) {
    return CharacterBaseRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      raceId: data.raceId.present ? data.raceId.value : this.raceId,
      startingClassId: data.startingClassId.present
          ? data.startingClassId.value
          : this.startingClassId,
      backstory: data.backstory.present ? data.backstory.value : this.backstory,
      dataJson: data.dataJson.present ? data.dataJson.value : this.dataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterBaseRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('raceId: $raceId, ')
          ..write('startingClassId: $startingClassId, ')
          ..write('backstory: $backstory, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    raceId,
    startingClassId,
    backstory,
    dataJson,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterBaseRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.raceId == this.raceId &&
          other.startingClassId == this.startingClassId &&
          other.backstory == this.backstory &&
          other.dataJson == this.dataJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CharacterBasesCompanion extends UpdateCompanion<CharacterBaseRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> raceId;
  final Value<String?> startingClassId;
  final Value<String?> backstory;
  final Value<String?> dataJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CharacterBasesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.raceId = const Value.absent(),
    this.startingClassId = const Value.absent(),
    this.backstory = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterBasesCompanion.insert({
    required String id,
    required String name,
    this.raceId = const Value.absent(),
    this.startingClassId = const Value.absent(),
    this.backstory = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<CharacterBaseRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? raceId,
    Expression<String>? startingClassId,
    Expression<String>? backstory,
    Expression<String>? dataJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (raceId != null) 'race_id': raceId,
      if (startingClassId != null) 'starting_class_id': startingClassId,
      if (backstory != null) 'backstory': backstory,
      if (dataJson != null) 'data_json': dataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterBasesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? raceId,
    Value<String?>? startingClassId,
    Value<String?>? backstory,
    Value<String?>? dataJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CharacterBasesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      raceId: raceId ?? this.raceId,
      startingClassId: startingClassId ?? this.startingClassId,
      backstory: backstory ?? this.backstory,
      dataJson: dataJson ?? this.dataJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (raceId.present) {
      map['race_id'] = Variable<String>(raceId.value);
    }
    if (startingClassId.present) {
      map['starting_class_id'] = Variable<String>(startingClassId.value);
    }
    if (backstory.present) {
      map['backstory'] = Variable<String>(backstory.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterBasesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('raceId: $raceId, ')
          ..write('startingClassId: $startingClassId, ')
          ..write('backstory: $backstory, ')
          ..write('dataJson: $dataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterInstancesTable extends CharacterInstances
    with TableInfo<$CharacterInstancesTable, CharacterInstanceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterInstancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterBaseIdMeta = const VerificationMeta(
    'characterBaseId',
  );
  @override
  late final GeneratedColumn<String> characterBaseId = GeneratedColumn<String>(
    'character_base_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES character_bases (id)',
    ),
  );
  static const VerificationMeta _campaignIdMeta = const VerificationMeta(
    'campaignId',
  );
  @override
  late final GeneratedColumn<String> campaignId = GeneratedColumn<String>(
    'campaign_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _campaignNameMeta = const VerificationMeta(
    'campaignName',
  );
  @override
  late final GeneratedColumn<String> campaignName = GeneratedColumn<String>(
    'campaign_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _currentHpMeta = const VerificationMeta(
    'currentHp',
  );
  @override
  late final GeneratedColumn<int> currentHp = GeneratedColumn<int>(
    'current_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxHpMeta = const VerificationMeta('maxHp');
  @override
  late final GeneratedColumn<int> maxHp = GeneratedColumn<int>(
    'max_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _temporaryHpMeta = const VerificationMeta(
    'temporaryHp',
  );
  @override
  late final GeneratedColumn<int> temporaryHp = GeneratedColumn<int>(
    'temporary_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _armorClassMeta = const VerificationMeta(
    'armorClass',
  );
  @override
  late final GeneratedColumn<int> armorClass = GeneratedColumn<int>(
    'armor_class',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proficiencyBonusMeta = const VerificationMeta(
    'proficiencyBonus',
  );
  @override
  late final GeneratedColumn<int> proficiencyBonus = GeneratedColumn<int>(
    'proficiency_bonus',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spellSlotsJsonMeta = const VerificationMeta(
    'spellSlotsJson',
  );
  @override
  late final GeneratedColumn<String> spellSlotsJson = GeneratedColumn<String>(
    'spell_slots_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterBaseId,
    campaignId,
    campaignName,
    level,
    currentHp,
    maxHp,
    temporaryHp,
    armorClass,
    proficiencyBonus,
    spellSlotsJson,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_instances';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterInstanceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_base_id')) {
      context.handle(
        _characterBaseIdMeta,
        characterBaseId.isAcceptableOrUnknown(
          data['character_base_id']!,
          _characterBaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterBaseIdMeta);
    }
    if (data.containsKey('campaign_id')) {
      context.handle(
        _campaignIdMeta,
        campaignId.isAcceptableOrUnknown(data['campaign_id']!, _campaignIdMeta),
      );
    }
    if (data.containsKey('campaign_name')) {
      context.handle(
        _campaignNameMeta,
        campaignName.isAcceptableOrUnknown(
          data['campaign_name']!,
          _campaignNameMeta,
        ),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('current_hp')) {
      context.handle(
        _currentHpMeta,
        currentHp.isAcceptableOrUnknown(data['current_hp']!, _currentHpMeta),
      );
    }
    if (data.containsKey('max_hp')) {
      context.handle(
        _maxHpMeta,
        maxHp.isAcceptableOrUnknown(data['max_hp']!, _maxHpMeta),
      );
    }
    if (data.containsKey('temporary_hp')) {
      context.handle(
        _temporaryHpMeta,
        temporaryHp.isAcceptableOrUnknown(
          data['temporary_hp']!,
          _temporaryHpMeta,
        ),
      );
    }
    if (data.containsKey('armor_class')) {
      context.handle(
        _armorClassMeta,
        armorClass.isAcceptableOrUnknown(data['armor_class']!, _armorClassMeta),
      );
    }
    if (data.containsKey('proficiency_bonus')) {
      context.handle(
        _proficiencyBonusMeta,
        proficiencyBonus.isAcceptableOrUnknown(
          data['proficiency_bonus']!,
          _proficiencyBonusMeta,
        ),
      );
    }
    if (data.containsKey('spell_slots_json')) {
      context.handle(
        _spellSlotsJsonMeta,
        spellSlotsJson.isAcceptableOrUnknown(
          data['spell_slots_json']!,
          _spellSlotsJsonMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterInstanceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterInstanceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      characterBaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_base_id'],
      )!,
      campaignId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_id'],
      ),
      campaignName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_name'],
      ),
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      currentHp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_hp'],
      )!,
      maxHp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_hp'],
      )!,
      temporaryHp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}temporary_hp'],
      )!,
      armorClass: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}armor_class'],
      ),
      proficiencyBonus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proficiency_bonus'],
      ),
      spellSlotsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}spell_slots_json'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CharacterInstancesTable createAlias(String alias) {
    return $CharacterInstancesTable(attachedDatabase, alias);
  }
}

class CharacterInstanceRow extends DataClass
    implements Insertable<CharacterInstanceRow> {
  final String id;
  final String characterBaseId;

  /// Null = a purely local instance, not tied to any DM-hosted campaign
  /// synced via PocketBase.
  final String? campaignId;
  final String? campaignName;
  final int level;
  final int currentHp;
  final int maxHp;
  final int temporaryHp;
  final int? armorClass;
  final int? proficiencyBonus;

  /// JSON map of spell-slot level -> {max, used}. Kept flexible until the
  /// character-sheet feature settles on its final shape.
  final String? spellSlotsJson;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CharacterInstanceRow({
    required this.id,
    required this.characterBaseId,
    this.campaignId,
    this.campaignName,
    required this.level,
    required this.currentHp,
    required this.maxHp,
    required this.temporaryHp,
    this.armorClass,
    this.proficiencyBonus,
    this.spellSlotsJson,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_base_id'] = Variable<String>(characterBaseId);
    if (!nullToAbsent || campaignId != null) {
      map['campaign_id'] = Variable<String>(campaignId);
    }
    if (!nullToAbsent || campaignName != null) {
      map['campaign_name'] = Variable<String>(campaignName);
    }
    map['level'] = Variable<int>(level);
    map['current_hp'] = Variable<int>(currentHp);
    map['max_hp'] = Variable<int>(maxHp);
    map['temporary_hp'] = Variable<int>(temporaryHp);
    if (!nullToAbsent || armorClass != null) {
      map['armor_class'] = Variable<int>(armorClass);
    }
    if (!nullToAbsent || proficiencyBonus != null) {
      map['proficiency_bonus'] = Variable<int>(proficiencyBonus);
    }
    if (!nullToAbsent || spellSlotsJson != null) {
      map['spell_slots_json'] = Variable<String>(spellSlotsJson);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CharacterInstancesCompanion toCompanion(bool nullToAbsent) {
    return CharacterInstancesCompanion(
      id: Value(id),
      characterBaseId: Value(characterBaseId),
      campaignId: campaignId == null && nullToAbsent
          ? const Value.absent()
          : Value(campaignId),
      campaignName: campaignName == null && nullToAbsent
          ? const Value.absent()
          : Value(campaignName),
      level: Value(level),
      currentHp: Value(currentHp),
      maxHp: Value(maxHp),
      temporaryHp: Value(temporaryHp),
      armorClass: armorClass == null && nullToAbsent
          ? const Value.absent()
          : Value(armorClass),
      proficiencyBonus: proficiencyBonus == null && nullToAbsent
          ? const Value.absent()
          : Value(proficiencyBonus),
      spellSlotsJson: spellSlotsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(spellSlotsJson),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CharacterInstanceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterInstanceRow(
      id: serializer.fromJson<String>(json['id']),
      characterBaseId: serializer.fromJson<String>(json['characterBaseId']),
      campaignId: serializer.fromJson<String?>(json['campaignId']),
      campaignName: serializer.fromJson<String?>(json['campaignName']),
      level: serializer.fromJson<int>(json['level']),
      currentHp: serializer.fromJson<int>(json['currentHp']),
      maxHp: serializer.fromJson<int>(json['maxHp']),
      temporaryHp: serializer.fromJson<int>(json['temporaryHp']),
      armorClass: serializer.fromJson<int?>(json['armorClass']),
      proficiencyBonus: serializer.fromJson<int?>(json['proficiencyBonus']),
      spellSlotsJson: serializer.fromJson<String?>(json['spellSlotsJson']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterBaseId': serializer.toJson<String>(characterBaseId),
      'campaignId': serializer.toJson<String?>(campaignId),
      'campaignName': serializer.toJson<String?>(campaignName),
      'level': serializer.toJson<int>(level),
      'currentHp': serializer.toJson<int>(currentHp),
      'maxHp': serializer.toJson<int>(maxHp),
      'temporaryHp': serializer.toJson<int>(temporaryHp),
      'armorClass': serializer.toJson<int?>(armorClass),
      'proficiencyBonus': serializer.toJson<int?>(proficiencyBonus),
      'spellSlotsJson': serializer.toJson<String?>(spellSlotsJson),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CharacterInstanceRow copyWith({
    String? id,
    String? characterBaseId,
    Value<String?> campaignId = const Value.absent(),
    Value<String?> campaignName = const Value.absent(),
    int? level,
    int? currentHp,
    int? maxHp,
    int? temporaryHp,
    Value<int?> armorClass = const Value.absent(),
    Value<int?> proficiencyBonus = const Value.absent(),
    Value<String?> spellSlotsJson = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CharacterInstanceRow(
    id: id ?? this.id,
    characterBaseId: characterBaseId ?? this.characterBaseId,
    campaignId: campaignId.present ? campaignId.value : this.campaignId,
    campaignName: campaignName.present ? campaignName.value : this.campaignName,
    level: level ?? this.level,
    currentHp: currentHp ?? this.currentHp,
    maxHp: maxHp ?? this.maxHp,
    temporaryHp: temporaryHp ?? this.temporaryHp,
    armorClass: armorClass.present ? armorClass.value : this.armorClass,
    proficiencyBonus: proficiencyBonus.present
        ? proficiencyBonus.value
        : this.proficiencyBonus,
    spellSlotsJson: spellSlotsJson.present
        ? spellSlotsJson.value
        : this.spellSlotsJson,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CharacterInstanceRow copyWithCompanion(CharacterInstancesCompanion data) {
    return CharacterInstanceRow(
      id: data.id.present ? data.id.value : this.id,
      characterBaseId: data.characterBaseId.present
          ? data.characterBaseId.value
          : this.characterBaseId,
      campaignId: data.campaignId.present
          ? data.campaignId.value
          : this.campaignId,
      campaignName: data.campaignName.present
          ? data.campaignName.value
          : this.campaignName,
      level: data.level.present ? data.level.value : this.level,
      currentHp: data.currentHp.present ? data.currentHp.value : this.currentHp,
      maxHp: data.maxHp.present ? data.maxHp.value : this.maxHp,
      temporaryHp: data.temporaryHp.present
          ? data.temporaryHp.value
          : this.temporaryHp,
      armorClass: data.armorClass.present
          ? data.armorClass.value
          : this.armorClass,
      proficiencyBonus: data.proficiencyBonus.present
          ? data.proficiencyBonus.value
          : this.proficiencyBonus,
      spellSlotsJson: data.spellSlotsJson.present
          ? data.spellSlotsJson.value
          : this.spellSlotsJson,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterInstanceRow(')
          ..write('id: $id, ')
          ..write('characterBaseId: $characterBaseId, ')
          ..write('campaignId: $campaignId, ')
          ..write('campaignName: $campaignName, ')
          ..write('level: $level, ')
          ..write('currentHp: $currentHp, ')
          ..write('maxHp: $maxHp, ')
          ..write('temporaryHp: $temporaryHp, ')
          ..write('armorClass: $armorClass, ')
          ..write('proficiencyBonus: $proficiencyBonus, ')
          ..write('spellSlotsJson: $spellSlotsJson, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterBaseId,
    campaignId,
    campaignName,
    level,
    currentHp,
    maxHp,
    temporaryHp,
    armorClass,
    proficiencyBonus,
    spellSlotsJson,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterInstanceRow &&
          other.id == this.id &&
          other.characterBaseId == this.characterBaseId &&
          other.campaignId == this.campaignId &&
          other.campaignName == this.campaignName &&
          other.level == this.level &&
          other.currentHp == this.currentHp &&
          other.maxHp == this.maxHp &&
          other.temporaryHp == this.temporaryHp &&
          other.armorClass == this.armorClass &&
          other.proficiencyBonus == this.proficiencyBonus &&
          other.spellSlotsJson == this.spellSlotsJson &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CharacterInstancesCompanion
    extends UpdateCompanion<CharacterInstanceRow> {
  final Value<String> id;
  final Value<String> characterBaseId;
  final Value<String?> campaignId;
  final Value<String?> campaignName;
  final Value<int> level;
  final Value<int> currentHp;
  final Value<int> maxHp;
  final Value<int> temporaryHp;
  final Value<int?> armorClass;
  final Value<int?> proficiencyBonus;
  final Value<String?> spellSlotsJson;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CharacterInstancesCompanion({
    this.id = const Value.absent(),
    this.characterBaseId = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.campaignName = const Value.absent(),
    this.level = const Value.absent(),
    this.currentHp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.temporaryHp = const Value.absent(),
    this.armorClass = const Value.absent(),
    this.proficiencyBonus = const Value.absent(),
    this.spellSlotsJson = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterInstancesCompanion.insert({
    required String id,
    required String characterBaseId,
    this.campaignId = const Value.absent(),
    this.campaignName = const Value.absent(),
    this.level = const Value.absent(),
    this.currentHp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.temporaryHp = const Value.absent(),
    this.armorClass = const Value.absent(),
    this.proficiencyBonus = const Value.absent(),
    this.spellSlotsJson = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       characterBaseId = Value(characterBaseId);
  static Insertable<CharacterInstanceRow> custom({
    Expression<String>? id,
    Expression<String>? characterBaseId,
    Expression<String>? campaignId,
    Expression<String>? campaignName,
    Expression<int>? level,
    Expression<int>? currentHp,
    Expression<int>? maxHp,
    Expression<int>? temporaryHp,
    Expression<int>? armorClass,
    Expression<int>? proficiencyBonus,
    Expression<String>? spellSlotsJson,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterBaseId != null) 'character_base_id': characterBaseId,
      if (campaignId != null) 'campaign_id': campaignId,
      if (campaignName != null) 'campaign_name': campaignName,
      if (level != null) 'level': level,
      if (currentHp != null) 'current_hp': currentHp,
      if (maxHp != null) 'max_hp': maxHp,
      if (temporaryHp != null) 'temporary_hp': temporaryHp,
      if (armorClass != null) 'armor_class': armorClass,
      if (proficiencyBonus != null) 'proficiency_bonus': proficiencyBonus,
      if (spellSlotsJson != null) 'spell_slots_json': spellSlotsJson,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterInstancesCompanion copyWith({
    Value<String>? id,
    Value<String>? characterBaseId,
    Value<String?>? campaignId,
    Value<String?>? campaignName,
    Value<int>? level,
    Value<int>? currentHp,
    Value<int>? maxHp,
    Value<int>? temporaryHp,
    Value<int?>? armorClass,
    Value<int?>? proficiencyBonus,
    Value<String?>? spellSlotsJson,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CharacterInstancesCompanion(
      id: id ?? this.id,
      characterBaseId: characterBaseId ?? this.characterBaseId,
      campaignId: campaignId ?? this.campaignId,
      campaignName: campaignName ?? this.campaignName,
      level: level ?? this.level,
      currentHp: currentHp ?? this.currentHp,
      maxHp: maxHp ?? this.maxHp,
      temporaryHp: temporaryHp ?? this.temporaryHp,
      armorClass: armorClass ?? this.armorClass,
      proficiencyBonus: proficiencyBonus ?? this.proficiencyBonus,
      spellSlotsJson: spellSlotsJson ?? this.spellSlotsJson,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterBaseId.present) {
      map['character_base_id'] = Variable<String>(characterBaseId.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (campaignName.present) {
      map['campaign_name'] = Variable<String>(campaignName.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (currentHp.present) {
      map['current_hp'] = Variable<int>(currentHp.value);
    }
    if (maxHp.present) {
      map['max_hp'] = Variable<int>(maxHp.value);
    }
    if (temporaryHp.present) {
      map['temporary_hp'] = Variable<int>(temporaryHp.value);
    }
    if (armorClass.present) {
      map['armor_class'] = Variable<int>(armorClass.value);
    }
    if (proficiencyBonus.present) {
      map['proficiency_bonus'] = Variable<int>(proficiencyBonus.value);
    }
    if (spellSlotsJson.present) {
      map['spell_slots_json'] = Variable<String>(spellSlotsJson.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterInstancesCompanion(')
          ..write('id: $id, ')
          ..write('characterBaseId: $characterBaseId, ')
          ..write('campaignId: $campaignId, ')
          ..write('campaignName: $campaignName, ')
          ..write('level: $level, ')
          ..write('currentHp: $currentHp, ')
          ..write('maxHp: $maxHp, ')
          ..write('temporaryHp: $temporaryHp, ')
          ..write('armorClass: $armorClass, ')
          ..write('proficiencyBonus: $proficiencyBonus, ')
          ..write('spellSlotsJson: $spellSlotsJson, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterSpellsTable extends CharacterSpells
    with TableInfo<$CharacterSpellsTable, CharacterSpellRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterSpellsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterInstanceIdMeta =
      const VerificationMeta('characterInstanceId');
  @override
  late final GeneratedColumn<String> characterInstanceId =
      GeneratedColumn<String>(
        'character_instance_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES character_instances (id)',
        ),
      );
  static const VerificationMeta _spellIdMeta = const VerificationMeta(
    'spellId',
  );
  @override
  late final GeneratedColumn<String> spellId = GeneratedColumn<String>(
    'spell_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES spells (id)',
    ),
  );
  static const VerificationMeta _isPreparedMeta = const VerificationMeta(
    'isPrepared',
  );
  @override
  late final GeneratedColumn<bool> isPrepared = GeneratedColumn<bool>(
    'is_prepared',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_prepared" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isAlwaysPreparedMeta = const VerificationMeta(
    'isAlwaysPrepared',
  );
  @override
  late final GeneratedColumn<bool> isAlwaysPrepared = GeneratedColumn<bool>(
    'is_always_prepared',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_always_prepared" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterInstanceId,
    spellId,
    isPrepared,
    isAlwaysPrepared,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_spells';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterSpellRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_instance_id')) {
      context.handle(
        _characterInstanceIdMeta,
        characterInstanceId.isAcceptableOrUnknown(
          data['character_instance_id']!,
          _characterInstanceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterInstanceIdMeta);
    }
    if (data.containsKey('spell_id')) {
      context.handle(
        _spellIdMeta,
        spellId.isAcceptableOrUnknown(data['spell_id']!, _spellIdMeta),
      );
    } else if (isInserting) {
      context.missing(_spellIdMeta);
    }
    if (data.containsKey('is_prepared')) {
      context.handle(
        _isPreparedMeta,
        isPrepared.isAcceptableOrUnknown(data['is_prepared']!, _isPreparedMeta),
      );
    }
    if (data.containsKey('is_always_prepared')) {
      context.handle(
        _isAlwaysPreparedMeta,
        isAlwaysPrepared.isAcceptableOrUnknown(
          data['is_always_prepared']!,
          _isAlwaysPreparedMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {characterInstanceId, spellId},
  ];
  @override
  CharacterSpellRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterSpellRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      characterInstanceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_instance_id'],
      )!,
      spellId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}spell_id'],
      )!,
      isPrepared: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_prepared'],
      )!,
      isAlwaysPrepared: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_always_prepared'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CharacterSpellsTable createAlias(String alias) {
    return $CharacterSpellsTable(attachedDatabase, alias);
  }
}

class CharacterSpellRow extends DataClass
    implements Insertable<CharacterSpellRow> {
  final String id;
  final String characterInstanceId;
  final String spellId;
  final bool isPrepared;

  /// Always-prepared spells granted by class/subclass/race features.
  final bool isAlwaysPrepared;
  final String? notes;
  const CharacterSpellRow({
    required this.id,
    required this.characterInstanceId,
    required this.spellId,
    required this.isPrepared,
    required this.isAlwaysPrepared,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_instance_id'] = Variable<String>(characterInstanceId);
    map['spell_id'] = Variable<String>(spellId);
    map['is_prepared'] = Variable<bool>(isPrepared);
    map['is_always_prepared'] = Variable<bool>(isAlwaysPrepared);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CharacterSpellsCompanion toCompanion(bool nullToAbsent) {
    return CharacterSpellsCompanion(
      id: Value(id),
      characterInstanceId: Value(characterInstanceId),
      spellId: Value(spellId),
      isPrepared: Value(isPrepared),
      isAlwaysPrepared: Value(isAlwaysPrepared),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CharacterSpellRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterSpellRow(
      id: serializer.fromJson<String>(json['id']),
      characterInstanceId: serializer.fromJson<String>(
        json['characterInstanceId'],
      ),
      spellId: serializer.fromJson<String>(json['spellId']),
      isPrepared: serializer.fromJson<bool>(json['isPrepared']),
      isAlwaysPrepared: serializer.fromJson<bool>(json['isAlwaysPrepared']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterInstanceId': serializer.toJson<String>(characterInstanceId),
      'spellId': serializer.toJson<String>(spellId),
      'isPrepared': serializer.toJson<bool>(isPrepared),
      'isAlwaysPrepared': serializer.toJson<bool>(isAlwaysPrepared),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CharacterSpellRow copyWith({
    String? id,
    String? characterInstanceId,
    String? spellId,
    bool? isPrepared,
    bool? isAlwaysPrepared,
    Value<String?> notes = const Value.absent(),
  }) => CharacterSpellRow(
    id: id ?? this.id,
    characterInstanceId: characterInstanceId ?? this.characterInstanceId,
    spellId: spellId ?? this.spellId,
    isPrepared: isPrepared ?? this.isPrepared,
    isAlwaysPrepared: isAlwaysPrepared ?? this.isAlwaysPrepared,
    notes: notes.present ? notes.value : this.notes,
  );
  CharacterSpellRow copyWithCompanion(CharacterSpellsCompanion data) {
    return CharacterSpellRow(
      id: data.id.present ? data.id.value : this.id,
      characterInstanceId: data.characterInstanceId.present
          ? data.characterInstanceId.value
          : this.characterInstanceId,
      spellId: data.spellId.present ? data.spellId.value : this.spellId,
      isPrepared: data.isPrepared.present
          ? data.isPrepared.value
          : this.isPrepared,
      isAlwaysPrepared: data.isAlwaysPrepared.present
          ? data.isAlwaysPrepared.value
          : this.isAlwaysPrepared,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterSpellRow(')
          ..write('id: $id, ')
          ..write('characterInstanceId: $characterInstanceId, ')
          ..write('spellId: $spellId, ')
          ..write('isPrepared: $isPrepared, ')
          ..write('isAlwaysPrepared: $isAlwaysPrepared, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterInstanceId,
    spellId,
    isPrepared,
    isAlwaysPrepared,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterSpellRow &&
          other.id == this.id &&
          other.characterInstanceId == this.characterInstanceId &&
          other.spellId == this.spellId &&
          other.isPrepared == this.isPrepared &&
          other.isAlwaysPrepared == this.isAlwaysPrepared &&
          other.notes == this.notes);
}

class CharacterSpellsCompanion extends UpdateCompanion<CharacterSpellRow> {
  final Value<String> id;
  final Value<String> characterInstanceId;
  final Value<String> spellId;
  final Value<bool> isPrepared;
  final Value<bool> isAlwaysPrepared;
  final Value<String?> notes;
  final Value<int> rowid;
  const CharacterSpellsCompanion({
    this.id = const Value.absent(),
    this.characterInstanceId = const Value.absent(),
    this.spellId = const Value.absent(),
    this.isPrepared = const Value.absent(),
    this.isAlwaysPrepared = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterSpellsCompanion.insert({
    required String id,
    required String characterInstanceId,
    required String spellId,
    this.isPrepared = const Value.absent(),
    this.isAlwaysPrepared = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       characterInstanceId = Value(characterInstanceId),
       spellId = Value(spellId);
  static Insertable<CharacterSpellRow> custom({
    Expression<String>? id,
    Expression<String>? characterInstanceId,
    Expression<String>? spellId,
    Expression<bool>? isPrepared,
    Expression<bool>? isAlwaysPrepared,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterInstanceId != null)
        'character_instance_id': characterInstanceId,
      if (spellId != null) 'spell_id': spellId,
      if (isPrepared != null) 'is_prepared': isPrepared,
      if (isAlwaysPrepared != null) 'is_always_prepared': isAlwaysPrepared,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterSpellsCompanion copyWith({
    Value<String>? id,
    Value<String>? characterInstanceId,
    Value<String>? spellId,
    Value<bool>? isPrepared,
    Value<bool>? isAlwaysPrepared,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return CharacterSpellsCompanion(
      id: id ?? this.id,
      characterInstanceId: characterInstanceId ?? this.characterInstanceId,
      spellId: spellId ?? this.spellId,
      isPrepared: isPrepared ?? this.isPrepared,
      isAlwaysPrepared: isAlwaysPrepared ?? this.isAlwaysPrepared,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterInstanceId.present) {
      map['character_instance_id'] = Variable<String>(
        characterInstanceId.value,
      );
    }
    if (spellId.present) {
      map['spell_id'] = Variable<String>(spellId.value);
    }
    if (isPrepared.present) {
      map['is_prepared'] = Variable<bool>(isPrepared.value);
    }
    if (isAlwaysPrepared.present) {
      map['is_always_prepared'] = Variable<bool>(isAlwaysPrepared.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterSpellsCompanion(')
          ..write('id: $id, ')
          ..write('characterInstanceId: $characterInstanceId, ')
          ..write('spellId: $spellId, ')
          ..write('isPrepared: $isPrepared, ')
          ..write('isAlwaysPrepared: $isAlwaysPrepared, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterInventoryTable extends CharacterInventory
    with TableInfo<$CharacterInventoryTable, CharacterInventoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterInventoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterInstanceIdMeta =
      const VerificationMeta('characterInstanceId');
  @override
  late final GeneratedColumn<String> characterInstanceId =
      GeneratedColumn<String>(
        'character_instance_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES character_instances (id)',
        ),
      );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES items (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isEquippedMeta = const VerificationMeta(
    'isEquipped',
  );
  @override
  late final GeneratedColumn<bool> isEquipped = GeneratedColumn<bool>(
    'is_equipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_equipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isAttunedMeta = const VerificationMeta(
    'isAttuned',
  );
  @override
  late final GeneratedColumn<bool> isAttuned = GeneratedColumn<bool>(
    'is_attuned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_attuned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterInstanceId,
    itemId,
    quantity,
    isEquipped,
    isAttuned,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_inventory';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterInventoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_instance_id')) {
      context.handle(
        _characterInstanceIdMeta,
        characterInstanceId.isAcceptableOrUnknown(
          data['character_instance_id']!,
          _characterInstanceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterInstanceIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('is_equipped')) {
      context.handle(
        _isEquippedMeta,
        isEquipped.isAcceptableOrUnknown(data['is_equipped']!, _isEquippedMeta),
      );
    }
    if (data.containsKey('is_attuned')) {
      context.handle(
        _isAttunedMeta,
        isAttuned.isAcceptableOrUnknown(data['is_attuned']!, _isAttunedMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterInventoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterInventoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      characterInstanceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_instance_id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      isEquipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_equipped'],
      )!,
      isAttuned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_attuned'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CharacterInventoryTable createAlias(String alias) {
    return $CharacterInventoryTable(attachedDatabase, alias);
  }
}

class CharacterInventoryRow extends DataClass
    implements Insertable<CharacterInventoryRow> {
  final String id;
  final String characterInstanceId;
  final String itemId;
  final int quantity;
  final bool isEquipped;
  final bool isAttuned;
  final String? notes;
  const CharacterInventoryRow({
    required this.id,
    required this.characterInstanceId,
    required this.itemId,
    required this.quantity,
    required this.isEquipped,
    required this.isAttuned,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_instance_id'] = Variable<String>(characterInstanceId);
    map['item_id'] = Variable<String>(itemId);
    map['quantity'] = Variable<int>(quantity);
    map['is_equipped'] = Variable<bool>(isEquipped);
    map['is_attuned'] = Variable<bool>(isAttuned);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CharacterInventoryCompanion toCompanion(bool nullToAbsent) {
    return CharacterInventoryCompanion(
      id: Value(id),
      characterInstanceId: Value(characterInstanceId),
      itemId: Value(itemId),
      quantity: Value(quantity),
      isEquipped: Value(isEquipped),
      isAttuned: Value(isAttuned),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CharacterInventoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterInventoryRow(
      id: serializer.fromJson<String>(json['id']),
      characterInstanceId: serializer.fromJson<String>(
        json['characterInstanceId'],
      ),
      itemId: serializer.fromJson<String>(json['itemId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      isEquipped: serializer.fromJson<bool>(json['isEquipped']),
      isAttuned: serializer.fromJson<bool>(json['isAttuned']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterInstanceId': serializer.toJson<String>(characterInstanceId),
      'itemId': serializer.toJson<String>(itemId),
      'quantity': serializer.toJson<int>(quantity),
      'isEquipped': serializer.toJson<bool>(isEquipped),
      'isAttuned': serializer.toJson<bool>(isAttuned),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CharacterInventoryRow copyWith({
    String? id,
    String? characterInstanceId,
    String? itemId,
    int? quantity,
    bool? isEquipped,
    bool? isAttuned,
    Value<String?> notes = const Value.absent(),
  }) => CharacterInventoryRow(
    id: id ?? this.id,
    characterInstanceId: characterInstanceId ?? this.characterInstanceId,
    itemId: itemId ?? this.itemId,
    quantity: quantity ?? this.quantity,
    isEquipped: isEquipped ?? this.isEquipped,
    isAttuned: isAttuned ?? this.isAttuned,
    notes: notes.present ? notes.value : this.notes,
  );
  CharacterInventoryRow copyWithCompanion(CharacterInventoryCompanion data) {
    return CharacterInventoryRow(
      id: data.id.present ? data.id.value : this.id,
      characterInstanceId: data.characterInstanceId.present
          ? data.characterInstanceId.value
          : this.characterInstanceId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      isEquipped: data.isEquipped.present
          ? data.isEquipped.value
          : this.isEquipped,
      isAttuned: data.isAttuned.present ? data.isAttuned.value : this.isAttuned,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterInventoryRow(')
          ..write('id: $id, ')
          ..write('characterInstanceId: $characterInstanceId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('isEquipped: $isEquipped, ')
          ..write('isAttuned: $isAttuned, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterInstanceId,
    itemId,
    quantity,
    isEquipped,
    isAttuned,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterInventoryRow &&
          other.id == this.id &&
          other.characterInstanceId == this.characterInstanceId &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.isEquipped == this.isEquipped &&
          other.isAttuned == this.isAttuned &&
          other.notes == this.notes);
}

class CharacterInventoryCompanion
    extends UpdateCompanion<CharacterInventoryRow> {
  final Value<String> id;
  final Value<String> characterInstanceId;
  final Value<String> itemId;
  final Value<int> quantity;
  final Value<bool> isEquipped;
  final Value<bool> isAttuned;
  final Value<String?> notes;
  final Value<int> rowid;
  const CharacterInventoryCompanion({
    this.id = const Value.absent(),
    this.characterInstanceId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.isEquipped = const Value.absent(),
    this.isAttuned = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterInventoryCompanion.insert({
    required String id,
    required String characterInstanceId,
    required String itemId,
    this.quantity = const Value.absent(),
    this.isEquipped = const Value.absent(),
    this.isAttuned = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       characterInstanceId = Value(characterInstanceId),
       itemId = Value(itemId);
  static Insertable<CharacterInventoryRow> custom({
    Expression<String>? id,
    Expression<String>? characterInstanceId,
    Expression<String>? itemId,
    Expression<int>? quantity,
    Expression<bool>? isEquipped,
    Expression<bool>? isAttuned,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterInstanceId != null)
        'character_instance_id': characterInstanceId,
      if (itemId != null) 'item_id': itemId,
      if (quantity != null) 'quantity': quantity,
      if (isEquipped != null) 'is_equipped': isEquipped,
      if (isAttuned != null) 'is_attuned': isAttuned,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterInventoryCompanion copyWith({
    Value<String>? id,
    Value<String>? characterInstanceId,
    Value<String>? itemId,
    Value<int>? quantity,
    Value<bool>? isEquipped,
    Value<bool>? isAttuned,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return CharacterInventoryCompanion(
      id: id ?? this.id,
      characterInstanceId: characterInstanceId ?? this.characterInstanceId,
      itemId: itemId ?? this.itemId,
      quantity: quantity ?? this.quantity,
      isEquipped: isEquipped ?? this.isEquipped,
      isAttuned: isAttuned ?? this.isAttuned,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterInstanceId.present) {
      map['character_instance_id'] = Variable<String>(
        characterInstanceId.value,
      );
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (isEquipped.present) {
      map['is_equipped'] = Variable<bool>(isEquipped.value);
    }
    if (isAttuned.present) {
      map['is_attuned'] = Variable<bool>(isAttuned.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterInventoryCompanion(')
          ..write('id: $id, ')
          ..write('characterInstanceId: $characterInstanceId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('isEquipped: $isEquipped, ')
          ..write('isAttuned: $isAttuned, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GeneratedCardsTable extends GeneratedCards
    with TableInfo<$GeneratedCardsTable, GeneratedCardRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeneratedCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardTypeMeta = const VerificationMeta(
    'cardType',
  );
  @override
  late final GeneratedColumn<String> cardType = GeneratedColumn<String>(
    'card_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<String> refId = GeneratedColumn<String>(
    'ref_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateVersionMeta = const VerificationMeta(
    'templateVersion',
  );
  @override
  late final GeneratedColumn<String> templateVersion = GeneratedColumn<String>(
    'template_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pdfPathMeta = const VerificationMeta(
    'pdfPath',
  );
  @override
  late final GeneratedColumn<String> pdfPath = GeneratedColumn<String>(
    'pdf_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cardType,
    refId,
    templateVersion,
    pdfPath,
    imagePath,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'generated_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeneratedCardRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('card_type')) {
      context.handle(
        _cardTypeMeta,
        cardType.isAcceptableOrUnknown(data['card_type']!, _cardTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_cardTypeMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('template_version')) {
      context.handle(
        _templateVersionMeta,
        templateVersion.isAcceptableOrUnknown(
          data['template_version']!,
          _templateVersionMeta,
        ),
      );
    }
    if (data.containsKey('pdf_path')) {
      context.handle(
        _pdfPathMeta,
        pdfPath.isAcceptableOrUnknown(data['pdf_path']!, _pdfPathMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeneratedCardRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeneratedCardRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cardType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_type'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_id'],
      )!,
      templateVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_version'],
      ),
      pdfPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pdf_path'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GeneratedCardsTable createAlias(String alias) {
    return $GeneratedCardsTable(attachedDatabase, alias);
  }
}

class GeneratedCardRow extends DataClass
    implements Insertable<GeneratedCardRow> {
  final String id;

  /// 'spell' | 'item' — see [CardType].
  final String cardType;

  /// id of the row in the `spells` or `items` table this card renders.
  final String refId;

  /// Bumped whenever the visual template/design changes, so cards cached
  /// under an older template can be detected and regenerated on demand.
  final String? templateVersion;
  final String? pdfPath;
  final String? imagePath;
  final DateTime createdAt;
  const GeneratedCardRow({
    required this.id,
    required this.cardType,
    required this.refId,
    this.templateVersion,
    this.pdfPath,
    this.imagePath,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['card_type'] = Variable<String>(cardType);
    map['ref_id'] = Variable<String>(refId);
    if (!nullToAbsent || templateVersion != null) {
      map['template_version'] = Variable<String>(templateVersion);
    }
    if (!nullToAbsent || pdfPath != null) {
      map['pdf_path'] = Variable<String>(pdfPath);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GeneratedCardsCompanion toCompanion(bool nullToAbsent) {
    return GeneratedCardsCompanion(
      id: Value(id),
      cardType: Value(cardType),
      refId: Value(refId),
      templateVersion: templateVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(templateVersion),
      pdfPath: pdfPath == null && nullToAbsent
          ? const Value.absent()
          : Value(pdfPath),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
    );
  }

  factory GeneratedCardRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeneratedCardRow(
      id: serializer.fromJson<String>(json['id']),
      cardType: serializer.fromJson<String>(json['cardType']),
      refId: serializer.fromJson<String>(json['refId']),
      templateVersion: serializer.fromJson<String?>(json['templateVersion']),
      pdfPath: serializer.fromJson<String?>(json['pdfPath']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cardType': serializer.toJson<String>(cardType),
      'refId': serializer.toJson<String>(refId),
      'templateVersion': serializer.toJson<String?>(templateVersion),
      'pdfPath': serializer.toJson<String?>(pdfPath),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GeneratedCardRow copyWith({
    String? id,
    String? cardType,
    String? refId,
    Value<String?> templateVersion = const Value.absent(),
    Value<String?> pdfPath = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdAt,
  }) => GeneratedCardRow(
    id: id ?? this.id,
    cardType: cardType ?? this.cardType,
    refId: refId ?? this.refId,
    templateVersion: templateVersion.present
        ? templateVersion.value
        : this.templateVersion,
    pdfPath: pdfPath.present ? pdfPath.value : this.pdfPath,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdAt: createdAt ?? this.createdAt,
  );
  GeneratedCardRow copyWithCompanion(GeneratedCardsCompanion data) {
    return GeneratedCardRow(
      id: data.id.present ? data.id.value : this.id,
      cardType: data.cardType.present ? data.cardType.value : this.cardType,
      refId: data.refId.present ? data.refId.value : this.refId,
      templateVersion: data.templateVersion.present
          ? data.templateVersion.value
          : this.templateVersion,
      pdfPath: data.pdfPath.present ? data.pdfPath.value : this.pdfPath,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedCardRow(')
          ..write('id: $id, ')
          ..write('cardType: $cardType, ')
          ..write('refId: $refId, ')
          ..write('templateVersion: $templateVersion, ')
          ..write('pdfPath: $pdfPath, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cardType,
    refId,
    templateVersion,
    pdfPath,
    imagePath,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeneratedCardRow &&
          other.id == this.id &&
          other.cardType == this.cardType &&
          other.refId == this.refId &&
          other.templateVersion == this.templateVersion &&
          other.pdfPath == this.pdfPath &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt);
}

class GeneratedCardsCompanion extends UpdateCompanion<GeneratedCardRow> {
  final Value<String> id;
  final Value<String> cardType;
  final Value<String> refId;
  final Value<String?> templateVersion;
  final Value<String?> pdfPath;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const GeneratedCardsCompanion({
    this.id = const Value.absent(),
    this.cardType = const Value.absent(),
    this.refId = const Value.absent(),
    this.templateVersion = const Value.absent(),
    this.pdfPath = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeneratedCardsCompanion.insert({
    required String id,
    required String cardType,
    required String refId,
    this.templateVersion = const Value.absent(),
    this.pdfPath = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cardType = Value(cardType),
       refId = Value(refId);
  static Insertable<GeneratedCardRow> custom({
    Expression<String>? id,
    Expression<String>? cardType,
    Expression<String>? refId,
    Expression<String>? templateVersion,
    Expression<String>? pdfPath,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardType != null) 'card_type': cardType,
      if (refId != null) 'ref_id': refId,
      if (templateVersion != null) 'template_version': templateVersion,
      if (pdfPath != null) 'pdf_path': pdfPath,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeneratedCardsCompanion copyWith({
    Value<String>? id,
    Value<String>? cardType,
    Value<String>? refId,
    Value<String?>? templateVersion,
    Value<String?>? pdfPath,
    Value<String?>? imagePath,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return GeneratedCardsCompanion(
      id: id ?? this.id,
      cardType: cardType ?? this.cardType,
      refId: refId ?? this.refId,
      templateVersion: templateVersion ?? this.templateVersion,
      pdfPath: pdfPath ?? this.pdfPath,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardType.present) {
      map['card_type'] = Variable<String>(cardType.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<String>(refId.value);
    }
    if (templateVersion.present) {
      map['template_version'] = Variable<String>(templateVersion.value);
    }
    if (pdfPath.present) {
      map['pdf_path'] = Variable<String>(pdfPath.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedCardsCompanion(')
          ..write('id: $id, ')
          ..write('cardType: $cardType, ')
          ..write('refId: $refId, ')
          ..write('templateVersion: $templateVersion, ')
          ..write('pdfPath: $pdfPath, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterBuildNotesTable extends CharacterBuildNotes
    with TableInfo<$CharacterBuildNotesTable, CharacterBuildNoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterBuildNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterBaseIdMeta = const VerificationMeta(
    'characterBaseId',
  );
  @override
  late final GeneratedColumn<String> characterBaseId = GeneratedColumn<String>(
    'character_base_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES character_bases (id)',
    ),
  );
  static const VerificationMeta _conceptMeta = const VerificationMeta(
    'concept',
  );
  @override
  late final GeneratedColumn<String> concept = GeneratedColumn<String>(
    'concept',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _buildPlanJsonMeta = const VerificationMeta(
    'buildPlanJson',
  );
  @override
  late final GeneratedColumn<String> buildPlanJson = GeneratedColumn<String>(
    'build_plan_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelingNotesMeta = const VerificationMeta(
    'levelingNotes',
  );
  @override
  late final GeneratedColumn<String> levelingNotes = GeneratedColumn<String>(
    'leveling_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterBaseId,
    concept,
    buildPlanJson,
    levelingNotes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_build_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterBuildNoteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_base_id')) {
      context.handle(
        _characterBaseIdMeta,
        characterBaseId.isAcceptableOrUnknown(
          data['character_base_id']!,
          _characterBaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterBaseIdMeta);
    }
    if (data.containsKey('concept')) {
      context.handle(
        _conceptMeta,
        concept.isAcceptableOrUnknown(data['concept']!, _conceptMeta),
      );
    }
    if (data.containsKey('build_plan_json')) {
      context.handle(
        _buildPlanJsonMeta,
        buildPlanJson.isAcceptableOrUnknown(
          data['build_plan_json']!,
          _buildPlanJsonMeta,
        ),
      );
    }
    if (data.containsKey('leveling_notes')) {
      context.handle(
        _levelingNotesMeta,
        levelingNotes.isAcceptableOrUnknown(
          data['leveling_notes']!,
          _levelingNotesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterBuildNoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterBuildNoteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      characterBaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_base_id'],
      )!,
      concept: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept'],
      ),
      buildPlanJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}build_plan_json'],
      ),
      levelingNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}leveling_notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CharacterBuildNotesTable createAlias(String alias) {
    return $CharacterBuildNotesTable(attachedDatabase, alias);
  }
}

class CharacterBuildNoteRow extends DataClass
    implements Insertable<CharacterBuildNoteRow> {
  final String id;
  final String characterBaseId;

  /// The original free-form concept prompt (e.g. "un personaggio anime").
  final String? concept;

  /// Structured level-by-level plan produced by the AI assistant.
  final String? buildPlanJson;

  /// Freeform persistent notes the player/AI keep appending to as the
  /// character levels up.
  final String? levelingNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CharacterBuildNoteRow({
    required this.id,
    required this.characterBaseId,
    this.concept,
    this.buildPlanJson,
    this.levelingNotes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_base_id'] = Variable<String>(characterBaseId);
    if (!nullToAbsent || concept != null) {
      map['concept'] = Variable<String>(concept);
    }
    if (!nullToAbsent || buildPlanJson != null) {
      map['build_plan_json'] = Variable<String>(buildPlanJson);
    }
    if (!nullToAbsent || levelingNotes != null) {
      map['leveling_notes'] = Variable<String>(levelingNotes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CharacterBuildNotesCompanion toCompanion(bool nullToAbsent) {
    return CharacterBuildNotesCompanion(
      id: Value(id),
      characterBaseId: Value(characterBaseId),
      concept: concept == null && nullToAbsent
          ? const Value.absent()
          : Value(concept),
      buildPlanJson: buildPlanJson == null && nullToAbsent
          ? const Value.absent()
          : Value(buildPlanJson),
      levelingNotes: levelingNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(levelingNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CharacterBuildNoteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterBuildNoteRow(
      id: serializer.fromJson<String>(json['id']),
      characterBaseId: serializer.fromJson<String>(json['characterBaseId']),
      concept: serializer.fromJson<String?>(json['concept']),
      buildPlanJson: serializer.fromJson<String?>(json['buildPlanJson']),
      levelingNotes: serializer.fromJson<String?>(json['levelingNotes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterBaseId': serializer.toJson<String>(characterBaseId),
      'concept': serializer.toJson<String?>(concept),
      'buildPlanJson': serializer.toJson<String?>(buildPlanJson),
      'levelingNotes': serializer.toJson<String?>(levelingNotes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CharacterBuildNoteRow copyWith({
    String? id,
    String? characterBaseId,
    Value<String?> concept = const Value.absent(),
    Value<String?> buildPlanJson = const Value.absent(),
    Value<String?> levelingNotes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CharacterBuildNoteRow(
    id: id ?? this.id,
    characterBaseId: characterBaseId ?? this.characterBaseId,
    concept: concept.present ? concept.value : this.concept,
    buildPlanJson: buildPlanJson.present
        ? buildPlanJson.value
        : this.buildPlanJson,
    levelingNotes: levelingNotes.present
        ? levelingNotes.value
        : this.levelingNotes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CharacterBuildNoteRow copyWithCompanion(CharacterBuildNotesCompanion data) {
    return CharacterBuildNoteRow(
      id: data.id.present ? data.id.value : this.id,
      characterBaseId: data.characterBaseId.present
          ? data.characterBaseId.value
          : this.characterBaseId,
      concept: data.concept.present ? data.concept.value : this.concept,
      buildPlanJson: data.buildPlanJson.present
          ? data.buildPlanJson.value
          : this.buildPlanJson,
      levelingNotes: data.levelingNotes.present
          ? data.levelingNotes.value
          : this.levelingNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterBuildNoteRow(')
          ..write('id: $id, ')
          ..write('characterBaseId: $characterBaseId, ')
          ..write('concept: $concept, ')
          ..write('buildPlanJson: $buildPlanJson, ')
          ..write('levelingNotes: $levelingNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterBaseId,
    concept,
    buildPlanJson,
    levelingNotes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterBuildNoteRow &&
          other.id == this.id &&
          other.characterBaseId == this.characterBaseId &&
          other.concept == this.concept &&
          other.buildPlanJson == this.buildPlanJson &&
          other.levelingNotes == this.levelingNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CharacterBuildNotesCompanion
    extends UpdateCompanion<CharacterBuildNoteRow> {
  final Value<String> id;
  final Value<String> characterBaseId;
  final Value<String?> concept;
  final Value<String?> buildPlanJson;
  final Value<String?> levelingNotes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CharacterBuildNotesCompanion({
    this.id = const Value.absent(),
    this.characterBaseId = const Value.absent(),
    this.concept = const Value.absent(),
    this.buildPlanJson = const Value.absent(),
    this.levelingNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterBuildNotesCompanion.insert({
    required String id,
    required String characterBaseId,
    this.concept = const Value.absent(),
    this.buildPlanJson = const Value.absent(),
    this.levelingNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       characterBaseId = Value(characterBaseId);
  static Insertable<CharacterBuildNoteRow> custom({
    Expression<String>? id,
    Expression<String>? characterBaseId,
    Expression<String>? concept,
    Expression<String>? buildPlanJson,
    Expression<String>? levelingNotes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterBaseId != null) 'character_base_id': characterBaseId,
      if (concept != null) 'concept': concept,
      if (buildPlanJson != null) 'build_plan_json': buildPlanJson,
      if (levelingNotes != null) 'leveling_notes': levelingNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterBuildNotesCompanion copyWith({
    Value<String>? id,
    Value<String>? characterBaseId,
    Value<String?>? concept,
    Value<String?>? buildPlanJson,
    Value<String?>? levelingNotes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CharacterBuildNotesCompanion(
      id: id ?? this.id,
      characterBaseId: characterBaseId ?? this.characterBaseId,
      concept: concept ?? this.concept,
      buildPlanJson: buildPlanJson ?? this.buildPlanJson,
      levelingNotes: levelingNotes ?? this.levelingNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterBaseId.present) {
      map['character_base_id'] = Variable<String>(characterBaseId.value);
    }
    if (concept.present) {
      map['concept'] = Variable<String>(concept.value);
    }
    if (buildPlanJson.present) {
      map['build_plan_json'] = Variable<String>(buildPlanJson.value);
    }
    if (levelingNotes.present) {
      map['leveling_notes'] = Variable<String>(levelingNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterBuildNotesCompanion(')
          ..write('id: $id, ')
          ..write('characterBaseId: $characterBaseId, ')
          ..write('concept: $concept, ')
          ..write('buildPlanJson: $buildPlanJson, ')
          ..write('levelingNotes: $levelingNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ClassesTable classes = $ClassesTable(this);
  late final $RacesTable races = $RacesTable(this);
  late final $SpellsTable spells = $SpellsTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $CharacterBasesTable characterBases = $CharacterBasesTable(this);
  late final $CharacterInstancesTable characterInstances =
      $CharacterInstancesTable(this);
  late final $CharacterSpellsTable characterSpells = $CharacterSpellsTable(
    this,
  );
  late final $CharacterInventoryTable characterInventory =
      $CharacterInventoryTable(this);
  late final $GeneratedCardsTable generatedCards = $GeneratedCardsTable(this);
  late final $CharacterBuildNotesTable characterBuildNotes =
      $CharacterBuildNotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    classes,
    races,
    spells,
    items,
    characterBases,
    characterInstances,
    characterSpells,
    characterInventory,
    generatedCards,
    characterBuildNotes,
  ];
}

typedef $$ClassesTableCreateCompanionBuilder = ClassesCompanion Function({
  required String id,
  required String name,
  Value<String> source,
  required int hitDie,
  Value<String?> description,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$ClassesTableUpdateCompanionBuilder = ClassesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> source,
  Value<int> hitDie,
  Value<String?> description,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$ClassesTableReferences
    extends BaseReferences<_$AppDatabase, $ClassesTable, ClassRow> {
  $$ClassesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CharacterBasesTable, List<CharacterBaseRow>>
  _characterBasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterBases,
    aliasName: 'classes__id__character_bases__starting_class_id',
  );

  $$CharacterBasesTableProcessedTableManager get characterBasesRefs {
    final manager = $$CharacterBasesTableTableManager($_db, $_db.characterBases)
        .filter(
          (f) => f.startingClassId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_characterBasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClassesTableFilterComposer
    extends Composer<_$AppDatabase, $ClassesTable> {
  $$ClassesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hitDie => $composableBuilder(
    column: $table.hitDie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterBasesRefs(
    Expression<bool> Function($$CharacterBasesTableFilterComposer f) f,
  ) {
    final $$CharacterBasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.startingClassId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableFilterComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClassesTableOrderingComposer
    extends Composer<_$AppDatabase, $ClassesTable> {
  $$ClassesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hitDie => $composableBuilder(
    column: $table.hitDie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClassesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClassesTable> {
  $$ClassesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get hitDie =>
      $composableBuilder(column: $table.hitDie, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> characterBasesRefs<T extends Object>(
    Expression<T> Function($$CharacterBasesTableAnnotationComposer a) f,
  ) {
    final $$CharacterBasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.startingClassId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableAnnotationComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClassesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClassesTable,
          ClassRow,
          $$ClassesTableFilterComposer,
          $$ClassesTableOrderingComposer,
          $$ClassesTableAnnotationComposer,
          $$ClassesTableCreateCompanionBuilder,
          $$ClassesTableUpdateCompanionBuilder,
          (ClassRow, $$ClassesTableReferences),
          ClassRow,
          PrefetchHooks Function({bool characterBasesRefs})
        > {
  $$ClassesTableTableManager(_$AppDatabase db, $ClassesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClassesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClassesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClassesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> hitDie = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClassesCompanion(
                id: id,
                name: name,
                source: source,
                hitDie: hitDie,
                description: description,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> source = const Value.absent(),
                required int hitDie,
                Value<String?> description = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClassesCompanion.insert(
                id: id,
                name: name,
                source: source,
                hitDie: hitDie,
                description: description,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClassesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterBasesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterBasesRefs) db.characterBases,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterBasesRefs)
                    await $_getPrefetchedData<
                      ClassRow,
                      $ClassesTable,
                      CharacterBaseRow
                    >(
                      currentTable: table,
                      referencedTable: $$ClassesTableReferences
                          ._characterBasesRefsTable(db),
                      managerFromTypedResult: (p0) => $$ClassesTableReferences(
                        db,
                        table,
                        p0,
                      ).characterBasesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.startingClassId == item.id,
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

typedef $$ClassesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClassesTable,
      ClassRow,
      $$ClassesTableFilterComposer,
      $$ClassesTableOrderingComposer,
      $$ClassesTableAnnotationComposer,
      $$ClassesTableCreateCompanionBuilder,
      $$ClassesTableUpdateCompanionBuilder,
      (ClassRow, $$ClassesTableReferences),
      ClassRow,
      PrefetchHooks Function({bool characterBasesRefs})
    >;
typedef $$RacesTableCreateCompanionBuilder = RacesCompanion Function({
  required String id,
  required String name,
  Value<String> source,
  Value<String?> description,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$RacesTableUpdateCompanionBuilder = RacesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> source,
  Value<String?> description,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$RacesTableReferences
    extends BaseReferences<_$AppDatabase, $RacesTable, RaceRow> {
  $$RacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CharacterBasesTable, List<CharacterBaseRow>>
  _characterBasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterBases,
    aliasName: 'races__id__character_bases__race_id',
  );

  $$CharacterBasesTableProcessedTableManager get characterBasesRefs {
    final manager = $$CharacterBasesTableTableManager(
      $_db,
      $_db.characterBases,
    ).filter((f) => f.raceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_characterBasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RacesTableFilterComposer extends Composer<_$AppDatabase, $RacesTable> {
  $$RacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterBasesRefs(
    Expression<bool> Function($$CharacterBasesTableFilterComposer f) f,
  ) {
    final $$CharacterBasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.raceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableFilterComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RacesTableOrderingComposer
    extends Composer<_$AppDatabase, $RacesTable> {
  $$RacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RacesTable> {
  $$RacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> characterBasesRefs<T extends Object>(
    Expression<T> Function($$CharacterBasesTableAnnotationComposer a) f,
  ) {
    final $$CharacterBasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.raceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableAnnotationComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RacesTable,
          RaceRow,
          $$RacesTableFilterComposer,
          $$RacesTableOrderingComposer,
          $$RacesTableAnnotationComposer,
          $$RacesTableCreateCompanionBuilder,
          $$RacesTableUpdateCompanionBuilder,
          (RaceRow, $$RacesTableReferences),
          RaceRow,
          PrefetchHooks Function({bool characterBasesRefs})
        > {
  $$RacesTableTableManager(_$AppDatabase db, $RacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RacesCompanion(
                id: id,
                name: name,
                source: source,
                description: description,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> source = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RacesCompanion.insert(
                id: id,
                name: name,
                source: source,
                description: description,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RacesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({characterBasesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterBasesRefs) db.characterBases,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterBasesRefs)
                    await $_getPrefetchedData<
                      RaceRow,
                      $RacesTable,
                      CharacterBaseRow
                    >(
                      currentTable: table,
                      referencedTable: $$RacesTableReferences
                          ._characterBasesRefsTable(db),
                      managerFromTypedResult: (p0) => $$RacesTableReferences(
                        db,
                        table,
                        p0,
                      ).characterBasesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.raceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RacesTable,
      RaceRow,
      $$RacesTableFilterComposer,
      $$RacesTableOrderingComposer,
      $$RacesTableAnnotationComposer,
      $$RacesTableCreateCompanionBuilder,
      $$RacesTableUpdateCompanionBuilder,
      (RaceRow, $$RacesTableReferences),
      RaceRow,
      PrefetchHooks Function({bool characterBasesRefs})
    >;
typedef $$SpellsTableCreateCompanionBuilder = SpellsCompanion Function({
  required String id,
  required String name,
  Value<String> source,
  required int level,
  required String school,
  Value<String?> castingTime,
  Value<String?> range,
  Value<String?> duration,
  Value<bool> concentration,
  Value<bool> ritual,
  Value<String?> description,
  Value<String?> classesJson,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$SpellsTableUpdateCompanionBuilder = SpellsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> source,
  Value<int> level,
  Value<String> school,
  Value<String?> castingTime,
  Value<String?> range,
  Value<String?> duration,
  Value<bool> concentration,
  Value<bool> ritual,
  Value<String?> description,
  Value<String?> classesJson,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$SpellsTableReferences
    extends BaseReferences<_$AppDatabase, $SpellsTable, SpellRow> {
  $$SpellsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CharacterSpellsTable, List<CharacterSpellRow>>
  _characterSpellsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterSpells,
    aliasName: 'spells__id__character_spells__spell_id',
  );

  $$CharacterSpellsTableProcessedTableManager get characterSpellsRefs {
    final manager = $$CharacterSpellsTableTableManager(
      $_db,
      $_db.characterSpells,
    ).filter((f) => f.spellId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterSpellsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpellsTableFilterComposer
    extends Composer<_$AppDatabase, $SpellsTable> {
  $$SpellsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get school => $composableBuilder(
    column: $table.school,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get castingTime => $composableBuilder(
    column: $table.castingTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get range => $composableBuilder(
    column: $table.range,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get concentration => $composableBuilder(
    column: $table.concentration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get ritual => $composableBuilder(
    column: $table.ritual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classesJson => $composableBuilder(
    column: $table.classesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterSpellsRefs(
    Expression<bool> Function($$CharacterSpellsTableFilterComposer f) f,
  ) {
    final $$CharacterSpellsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterSpells,
      getReferencedColumn: (t) => t.spellId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterSpellsTableFilterComposer(
            $db: $db,
            $table: $db.characterSpells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpellsTableOrderingComposer
    extends Composer<_$AppDatabase, $SpellsTable> {
  $$SpellsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get school => $composableBuilder(
    column: $table.school,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get castingTime => $composableBuilder(
    column: $table.castingTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get range => $composableBuilder(
    column: $table.range,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get concentration => $composableBuilder(
    column: $table.concentration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ritual => $composableBuilder(
    column: $table.ritual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classesJson => $composableBuilder(
    column: $table.classesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpellsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpellsTable> {
  $$SpellsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get school =>
      $composableBuilder(column: $table.school, builder: (column) => column);

  GeneratedColumn<String> get castingTime => $composableBuilder(
    column: $table.castingTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get range =>
      $composableBuilder(column: $table.range, builder: (column) => column);

  GeneratedColumn<String> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<bool> get concentration => $composableBuilder(
    column: $table.concentration,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get ritual =>
      $composableBuilder(column: $table.ritual, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get classesJson => $composableBuilder(
    column: $table.classesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> characterSpellsRefs<T extends Object>(
    Expression<T> Function($$CharacterSpellsTableAnnotationComposer a) f,
  ) {
    final $$CharacterSpellsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterSpells,
      getReferencedColumn: (t) => t.spellId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterSpellsTableAnnotationComposer(
            $db: $db,
            $table: $db.characterSpells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpellsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpellsTable,
          SpellRow,
          $$SpellsTableFilterComposer,
          $$SpellsTableOrderingComposer,
          $$SpellsTableAnnotationComposer,
          $$SpellsTableCreateCompanionBuilder,
          $$SpellsTableUpdateCompanionBuilder,
          (SpellRow, $$SpellsTableReferences),
          SpellRow,
          PrefetchHooks Function({bool characterSpellsRefs})
        > {
  $$SpellsTableTableManager(_$AppDatabase db, $SpellsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpellsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpellsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpellsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> school = const Value.absent(),
                Value<String?> castingTime = const Value.absent(),
                Value<String?> range = const Value.absent(),
                Value<String?> duration = const Value.absent(),
                Value<bool> concentration = const Value.absent(),
                Value<bool> ritual = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> classesJson = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpellsCompanion(
                id: id,
                name: name,
                source: source,
                level: level,
                school: school,
                castingTime: castingTime,
                range: range,
                duration: duration,
                concentration: concentration,
                ritual: ritual,
                description: description,
                classesJson: classesJson,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> source = const Value.absent(),
                required int level,
                required String school,
                Value<String?> castingTime = const Value.absent(),
                Value<String?> range = const Value.absent(),
                Value<String?> duration = const Value.absent(),
                Value<bool> concentration = const Value.absent(),
                Value<bool> ritual = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> classesJson = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpellsCompanion.insert(
                id: id,
                name: name,
                source: source,
                level: level,
                school: school,
                castingTime: castingTime,
                range: range,
                duration: duration,
                concentration: concentration,
                ritual: ritual,
                description: description,
                classesJson: classesJson,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SpellsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({characterSpellsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterSpellsRefs) db.characterSpells,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterSpellsRefs)
                    await $_getPrefetchedData<
                      SpellRow,
                      $SpellsTable,
                      CharacterSpellRow
                    >(
                      currentTable: table,
                      referencedTable: $$SpellsTableReferences
                          ._characterSpellsRefsTable(db),
                      managerFromTypedResult: (p0) => $$SpellsTableReferences(
                        db,
                        table,
                        p0,
                      ).characterSpellsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.spellId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SpellsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpellsTable,
      SpellRow,
      $$SpellsTableFilterComposer,
      $$SpellsTableOrderingComposer,
      $$SpellsTableAnnotationComposer,
      $$SpellsTableCreateCompanionBuilder,
      $$SpellsTableUpdateCompanionBuilder,
      (SpellRow, $$SpellsTableReferences),
      SpellRow,
      PrefetchHooks Function({bool characterSpellsRefs})
    >;
typedef $$ItemsTableCreateCompanionBuilder = ItemsCompanion Function({
  required String id,
  required String name,
  Value<String> source,
  required String type,
  Value<String?> rarity,
  Value<String?> description,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$ItemsTableUpdateCompanionBuilder = ItemsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> source,
  Value<String> type,
  Value<String?> rarity,
  Value<String?> description,
  Value<String?> dataJson,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$ItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ItemsTable, ItemRow> {
  $$ItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $CharacterInventoryTable,
    List<CharacterInventoryRow>
  >
  _characterInventoryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterInventory,
        aliasName: 'items__id__character_inventory__item_id',
      );

  $$CharacterInventoryTableProcessedTableManager get characterInventoryRefs {
    final manager = $$CharacterInventoryTableTableManager(
      $_db,
      $_db.characterInventory,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterInventoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterInventoryRefs(
    Expression<bool> Function($$CharacterInventoryTableFilterComposer f) f,
  ) {
    final $$CharacterInventoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterInventory,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInventoryTableFilterComposer(
            $db: $db,
            $table: $db.characterInventory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> characterInventoryRefs<T extends Object>(
    Expression<T> Function($$CharacterInventoryTableAnnotationComposer a) f,
  ) {
    final $$CharacterInventoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterInventory,
          getReferencedColumn: (t) => t.itemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterInventoryTableAnnotationComposer(
                $db: $db,
                $table: $db.characterInventory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          ItemRow,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (ItemRow, $$ItemsTableReferences),
          ItemRow,
          PrefetchHooks Function({bool characterInventoryRefs})
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> rarity = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                name: name,
                source: source,
                type: type,
                rarity: rarity,
                description: description,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> source = const Value.absent(),
                required String type,
                Value<String?> rarity = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                name: name,
                source: source,
                type: type,
                rarity: rarity,
                description: description,
                dataJson: dataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ItemsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({characterInventoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterInventoryRefs) db.characterInventory,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterInventoryRefs)
                    await $_getPrefetchedData<
                      ItemRow,
                      $ItemsTable,
                      CharacterInventoryRow
                    >(
                      currentTable: table,
                      referencedTable: $$ItemsTableReferences
                          ._characterInventoryRefsTable(db),
                      managerFromTypedResult: (p0) => $$ItemsTableReferences(
                        db,
                        table,
                        p0,
                      ).characterInventoryRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.itemId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      ItemRow,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (ItemRow, $$ItemsTableReferences),
      ItemRow,
      PrefetchHooks Function({bool characterInventoryRefs})
    >;
typedef $$CharacterBasesTableCreateCompanionBuilder =
    CharacterBasesCompanion Function({
      required String id,
      required String name,
      Value<String?> raceId,
      Value<String?> startingClassId,
      Value<String?> backstory,
      Value<String?> dataJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$CharacterBasesTableUpdateCompanionBuilder =
    CharacterBasesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> raceId,
      Value<String?> startingClassId,
      Value<String?> backstory,
      Value<String?> dataJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$CharacterBasesTableReferences
    extends
        BaseReferences<_$AppDatabase, $CharacterBasesTable, CharacterBaseRow> {
  $$CharacterBasesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RacesTable _raceIdTable(_$AppDatabase db) =>
      db.races.createAlias('character_bases__race_id__races__id');

  $$RacesTableProcessedTableManager? get raceId {
    final $_column = $_itemColumn<String>('race_id');
    if ($_column == null) return null;
    final manager = $$RacesTableTableManager(
      $_db,
      $_db.races,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_raceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ClassesTable _startingClassIdTable(_$AppDatabase db) =>
      db.classes.createAlias('character_bases__starting_class_id__classes__id');

  $$ClassesTableProcessedTableManager? get startingClassId {
    final $_column = $_itemColumn<String>('starting_class_id');
    if ($_column == null) return null;
    final manager = $$ClassesTableTableManager(
      $_db,
      $_db.classes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_startingClassIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $CharacterInstancesTable,
    List<CharacterInstanceRow>
  >
  _characterInstancesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterInstances,
        aliasName:
            'character_bases__id__character_instances__character_base_id',
      );

  $$CharacterInstancesTableProcessedTableManager get characterInstancesRefs {
    final manager =
        $$CharacterInstancesTableTableManager(
          $_db,
          $_db.characterInstances,
        ).filter(
          (f) => f.characterBaseId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _characterInstancesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CharacterBuildNotesTable,
    List<CharacterBuildNoteRow>
  >
  _characterBuildNotesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterBuildNotes,
        aliasName:
            'character_bases__id__character_build_notes__character_base_id',
      );

  $$CharacterBuildNotesTableProcessedTableManager get characterBuildNotesRefs {
    final manager =
        $$CharacterBuildNotesTableTableManager(
          $_db,
          $_db.characterBuildNotes,
        ).filter(
          (f) => f.characterBaseId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _characterBuildNotesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharacterBasesTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterBasesTable> {
  $$CharacterBasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backstory => $composableBuilder(
    column: $table.backstory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RacesTableFilterComposer get raceId {
    final $$RacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.raceId,
      referencedTable: $db.races,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RacesTableFilterComposer(
            $db: $db,
            $table: $db.races,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassesTableFilterComposer get startingClassId {
    final $$ClassesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.startingClassId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableFilterComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> characterInstancesRefs(
    Expression<bool> Function($$CharacterInstancesTableFilterComposer f) f,
  ) {
    final $$CharacterInstancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterInstances,
      getReferencedColumn: (t) => t.characterBaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInstancesTableFilterComposer(
            $db: $db,
            $table: $db.characterInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterBuildNotesRefs(
    Expression<bool> Function($$CharacterBuildNotesTableFilterComposer f) f,
  ) {
    final $$CharacterBuildNotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterBuildNotes,
      getReferencedColumn: (t) => t.characterBaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBuildNotesTableFilterComposer(
            $db: $db,
            $table: $db.characterBuildNotes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharacterBasesTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterBasesTable> {
  $$CharacterBasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backstory => $composableBuilder(
    column: $table.backstory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataJson => $composableBuilder(
    column: $table.dataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RacesTableOrderingComposer get raceId {
    final $$RacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.raceId,
      referencedTable: $db.races,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RacesTableOrderingComposer(
            $db: $db,
            $table: $db.races,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassesTableOrderingComposer get startingClassId {
    final $$ClassesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.startingClassId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableOrderingComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterBasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterBasesTable> {
  $$CharacterBasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get backstory =>
      $composableBuilder(column: $table.backstory, builder: (column) => column);

  GeneratedColumn<String> get dataJson =>
      $composableBuilder(column: $table.dataJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RacesTableAnnotationComposer get raceId {
    final $$RacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.raceId,
      referencedTable: $db.races,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RacesTableAnnotationComposer(
            $db: $db,
            $table: $db.races,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassesTableAnnotationComposer get startingClassId {
    final $$ClassesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.startingClassId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableAnnotationComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> characterInstancesRefs<T extends Object>(
    Expression<T> Function($$CharacterInstancesTableAnnotationComposer a) f,
  ) {
    final $$CharacterInstancesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterInstances,
          getReferencedColumn: (t) => t.characterBaseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterInstancesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterInstances,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> characterBuildNotesRefs<T extends Object>(
    Expression<T> Function($$CharacterBuildNotesTableAnnotationComposer a) f,
  ) {
    final $$CharacterBuildNotesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterBuildNotes,
          getReferencedColumn: (t) => t.characterBaseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterBuildNotesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterBuildNotes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CharacterBasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterBasesTable,
          CharacterBaseRow,
          $$CharacterBasesTableFilterComposer,
          $$CharacterBasesTableOrderingComposer,
          $$CharacterBasesTableAnnotationComposer,
          $$CharacterBasesTableCreateCompanionBuilder,
          $$CharacterBasesTableUpdateCompanionBuilder,
          (CharacterBaseRow, $$CharacterBasesTableReferences),
          CharacterBaseRow,
          PrefetchHooks Function({
            bool raceId,
            bool startingClassId,
            bool characterInstancesRefs,
            bool characterBuildNotesRefs,
          })
        > {
  $$CharacterBasesTableTableManager(
    _$AppDatabase db,
    $CharacterBasesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterBasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterBasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterBasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> raceId = const Value.absent(),
                Value<String?> startingClassId = const Value.absent(),
                Value<String?> backstory = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterBasesCompanion(
                id: id,
                name: name,
                raceId: raceId,
                startingClassId: startingClassId,
                backstory: backstory,
                dataJson: dataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> raceId = const Value.absent(),
                Value<String?> startingClassId = const Value.absent(),
                Value<String?> backstory = const Value.absent(),
                Value<String?> dataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterBasesCompanion.insert(
                id: id,
                name: name,
                raceId: raceId,
                startingClassId: startingClassId,
                backstory: backstory,
                dataJson: dataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterBasesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                raceId = false,
                startingClassId = false,
                characterInstancesRefs = false,
                characterBuildNotesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (characterInstancesRefs) db.characterInstances,
                    if (characterBuildNotesRefs) db.characterBuildNotes,
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
                        if (raceId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.raceId,
                            referencedTable: $$CharacterBasesTableReferences
                                ._raceIdTable(db),
                            referencedColumn: $$CharacterBasesTableReferences
                                ._raceIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (startingClassId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.startingClassId,
                            referencedTable: $$CharacterBasesTableReferences
                                ._startingClassIdTable(db),
                            referencedColumn: $$CharacterBasesTableReferences
                                ._startingClassIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (characterInstancesRefs)
                        await $_getPrefetchedData<
                          CharacterBaseRow,
                          $CharacterBasesTable,
                          CharacterInstanceRow
                        >(
                          currentTable: table,
                          referencedTable: $$CharacterBasesTableReferences
                              ._characterInstancesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharacterBasesTableReferences(
                                db,
                                table,
                                p0,
                              ).characterInstancesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterBaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (characterBuildNotesRefs)
                        await $_getPrefetchedData<
                          CharacterBaseRow,
                          $CharacterBasesTable,
                          CharacterBuildNoteRow
                        >(
                          currentTable: table,
                          referencedTable: $$CharacterBasesTableReferences
                              ._characterBuildNotesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharacterBasesTableReferences(
                                db,
                                table,
                                p0,
                              ).characterBuildNotesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterBaseId == item.id,
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

typedef $$CharacterBasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterBasesTable,
      CharacterBaseRow,
      $$CharacterBasesTableFilterComposer,
      $$CharacterBasesTableOrderingComposer,
      $$CharacterBasesTableAnnotationComposer,
      $$CharacterBasesTableCreateCompanionBuilder,
      $$CharacterBasesTableUpdateCompanionBuilder,
      (CharacterBaseRow, $$CharacterBasesTableReferences),
      CharacterBaseRow,
      PrefetchHooks Function({
        bool raceId,
        bool startingClassId,
        bool characterInstancesRefs,
        bool characterBuildNotesRefs,
      })
    >;
typedef $$CharacterInstancesTableCreateCompanionBuilder =
    CharacterInstancesCompanion Function({
      required String id,
      required String characterBaseId,
      Value<String?> campaignId,
      Value<String?> campaignName,
      Value<int> level,
      Value<int> currentHp,
      Value<int> maxHp,
      Value<int> temporaryHp,
      Value<int?> armorClass,
      Value<int?> proficiencyBonus,
      Value<String?> spellSlotsJson,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$CharacterInstancesTableUpdateCompanionBuilder =
    CharacterInstancesCompanion Function({
      Value<String> id,
      Value<String> characterBaseId,
      Value<String?> campaignId,
      Value<String?> campaignName,
      Value<int> level,
      Value<int> currentHp,
      Value<int> maxHp,
      Value<int> temporaryHp,
      Value<int?> armorClass,
      Value<int?> proficiencyBonus,
      Value<String?> spellSlotsJson,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$CharacterInstancesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterInstancesTable,
          CharacterInstanceRow
        > {
  $$CharacterInstancesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharacterBasesTable _characterBaseIdTable(_$AppDatabase db) =>
      db.characterBases.createAlias(
        'character_instances__character_base_id__character_bases__id',
      );

  $$CharacterBasesTableProcessedTableManager get characterBaseId {
    final $_column = $_itemColumn<String>('character_base_id')!;

    final manager = $$CharacterBasesTableTableManager(
      $_db,
      $_db.characterBases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterBaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CharacterSpellsTable, List<CharacterSpellRow>>
  _characterSpellsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterSpells,
    aliasName:
        'character_instances__id__character_spells__character_instance_id',
  );

  $$CharacterSpellsTableProcessedTableManager get characterSpellsRefs {
    final manager =
        $$CharacterSpellsTableTableManager($_db, $_db.characterSpells).filter(
          (f) =>
              f.characterInstanceId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _characterSpellsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CharacterInventoryTable,
    List<CharacterInventoryRow>
  >
  _characterInventoryRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.characterInventory,
    aliasName:
        'character_instances__id__character_inventory__character_instance_id',
  );

  $$CharacterInventoryTableProcessedTableManager get characterInventoryRefs {
    final manager =
        $$CharacterInventoryTableTableManager(
          $_db,
          $_db.characterInventory,
        ).filter(
          (f) =>
              f.characterInstanceId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _characterInventoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharacterInstancesTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterInstancesTable> {
  $$CharacterInstancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get campaignId => $composableBuilder(
    column: $table.campaignId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get campaignName => $composableBuilder(
    column: $table.campaignName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentHp => $composableBuilder(
    column: $table.currentHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get temporaryHp => $composableBuilder(
    column: $table.temporaryHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get armorClass => $composableBuilder(
    column: $table.armorClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get proficiencyBonus => $composableBuilder(
    column: $table.proficiencyBonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get spellSlotsJson => $composableBuilder(
    column: $table.spellSlotsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CharacterBasesTableFilterComposer get characterBaseId {
    final $$CharacterBasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterBaseId,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableFilterComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> characterSpellsRefs(
    Expression<bool> Function($$CharacterSpellsTableFilterComposer f) f,
  ) {
    final $$CharacterSpellsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterSpells,
      getReferencedColumn: (t) => t.characterInstanceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterSpellsTableFilterComposer(
            $db: $db,
            $table: $db.characterSpells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterInventoryRefs(
    Expression<bool> Function($$CharacterInventoryTableFilterComposer f) f,
  ) {
    final $$CharacterInventoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterInventory,
      getReferencedColumn: (t) => t.characterInstanceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInventoryTableFilterComposer(
            $db: $db,
            $table: $db.characterInventory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharacterInstancesTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterInstancesTable> {
  $$CharacterInstancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get campaignId => $composableBuilder(
    column: $table.campaignId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get campaignName => $composableBuilder(
    column: $table.campaignName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentHp => $composableBuilder(
    column: $table.currentHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get temporaryHp => $composableBuilder(
    column: $table.temporaryHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get armorClass => $composableBuilder(
    column: $table.armorClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get proficiencyBonus => $composableBuilder(
    column: $table.proficiencyBonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spellSlotsJson => $composableBuilder(
    column: $table.spellSlotsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharacterBasesTableOrderingComposer get characterBaseId {
    final $$CharacterBasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterBaseId,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableOrderingComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterInstancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterInstancesTable> {
  $$CharacterInstancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get campaignId => $composableBuilder(
    column: $table.campaignId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get campaignName => $composableBuilder(
    column: $table.campaignName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get currentHp =>
      $composableBuilder(column: $table.currentHp, builder: (column) => column);

  GeneratedColumn<int> get maxHp =>
      $composableBuilder(column: $table.maxHp, builder: (column) => column);

  GeneratedColumn<int> get temporaryHp => $composableBuilder(
    column: $table.temporaryHp,
    builder: (column) => column,
  );

  GeneratedColumn<int> get armorClass => $composableBuilder(
    column: $table.armorClass,
    builder: (column) => column,
  );

  GeneratedColumn<int> get proficiencyBonus => $composableBuilder(
    column: $table.proficiencyBonus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get spellSlotsJson => $composableBuilder(
    column: $table.spellSlotsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CharacterBasesTableAnnotationComposer get characterBaseId {
    final $$CharacterBasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterBaseId,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableAnnotationComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> characterSpellsRefs<T extends Object>(
    Expression<T> Function($$CharacterSpellsTableAnnotationComposer a) f,
  ) {
    final $$CharacterSpellsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterSpells,
      getReferencedColumn: (t) => t.characterInstanceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterSpellsTableAnnotationComposer(
            $db: $db,
            $table: $db.characterSpells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> characterInventoryRefs<T extends Object>(
    Expression<T> Function($$CharacterInventoryTableAnnotationComposer a) f,
  ) {
    final $$CharacterInventoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterInventory,
          getReferencedColumn: (t) => t.characterInstanceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterInventoryTableAnnotationComposer(
                $db: $db,
                $table: $db.characterInventory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CharacterInstancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterInstancesTable,
          CharacterInstanceRow,
          $$CharacterInstancesTableFilterComposer,
          $$CharacterInstancesTableOrderingComposer,
          $$CharacterInstancesTableAnnotationComposer,
          $$CharacterInstancesTableCreateCompanionBuilder,
          $$CharacterInstancesTableUpdateCompanionBuilder,
          (CharacterInstanceRow, $$CharacterInstancesTableReferences),
          CharacterInstanceRow,
          PrefetchHooks Function({
            bool characterBaseId,
            bool characterSpellsRefs,
            bool characterInventoryRefs,
          })
        > {
  $$CharacterInstancesTableTableManager(
    _$AppDatabase db,
    $CharacterInstancesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterInstancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterInstancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterInstancesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterBaseId = const Value.absent(),
                Value<String?> campaignId = const Value.absent(),
                Value<String?> campaignName = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> currentHp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> temporaryHp = const Value.absent(),
                Value<int?> armorClass = const Value.absent(),
                Value<int?> proficiencyBonus = const Value.absent(),
                Value<String?> spellSlotsJson = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterInstancesCompanion(
                id: id,
                characterBaseId: characterBaseId,
                campaignId: campaignId,
                campaignName: campaignName,
                level: level,
                currentHp: currentHp,
                maxHp: maxHp,
                temporaryHp: temporaryHp,
                armorClass: armorClass,
                proficiencyBonus: proficiencyBonus,
                spellSlotsJson: spellSlotsJson,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String characterBaseId,
                Value<String?> campaignId = const Value.absent(),
                Value<String?> campaignName = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> currentHp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> temporaryHp = const Value.absent(),
                Value<int?> armorClass = const Value.absent(),
                Value<int?> proficiencyBonus = const Value.absent(),
                Value<String?> spellSlotsJson = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterInstancesCompanion.insert(
                id: id,
                characterBaseId: characterBaseId,
                campaignId: campaignId,
                campaignName: campaignName,
                level: level,
                currentHp: currentHp,
                maxHp: maxHp,
                temporaryHp: temporaryHp,
                armorClass: armorClass,
                proficiencyBonus: proficiencyBonus,
                spellSlotsJson: spellSlotsJson,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterInstancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                characterBaseId = false,
                characterSpellsRefs = false,
                characterInventoryRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (characterSpellsRefs) db.characterSpells,
                    if (characterInventoryRefs) db.characterInventory,
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
                        if (characterBaseId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterBaseId,
                            referencedTable: $$CharacterInstancesTableReferences
                                ._characterBaseIdTable(db),
                            referencedColumn:
                                $$CharacterInstancesTableReferences
                                    ._characterBaseIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (characterSpellsRefs)
                        await $_getPrefetchedData<
                          CharacterInstanceRow,
                          $CharacterInstancesTable,
                          CharacterSpellRow
                        >(
                          currentTable: table,
                          referencedTable: $$CharacterInstancesTableReferences
                              ._characterSpellsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharacterInstancesTableReferences(
                                db,
                                table,
                                p0,
                              ).characterSpellsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterInstanceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (characterInventoryRefs)
                        await $_getPrefetchedData<
                          CharacterInstanceRow,
                          $CharacterInstancesTable,
                          CharacterInventoryRow
                        >(
                          currentTable: table,
                          referencedTable: $$CharacterInstancesTableReferences
                              ._characterInventoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharacterInstancesTableReferences(
                                db,
                                table,
                                p0,
                              ).characterInventoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterInstanceId == item.id,
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

typedef $$CharacterInstancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterInstancesTable,
      CharacterInstanceRow,
      $$CharacterInstancesTableFilterComposer,
      $$CharacterInstancesTableOrderingComposer,
      $$CharacterInstancesTableAnnotationComposer,
      $$CharacterInstancesTableCreateCompanionBuilder,
      $$CharacterInstancesTableUpdateCompanionBuilder,
      (CharacterInstanceRow, $$CharacterInstancesTableReferences),
      CharacterInstanceRow,
      PrefetchHooks Function({
        bool characterBaseId,
        bool characterSpellsRefs,
        bool characterInventoryRefs,
      })
    >;
typedef $$CharacterSpellsTableCreateCompanionBuilder =
    CharacterSpellsCompanion Function({
      required String id,
      required String characterInstanceId,
      required String spellId,
      Value<bool> isPrepared,
      Value<bool> isAlwaysPrepared,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$CharacterSpellsTableUpdateCompanionBuilder =
    CharacterSpellsCompanion Function({
      Value<String> id,
      Value<String> characterInstanceId,
      Value<String> spellId,
      Value<bool> isPrepared,
      Value<bool> isAlwaysPrepared,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$CharacterSpellsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterSpellsTable,
          CharacterSpellRow
        > {
  $$CharacterSpellsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharacterInstancesTable _characterInstanceIdTable(_$AppDatabase db) =>
      db.characterInstances.createAlias(
        'character_spells__character_instance_id__character_instances__id',
      );

  $$CharacterInstancesTableProcessedTableManager get characterInstanceId {
    final $_column = $_itemColumn<String>('character_instance_id')!;

    final manager = $$CharacterInstancesTableTableManager(
      $_db,
      $_db.characterInstances,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterInstanceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SpellsTable _spellIdTable(_$AppDatabase db) =>
      db.spells.createAlias('character_spells__spell_id__spells__id');

  $$SpellsTableProcessedTableManager get spellId {
    final $_column = $_itemColumn<String>('spell_id')!;

    final manager = $$SpellsTableTableManager(
      $_db,
      $_db.spells,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spellIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterSpellsTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterSpellsTable> {
  $$CharacterSpellsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrepared => $composableBuilder(
    column: $table.isPrepared,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAlwaysPrepared => $composableBuilder(
    column: $table.isAlwaysPrepared,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$CharacterInstancesTableFilterComposer get characterInstanceId {
    final $$CharacterInstancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterInstanceId,
      referencedTable: $db.characterInstances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInstancesTableFilterComposer(
            $db: $db,
            $table: $db.characterInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpellsTableFilterComposer get spellId {
    final $$SpellsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spellId,
      referencedTable: $db.spells,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpellsTableFilterComposer(
            $db: $db,
            $table: $db.spells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterSpellsTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterSpellsTable> {
  $$CharacterSpellsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrepared => $composableBuilder(
    column: $table.isPrepared,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAlwaysPrepared => $composableBuilder(
    column: $table.isAlwaysPrepared,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharacterInstancesTableOrderingComposer get characterInstanceId {
    final $$CharacterInstancesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterInstanceId,
      referencedTable: $db.characterInstances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInstancesTableOrderingComposer(
            $db: $db,
            $table: $db.characterInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpellsTableOrderingComposer get spellId {
    final $$SpellsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spellId,
      referencedTable: $db.spells,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpellsTableOrderingComposer(
            $db: $db,
            $table: $db.spells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterSpellsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterSpellsTable> {
  $$CharacterSpellsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isPrepared => $composableBuilder(
    column: $table.isPrepared,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAlwaysPrepared => $composableBuilder(
    column: $table.isAlwaysPrepared,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CharacterInstancesTableAnnotationComposer get characterInstanceId {
    final $$CharacterInstancesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.characterInstanceId,
          referencedTable: $db.characterInstances,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterInstancesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterInstances,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$SpellsTableAnnotationComposer get spellId {
    final $$SpellsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spellId,
      referencedTable: $db.spells,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpellsTableAnnotationComposer(
            $db: $db,
            $table: $db.spells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterSpellsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterSpellsTable,
          CharacterSpellRow,
          $$CharacterSpellsTableFilterComposer,
          $$CharacterSpellsTableOrderingComposer,
          $$CharacterSpellsTableAnnotationComposer,
          $$CharacterSpellsTableCreateCompanionBuilder,
          $$CharacterSpellsTableUpdateCompanionBuilder,
          (CharacterSpellRow, $$CharacterSpellsTableReferences),
          CharacterSpellRow,
          PrefetchHooks Function({bool characterInstanceId, bool spellId})
        > {
  $$CharacterSpellsTableTableManager(
    _$AppDatabase db,
    $CharacterSpellsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterSpellsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterSpellsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterSpellsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterInstanceId = const Value.absent(),
                Value<String> spellId = const Value.absent(),
                Value<bool> isPrepared = const Value.absent(),
                Value<bool> isAlwaysPrepared = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterSpellsCompanion(
                id: id,
                characterInstanceId: characterInstanceId,
                spellId: spellId,
                isPrepared: isPrepared,
                isAlwaysPrepared: isAlwaysPrepared,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String characterInstanceId,
                required String spellId,
                Value<bool> isPrepared = const Value.absent(),
                Value<bool> isAlwaysPrepared = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterSpellsCompanion.insert(
                id: id,
                characterInstanceId: characterInstanceId,
                spellId: spellId,
                isPrepared: isPrepared,
                isAlwaysPrepared: isAlwaysPrepared,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterSpellsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({characterInstanceId = false, spellId = false}) {
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
                        if (characterInstanceId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterInstanceId,
                            referencedTable: $$CharacterSpellsTableReferences
                                ._characterInstanceIdTable(db),
                            referencedColumn: $$CharacterSpellsTableReferences
                                ._characterInstanceIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (spellId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.spellId,
                            referencedTable: $$CharacterSpellsTableReferences
                                ._spellIdTable(db),
                            referencedColumn: $$CharacterSpellsTableReferences
                                ._spellIdTable(db)
                                .id,
                          ) as T;
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

typedef $$CharacterSpellsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterSpellsTable,
      CharacterSpellRow,
      $$CharacterSpellsTableFilterComposer,
      $$CharacterSpellsTableOrderingComposer,
      $$CharacterSpellsTableAnnotationComposer,
      $$CharacterSpellsTableCreateCompanionBuilder,
      $$CharacterSpellsTableUpdateCompanionBuilder,
      (CharacterSpellRow, $$CharacterSpellsTableReferences),
      CharacterSpellRow,
      PrefetchHooks Function({bool characterInstanceId, bool spellId})
    >;
typedef $$CharacterInventoryTableCreateCompanionBuilder =
    CharacterInventoryCompanion Function({
      required String id,
      required String characterInstanceId,
      required String itemId,
      Value<int> quantity,
      Value<bool> isEquipped,
      Value<bool> isAttuned,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$CharacterInventoryTableUpdateCompanionBuilder =
    CharacterInventoryCompanion Function({
      Value<String> id,
      Value<String> characterInstanceId,
      Value<String> itemId,
      Value<int> quantity,
      Value<bool> isEquipped,
      Value<bool> isAttuned,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$CharacterInventoryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterInventoryTable,
          CharacterInventoryRow
        > {
  $$CharacterInventoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharacterInstancesTable _characterInstanceIdTable(_$AppDatabase db) =>
      db.characterInstances.createAlias(
        'character_inventory__character_instance_id__character_instances__id',
      );

  $$CharacterInstancesTableProcessedTableManager get characterInstanceId {
    final $_column = $_itemColumn<String>('character_instance_id')!;

    final manager = $$CharacterInstancesTableTableManager(
      $_db,
      $_db.characterInstances,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterInstanceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ItemsTable _itemIdTable(_$AppDatabase db) =>
      db.items.createAlias('character_inventory__item_id__items__id');

  $$ItemsTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<String>('item_id')!;

    final manager = $$ItemsTableTableManager(
      $_db,
      $_db.items,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterInventoryTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterInventoryTable> {
  $$CharacterInventoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAttuned => $composableBuilder(
    column: $table.isAttuned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$CharacterInstancesTableFilterComposer get characterInstanceId {
    final $$CharacterInstancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterInstanceId,
      referencedTable: $db.characterInstances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInstancesTableFilterComposer(
            $db: $db,
            $table: $db.characterInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ItemsTableFilterComposer get itemId {
    final $$ItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableFilterComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterInventoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterInventoryTable> {
  $$CharacterInventoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAttuned => $composableBuilder(
    column: $table.isAttuned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharacterInstancesTableOrderingComposer get characterInstanceId {
    final $$CharacterInstancesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterInstanceId,
      referencedTable: $db.characterInstances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterInstancesTableOrderingComposer(
            $db: $db,
            $table: $db.characterInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ItemsTableOrderingComposer get itemId {
    final $$ItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableOrderingComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterInventoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterInventoryTable> {
  $$CharacterInventoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAttuned =>
      $composableBuilder(column: $table.isAttuned, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CharacterInstancesTableAnnotationComposer get characterInstanceId {
    final $$CharacterInstancesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.characterInstanceId,
          referencedTable: $db.characterInstances,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterInstancesTableAnnotationComposer(
                $db: $db,
                $table: $db.characterInstances,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$ItemsTableAnnotationComposer get itemId {
    final $$ItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterInventoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterInventoryTable,
          CharacterInventoryRow,
          $$CharacterInventoryTableFilterComposer,
          $$CharacterInventoryTableOrderingComposer,
          $$CharacterInventoryTableAnnotationComposer,
          $$CharacterInventoryTableCreateCompanionBuilder,
          $$CharacterInventoryTableUpdateCompanionBuilder,
          (CharacterInventoryRow, $$CharacterInventoryTableReferences),
          CharacterInventoryRow,
          PrefetchHooks Function({bool characterInstanceId, bool itemId})
        > {
  $$CharacterInventoryTableTableManager(
    _$AppDatabase db,
    $CharacterInventoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterInventoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterInventoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterInventoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterInstanceId = const Value.absent(),
                Value<String> itemId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<bool> isEquipped = const Value.absent(),
                Value<bool> isAttuned = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterInventoryCompanion(
                id: id,
                characterInstanceId: characterInstanceId,
                itemId: itemId,
                quantity: quantity,
                isEquipped: isEquipped,
                isAttuned: isAttuned,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String characterInstanceId,
                required String itemId,
                Value<int> quantity = const Value.absent(),
                Value<bool> isEquipped = const Value.absent(),
                Value<bool> isAttuned = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterInventoryCompanion.insert(
                id: id,
                characterInstanceId: characterInstanceId,
                itemId: itemId,
                quantity: quantity,
                isEquipped: isEquipped,
                isAttuned: isAttuned,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterInventoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({characterInstanceId = false, itemId = false}) {
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
                        if (characterInstanceId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.characterInstanceId,
                            referencedTable: $$CharacterInventoryTableReferences
                                ._characterInstanceIdTable(db),
                            referencedColumn:
                                $$CharacterInventoryTableReferences
                                    ._characterInstanceIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (itemId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.itemId,
                            referencedTable: $$CharacterInventoryTableReferences
                                ._itemIdTable(db),
                            referencedColumn:
                                $$CharacterInventoryTableReferences
                                    ._itemIdTable(db)
                                    .id,
                          ) as T;
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

typedef $$CharacterInventoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterInventoryTable,
      CharacterInventoryRow,
      $$CharacterInventoryTableFilterComposer,
      $$CharacterInventoryTableOrderingComposer,
      $$CharacterInventoryTableAnnotationComposer,
      $$CharacterInventoryTableCreateCompanionBuilder,
      $$CharacterInventoryTableUpdateCompanionBuilder,
      (CharacterInventoryRow, $$CharacterInventoryTableReferences),
      CharacterInventoryRow,
      PrefetchHooks Function({bool characterInstanceId, bool itemId})
    >;
typedef $$GeneratedCardsTableCreateCompanionBuilder =
    GeneratedCardsCompanion Function({
      required String id,
      required String cardType,
      required String refId,
      Value<String?> templateVersion,
      Value<String?> pdfPath,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$GeneratedCardsTableUpdateCompanionBuilder =
    GeneratedCardsCompanion Function({
      Value<String> id,
      Value<String> cardType,
      Value<String> refId,
      Value<String?> templateVersion,
      Value<String?> pdfPath,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$GeneratedCardsTableFilterComposer
    extends Composer<_$AppDatabase, $GeneratedCardsTable> {
  $$GeneratedCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardType => $composableBuilder(
    column: $table.cardType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateVersion => $composableBuilder(
    column: $table.templateVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pdfPath => $composableBuilder(
    column: $table.pdfPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GeneratedCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $GeneratedCardsTable> {
  $$GeneratedCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardType => $composableBuilder(
    column: $table.cardType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateVersion => $composableBuilder(
    column: $table.templateVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pdfPath => $composableBuilder(
    column: $table.pdfPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GeneratedCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeneratedCardsTable> {
  $$GeneratedCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cardType =>
      $composableBuilder(column: $table.cardType, builder: (column) => column);

  GeneratedColumn<String> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get templateVersion => $composableBuilder(
    column: $table.templateVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pdfPath =>
      $composableBuilder(column: $table.pdfPath, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$GeneratedCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeneratedCardsTable,
          GeneratedCardRow,
          $$GeneratedCardsTableFilterComposer,
          $$GeneratedCardsTableOrderingComposer,
          $$GeneratedCardsTableAnnotationComposer,
          $$GeneratedCardsTableCreateCompanionBuilder,
          $$GeneratedCardsTableUpdateCompanionBuilder,
          (
            GeneratedCardRow,
            BaseReferences<
              _$AppDatabase,
              $GeneratedCardsTable,
              GeneratedCardRow
            >,
          ),
          GeneratedCardRow,
          PrefetchHooks Function()
        > {
  $$GeneratedCardsTableTableManager(
    _$AppDatabase db,
    $GeneratedCardsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeneratedCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeneratedCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeneratedCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cardType = const Value.absent(),
                Value<String> refId = const Value.absent(),
                Value<String?> templateVersion = const Value.absent(),
                Value<String?> pdfPath = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GeneratedCardsCompanion(
                id: id,
                cardType: cardType,
                refId: refId,
                templateVersion: templateVersion,
                pdfPath: pdfPath,
                imagePath: imagePath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cardType,
                required String refId,
                Value<String?> templateVersion = const Value.absent(),
                Value<String?> pdfPath = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GeneratedCardsCompanion.insert(
                id: id,
                cardType: cardType,
                refId: refId,
                templateVersion: templateVersion,
                pdfPath: pdfPath,
                imagePath: imagePath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GeneratedCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeneratedCardsTable,
      GeneratedCardRow,
      $$GeneratedCardsTableFilterComposer,
      $$GeneratedCardsTableOrderingComposer,
      $$GeneratedCardsTableAnnotationComposer,
      $$GeneratedCardsTableCreateCompanionBuilder,
      $$GeneratedCardsTableUpdateCompanionBuilder,
      (
        GeneratedCardRow,
        BaseReferences<_$AppDatabase, $GeneratedCardsTable, GeneratedCardRow>,
      ),
      GeneratedCardRow,
      PrefetchHooks Function()
    >;
typedef $$CharacterBuildNotesTableCreateCompanionBuilder =
    CharacterBuildNotesCompanion Function({
      required String id,
      required String characterBaseId,
      Value<String?> concept,
      Value<String?> buildPlanJson,
      Value<String?> levelingNotes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$CharacterBuildNotesTableUpdateCompanionBuilder =
    CharacterBuildNotesCompanion Function({
      Value<String> id,
      Value<String> characterBaseId,
      Value<String?> concept,
      Value<String?> buildPlanJson,
      Value<String?> levelingNotes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$CharacterBuildNotesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterBuildNotesTable,
          CharacterBuildNoteRow
        > {
  $$CharacterBuildNotesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharacterBasesTable _characterBaseIdTable(_$AppDatabase db) =>
      db.characterBases.createAlias(
        'character_build_notes__character_base_id__character_bases__id',
      );

  $$CharacterBasesTableProcessedTableManager get characterBaseId {
    final $_column = $_itemColumn<String>('character_base_id')!;

    final manager = $$CharacterBasesTableTableManager(
      $_db,
      $_db.characterBases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterBaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterBuildNotesTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterBuildNotesTable> {
  $$CharacterBuildNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get concept => $composableBuilder(
    column: $table.concept,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buildPlanJson => $composableBuilder(
    column: $table.buildPlanJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get levelingNotes => $composableBuilder(
    column: $table.levelingNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CharacterBasesTableFilterComposer get characterBaseId {
    final $$CharacterBasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterBaseId,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableFilterComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterBuildNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterBuildNotesTable> {
  $$CharacterBuildNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get concept => $composableBuilder(
    column: $table.concept,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buildPlanJson => $composableBuilder(
    column: $table.buildPlanJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get levelingNotes => $composableBuilder(
    column: $table.levelingNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharacterBasesTableOrderingComposer get characterBaseId {
    final $$CharacterBasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterBaseId,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableOrderingComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterBuildNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterBuildNotesTable> {
  $$CharacterBuildNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get concept =>
      $composableBuilder(column: $table.concept, builder: (column) => column);

  GeneratedColumn<String> get buildPlanJson => $composableBuilder(
    column: $table.buildPlanJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get levelingNotes => $composableBuilder(
    column: $table.levelingNotes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CharacterBasesTableAnnotationComposer get characterBaseId {
    final $$CharacterBasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterBaseId,
      referencedTable: $db.characterBases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterBasesTableAnnotationComposer(
            $db: $db,
            $table: $db.characterBases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterBuildNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterBuildNotesTable,
          CharacterBuildNoteRow,
          $$CharacterBuildNotesTableFilterComposer,
          $$CharacterBuildNotesTableOrderingComposer,
          $$CharacterBuildNotesTableAnnotationComposer,
          $$CharacterBuildNotesTableCreateCompanionBuilder,
          $$CharacterBuildNotesTableUpdateCompanionBuilder,
          (CharacterBuildNoteRow, $$CharacterBuildNotesTableReferences),
          CharacterBuildNoteRow,
          PrefetchHooks Function({bool characterBaseId})
        > {
  $$CharacterBuildNotesTableTableManager(
    _$AppDatabase db,
    $CharacterBuildNotesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterBuildNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterBuildNotesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CharacterBuildNotesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterBaseId = const Value.absent(),
                Value<String?> concept = const Value.absent(),
                Value<String?> buildPlanJson = const Value.absent(),
                Value<String?> levelingNotes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterBuildNotesCompanion(
                id: id,
                characterBaseId: characterBaseId,
                concept: concept,
                buildPlanJson: buildPlanJson,
                levelingNotes: levelingNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String characterBaseId,
                Value<String?> concept = const Value.absent(),
                Value<String?> buildPlanJson = const Value.absent(),
                Value<String?> levelingNotes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterBuildNotesCompanion.insert(
                id: id,
                characterBaseId: characterBaseId,
                concept: concept,
                buildPlanJson: buildPlanJson,
                levelingNotes: levelingNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterBuildNotesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterBaseId = false}) {
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
                    if (characterBaseId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.characterBaseId,
                        referencedTable: $$CharacterBuildNotesTableReferences
                            ._characterBaseIdTable(db),
                        referencedColumn: $$CharacterBuildNotesTableReferences
                            ._characterBaseIdTable(db)
                            .id,
                      ) as T;
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

typedef $$CharacterBuildNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterBuildNotesTable,
      CharacterBuildNoteRow,
      $$CharacterBuildNotesTableFilterComposer,
      $$CharacterBuildNotesTableOrderingComposer,
      $$CharacterBuildNotesTableAnnotationComposer,
      $$CharacterBuildNotesTableCreateCompanionBuilder,
      $$CharacterBuildNotesTableUpdateCompanionBuilder,
      (CharacterBuildNoteRow, $$CharacterBuildNotesTableReferences),
      CharacterBuildNoteRow,
      PrefetchHooks Function({bool characterBaseId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClassesTableTableManager get classes =>
      $$ClassesTableTableManager(_db, _db.classes);
  $$RacesTableTableManager get races =>
      $$RacesTableTableManager(_db, _db.races);
  $$SpellsTableTableManager get spells =>
      $$SpellsTableTableManager(_db, _db.spells);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$CharacterBasesTableTableManager get characterBases =>
      $$CharacterBasesTableTableManager(_db, _db.characterBases);
  $$CharacterInstancesTableTableManager get characterInstances =>
      $$CharacterInstancesTableTableManager(_db, _db.characterInstances);
  $$CharacterSpellsTableTableManager get characterSpells =>
      $$CharacterSpellsTableTableManager(_db, _db.characterSpells);
  $$CharacterInventoryTableTableManager get characterInventory =>
      $$CharacterInventoryTableTableManager(_db, _db.characterInventory);
  $$GeneratedCardsTableTableManager get generatedCards =>
      $$GeneratedCardsTableTableManager(_db, _db.generatedCards);
  $$CharacterBuildNotesTableTableManager get characterBuildNotes =>
      $$CharacterBuildNotesTableTableManager(_db, _db.characterBuildNotes);
}
