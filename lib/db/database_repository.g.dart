// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repository.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Interview extends DataClass implements Insertable<Interview> {
  final int? id;
  final String name;
  final String role;
  final String? avatarUrl;
  final String timing;
  final bool isMale;
  Interview(
      {this.id,
      required this.name,
      required this.role,
      this.avatarUrl,
      required this.timing,
      required this.isMale});
  factory Interview.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Interview(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      role: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}role'])!,
      avatarUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar_url']),
      timing: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timing'])!,
      isMale: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_male'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String?>(avatarUrl);
    }
    map['timing'] = Variable<String>(timing);
    map['is_male'] = Variable<bool>(isMale);
    return map;
  }

  InterviewsCompanion toCompanion(bool nullToAbsent) {
    return InterviewsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      role: Value(role),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      timing: Value(timing),
      isMale: Value(isMale),
    );
  }

  factory Interview.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Interview(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
      timing: serializer.fromJson<String>(json['timing']),
      isMale: serializer.fromJson<bool>(json['isMale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
      'timing': serializer.toJson<String>(timing),
      'isMale': serializer.toJson<bool>(isMale),
    };
  }

  Interview copyWith(
          {int? id,
          String? name,
          String? role,
          String? avatarUrl,
          String? timing,
          bool? isMale}) =>
      Interview(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        timing: timing ?? this.timing,
        isMale: isMale ?? this.isMale,
      );
  @override
  String toString() {
    return (StringBuffer('Interview(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('timing: $timing, ')
          ..write('isMale: $isMale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, role, avatarUrl, timing, isMale);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Interview &&
          other.id == this.id &&
          other.name == this.name &&
          other.role == this.role &&
          other.avatarUrl == this.avatarUrl &&
          other.timing == this.timing &&
          other.isMale == this.isMale);
}

class InterviewsCompanion extends UpdateCompanion<Interview> {
  final Value<int?> id;
  final Value<String> name;
  final Value<String> role;
  final Value<String?> avatarUrl;
  final Value<String> timing;
  final Value<bool> isMale;
  const InterviewsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.timing = const Value.absent(),
    this.isMale = const Value.absent(),
  });
  InterviewsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String role,
    this.avatarUrl = const Value.absent(),
    required String timing,
    this.isMale = const Value.absent(),
  })  : name = Value(name),
        role = Value(role),
        timing = Value(timing);
  static Insertable<Interview> custom({
    Expression<int?>? id,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String?>? avatarUrl,
    Expression<String>? timing,
    Expression<bool>? isMale,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (timing != null) 'timing': timing,
      if (isMale != null) 'is_male': isMale,
    });
  }

  InterviewsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<String>? role,
      Value<String?>? avatarUrl,
      Value<String>? timing,
      Value<bool>? isMale}) {
    return InterviewsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      timing: timing ?? this.timing,
      isMale: isMale ?? this.isMale,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String?>(avatarUrl.value);
    }
    if (timing.present) {
      map['timing'] = Variable<String>(timing.value);
    }
    if (isMale.present) {
      map['is_male'] = Variable<bool>(isMale.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterviewsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('timing: $timing, ')
          ..write('isMale: $isMale')
          ..write(')'))
        .toString();
  }
}

class $InterviewsTable extends Interviews
    with TableInfo<$InterviewsTable, Interview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterviewsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String?> role = GeneratedColumn<String?>(
      'role', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _avatarUrlMeta = const VerificationMeta('avatarUrl');
  @override
  late final GeneratedColumn<String?> avatarUrl = GeneratedColumn<String?>(
      'avatar_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _timingMeta = const VerificationMeta('timing');
  @override
  late final GeneratedColumn<String?> timing = GeneratedColumn<String?>(
      'timing', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isMaleMeta = const VerificationMeta('isMale');
  @override
  late final GeneratedColumn<bool?> isMale = GeneratedColumn<bool?>(
      'is_male', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_male IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, role, avatarUrl, timing, isMale];
  @override
  String get aliasedName => _alias ?? 'interviews';
  @override
  String get actualTableName => 'interviews';
  @override
  VerificationContext validateIntegrity(Insertable<Interview> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('avatar_url')) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta));
    }
    if (data.containsKey('timing')) {
      context.handle(_timingMeta,
          timing.isAcceptableOrUnknown(data['timing']!, _timingMeta));
    } else if (isInserting) {
      context.missing(_timingMeta);
    }
    if (data.containsKey('is_male')) {
      context.handle(_isMaleMeta,
          isMale.isAcceptableOrUnknown(data['is_male']!, _isMaleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Interview map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Interview.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $InterviewsTable createAlias(String alias) {
    return $InterviewsTable(attachedDatabase, alias);
  }
}

abstract class _$DataBase extends GeneratedDatabase {
  _$DataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $InterviewsTable interviews = $InterviewsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [interviews];
}
