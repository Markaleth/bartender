import 'package:drift/drift.dart';

class SyncMetadataTable extends Table {
  TextColumn get endpoint => text()();
  TextColumn get etag => text().nullable()();
  DateTimeColumn get lastSyncDate => dateTime()();

  @override
  Set<Column> get primaryKey => {endpoint};
}
