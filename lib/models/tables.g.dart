// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Thing extends DataClass implements Insertable<Thing> {
  final int id;
  final String name;
  final int count;
  Thing({required this.id, required this.name, required this.count});
  factory Thing.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Thing(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      count: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['count'] = Variable<int>(count);
    return map;
  }

  ThingsCompanion toCompanion(bool nullToAbsent) {
    return ThingsCompanion(
      id: Value(id),
      name: Value(name),
      count: Value(count),
    );
  }

  factory Thing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Thing(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'count': serializer.toJson<int>(count),
    };
  }

  Thing copyWith({int? id, String? name, int? count}) => Thing(
        id: id ?? this.id,
        name: name ?? this.name,
        count: count ?? this.count,
      );
  @override
  String toString() {
    return (StringBuffer('Thing(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Thing &&
          other.id == this.id &&
          other.name == this.name &&
          other.count == this.count);
}

class ThingsCompanion extends UpdateCompanion<Thing> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> count;
  const ThingsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.count = const Value.absent(),
  });
  ThingsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.count = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Thing> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (count != null) 'count': count,
    });
  }

  ThingsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? count}) {
    return ThingsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
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
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThingsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

class $ThingsTable extends Things with TableInfo<$ThingsTable, Thing> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ThingsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int?> count = GeneratedColumn<int?>(
      'count', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => 0);
  @override
  List<GeneratedColumn> get $columns => [id, name, count];
  @override
  String get aliasedName => _alias ?? 'things';
  @override
  String get actualTableName => 'things';
  @override
  VerificationContext validateIntegrity(Insertable<Thing> instance,
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
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Thing map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Thing.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ThingsTable createAlias(String alias) {
    return $ThingsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ThingsTable things = $ThingsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [things];
}
