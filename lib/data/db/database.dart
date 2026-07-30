import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/casks_table.dart';
import 'tables/formulae_table.dart';
import 'tables/icon_cache_table.dart';
import 'tables/category_analytics_table.dart';
import 'tables/sync_metadata_table.dart';
import 'tables/taps_table.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../models/tap/tap_model.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import '../models/icon_cache/resolved_icon.dart';
import '../../core/enums/analytics_period.dart';
import 'type_converters.dart';
import 'database_interface.dart';

import '../../core/enums/package_type_filter.dart';

import 'database_utils.dart';

part 'database.g.dart';
part 'database_queries.dart';

@DriftDatabase(
  tables: [
    CasksTable,
    FormulaeTable,
    IconCacheTable,
    CategoryAnalyticsTable,
    SyncMetadataTable,
    TapsTable,
  ],
)
class AppDatabase extends _$AppDatabase
    with DatabaseQueries
    implements DatabaseInterface {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(formulaeTable, formulaeTable.installedSize);
          await m.addColumn(formulaeTable, formulaeTable.installedOnTimestamp);
          await m.addColumn(formulaeTable, formulaeTable.builtAsBottle);

          await m.addColumn(casksTable, casksTable.installedSize);
          await m.addColumn(casksTable, casksTable.installedOnTimestamp);
        }
        if (from < 3) {
          await m.alterTable(TableMigration(formulaeTable));
          await m.alterTable(TableMigration(casksTable));
          await m.alterTable(TableMigration(tapsTable));
        }
        if (from < 4) {
          await m.addColumn(tapsTable, tapsTable.trusted);
        }
        if (from < 5) {
          await m.alterTable(TableMigration(tapsTable));
          await m.addColumn(tapsTable, tapsTable.brokenPackages);
        }
      },
    );
  }

  @override
  Future<void> deleteDatabaseFile() async {
    await close();
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'bartender.sqlite'));
    if (await file.exists()) {
      await file.delete();
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'bartender.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
