import 'package:drift/drift.dart';

class Things extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
}

class Counts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get thingId => integer().references(Things, #id)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DriftDatabase(tables: [Things, Counts])
class MyDatabase {}
