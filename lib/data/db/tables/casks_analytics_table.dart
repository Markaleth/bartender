import 'package:drift/drift.dart';

class CasksAnalyticsTable extends Table {
  TextColumn get cask => text()();
  TextColumn get count => text()();
  TextColumn get percent => text().nullable()();
  TextColumn get period => text()();

  @override
  Set<Column> get primaryKey => {cask, period};
}
