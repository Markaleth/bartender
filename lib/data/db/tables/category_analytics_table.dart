import 'package:drift/drift.dart';

class CategoryAnalyticsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()();
  TextColumn get period => text()();
  IntColumn get number => integer().nullable()();
  TextColumn get formula => text().nullable()();
  TextColumn get cask => text().nullable()();
  TextColumn get count => text()();
  TextColumn get percent => text().nullable()();
}
