import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'tables.g.dart';

class Things extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name =>
      text().withLength(min: 1, max: 32).customConstraint("UNIQUE")();
  IntColumn get count => integer().clientDefault(() => 0)();
}

// class Counts extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get thingId => integer().references(Things, #id)();
//   DateTimeColumn get createdAt =>
//       dateTime().clientDefault(() => DateTime.now())();
// }

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Things])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Stream<List<Thing>> watchAllThings() => (select(things)
        ..orderBy([
          (u) => OrderingTerm(expression: u.count, mode: OrderingMode.asc),
        ]))
      .watch();

  Future<void> insertThing(ThingsCompanion thing) {
    return into(things).insertOnConflictUpdate(thing);
  }

  Future<void> deleteByThingId(int thingId) {
    return (delete(things)..where((tbl) => tbl.id.equals(thingId))).go();
  }

  Future<int> updateCountByThingId(int thingId, int count) async {
    return (update(things)..where((t) => t.id.equals(thingId))).write(
      ThingsCompanion(
        count: Value(count),
      ),
    );
  }

  // Stream<List<Count>> getAllCountByThingId(int thingId) =>
  //     (select(counts)..where((tbl) => tbl.id.equals(thingId))).watch();
}
