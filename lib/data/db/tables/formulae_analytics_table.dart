import 'package:drift/drift.dart';

class FormulaeAnalyticsTable extends Table {
  TextColumn get formula => text()();
  TextColumn get count => text()();
  TextColumn get percent => text().nullable()();
  TextColumn get period => text()();

  @override
  Set<Column> get primaryKey => {formula, period};
}
