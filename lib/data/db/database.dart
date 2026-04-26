import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/casks_table.dart';
import 'tables/formulae_table.dart';
import 'tables/casks_analytics_table.dart';
import 'tables/formulae_analytics_table.dart';
import 'tables/category_analytics_table.dart';
import 'tables/sync_metadata_table.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import 'type_converters.dart';
import 'database_interface.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    CasksTable,
    FormulaeTable,
    CasksAnalyticsTable,
    FormulaeAnalyticsTable,
    CategoryAnalyticsTable,
    SyncMetadataTable,
  ],
)
class AppDatabase extends _$AppDatabase implements DatabaseInterface {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(formulaeTable, formulaeTable.isInstalled);
          await m.addColumn(casksTable, casksTable.isInstalled);
        }
      },
    );
  }

  @override
  Future<void> cacheFormulae(List<FormulaModel> formulae) async {
    await batch((batch) {
      batch.insertAll(
        formulaeTable,
        formulae.map((model) => model.toInsertable()),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<void> cacheCasks(List<CaskModel> casks) async {
    await batch((batch) {
      batch.insertAll(
        casksTable,
        casks.map((model) => model.toInsertable()),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<void> cacheFormula(FormulaModel formula) async {
    await into(
      formulaeTable,
    ).insert(formula.toInsertable(), mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> cacheCask(CaskModel cask) async {
    await into(
      casksTable,
    ).insert(cask.toInsertable(), mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> updateFormulaInstallationStatus(String name, bool isInstalled) async {
    await (update(formulaeTable)..where((t) => t.name.equals(name)))
        .write(FormulaeTableCompanion(isInstalled: Value(isInstalled)));
  }

  @override
  Future<void> updateCaskInstallationStatus(String token, bool isInstalled) async {
    await (update(casksTable)..where((t) => t.token.equals(token)))
        .write(CasksTableCompanion(isInstalled: Value(isInstalled)));
  }

  @override
  Future<void> resetAllInstallationStatuses() async {
    await batch((batch) {
      batch.update(
        formulaeTable,
        const FormulaeTableCompanion(isInstalled: Value(false)),
      );
      batch.update(
        casksTable,
        const CasksTableCompanion(isInstalled: Value(false)),
      );
    });
  }

  @override
  Future<List<FormulaModel>> getAllFormulae() => select(formulaeTable).get();

  @override
  Future<List<CaskModel>> getAllCasks() => select(casksTable).get();

  @override
  Future<List<FormulaModel>> getInstalledFormulae() {
    return (select(formulaeTable)..where((table) => table.isInstalled.equals(true))).get();
  }

  @override
  Future<List<CaskModel>> getInstalledCasks() {
    return (select(casksTable)..where((table) => table.isInstalled.equals(true))).get();
  }

  @override
  Future<FormulaModel?> getFormula(String name) {
    return (select(
      formulaeTable,
    )..where((table) => table.name.equals(name))).getSingleOrNull();
  }

  @override
  Future<CaskModel?> getCask(String token) {
    return (select(
      casksTable,
    )..where((table) => table.token.equals(token))).getSingleOrNull();
  }

  @override
  Future<List<FormulaModel>> searchFormulae(String query) {
    return (select(formulaeTable)..where(
          (table) => table.name.contains(query) | table.desc.contains(query),
        ))
        .get();
  }

  @override
  Future<List<CaskModel>> searchCasks(String query) {
    return (select(casksTable)..where(
          (table) => table.name.contains(query) | table.desc.contains(query),
        ))
        .get();
  }

  @override
  Future<List<FormulaModel>> getFormulaeSortedAlphabetically() {
    return (select(formulaeTable)..orderBy([
          (table) =>
              OrderingTerm(expression: table.name, mode: OrderingMode.asc),
        ]))
        .get();
  }

  @override
  Future<List<CaskModel>> getCasksSortedAlphabetically() {
    return (select(casksTable)..orderBy([
          (table) =>
              OrderingTerm(expression: table.token, mode: OrderingMode.asc),
        ]))
        .get();
  }

  @override
  Future<List<FormulaModel>> getFormulaeSortedByDate() {
    return (select(formulaeTable)..orderBy([
          (table) => OrderingTerm(
            expression: table.generatedDate,
            mode: OrderingMode.desc,
          ),
        ]))
        .get();
  }

  @override
  Future<List<CaskModel>> getCasksSortedByDate() {
    return (select(casksTable)..orderBy([
          (table) => OrderingTerm(
            expression: table.generatedDate,
            mode: OrderingMode.desc,
          ),
        ]))
        .get();
  }

  @override
  Future<void> cacheFormulaeAnalytics(
    String period,
    List<FormulaAnalyticsItem> items,
  ) async {
    await batch((batch) {
      batch.insertAll(
        formulaeAnalyticsTable,
        items.map(
          (item) => FormulaeAnalyticsTableCompanion(
            formula: Value(item.formula),
            count: Value(item.count),
            percent: Value(item.percent),
            period: Value(period),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<void> cacheCasksAnalytics(
    String period,
    List<CaskAnalyticsItem> items,
  ) async {
    await batch((batch) {
      batch.insertAll(
        casksAnalyticsTable,
        items.map(
          (item) => CasksAnalyticsTableCompanion(
            cask: Value(item.cask),
            count: Value(item.count),
            percent: Value(item.percent),
            period: Value(period),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<void> cacheCategoryAnalytics(
    String category,
    String period,
    List<CategoryAnalyticsItem> items,
  ) async {
    await transaction(() async {
      await (delete(categoryAnalyticsTable)
            ..where(
              (t) => t.category.equals(category) & t.period.equals(period),
            ))
          .go();

      await batch((batch) {
        batch.insertAll(
          categoryAnalyticsTable,
          items.map(
            (item) => CategoryAnalyticsTableCompanion.insert(
              category: category,
              period: period,
              number: Value(item.number),
              formula: Value(item.formula),
              cask: Value(item.cask),
              count: item.count,
              percent: Value(item.percent),
            ),
          ),
        );
      });
    });
  }

  @override
  Future<List<CategoryAnalyticsItem>> getCategoryAnalytics(
    String category,
    String period,
  ) async {
    final results =
        await (select(categoryAnalyticsTable)
              ..where(
                (t) => t.category.equals(category) & t.period.equals(period),
              ))
            .get();

    return results
        .map(
          (row) => CategoryAnalyticsItem(
            number: row.number,
            formula: row.formula,
            cask: row.cask,
            count: row.count,
            percent: row.percent,
          ),
        )
        .toList();
  }

  CustomExpression<int> _parseCountExpression(String columnName) {
    return CustomExpression<int>(
      "CAST(REPLACE($columnName, ',', '') AS INTEGER)",
    );
  }

  @override
  Future<List<FormulaModel>> getMostDownloadedFormulae(String period) async {
    final query =
        select(formulaeTable).join([
          innerJoin(
            formulaeAnalyticsTable,
            formulaeAnalyticsTable.formula.equalsExp(formulaeTable.name) &
                formulaeAnalyticsTable.period.equals(period),
          ),
        ])..orderBy([
          OrderingTerm(
            expression: _parseCountExpression(
              formulaeAnalyticsTable.count.name,
            ),
            mode: OrderingMode.desc,
          ),
        ]);

    final rows = await query.get();
    return rows.map((row) => row.readTable(formulaeTable)).toList();
  }

  @override
  Future<List<CaskModel>> getMostDownloadedCasks(String period) async {
    final query =
        select(casksTable).join([
          innerJoin(
            casksAnalyticsTable,
            casksAnalyticsTable.cask.equalsExp(casksTable.token) &
                casksAnalyticsTable.period.equals(period),
          ),
        ])..orderBy([
          OrderingTerm(
            expression: _parseCountExpression(
              casksAnalyticsTable.count.name,
            ),
            mode: OrderingMode.desc,
          ),
        ]);

    final rows = await query.get();
    return rows.map((row) => row.readTable(casksTable)).toList();
  }

  @override
  Future<String?> getETag(String endpoint) async {
    final row = await (select(syncMetadataTable)
          ..where((t) => t.endpoint.equals(endpoint)))
        .getSingleOrNull();
    return row?.etag;
  }

  @override
  Future<void> saveETag(String endpoint, String etag) async {
    await into(syncMetadataTable).insert(
      SyncMetadataTableCompanion(
        endpoint: Value(endpoint),
        etag: Value(etag),
        lastSyncDate: Value(DateTime.now()),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> purgeAllData() async {
    await transaction(() async {
      await delete(casksTable).go();
      await delete(formulaeTable).go();
      await delete(casksAnalyticsTable).go();
      await delete(formulaeAnalyticsTable).go();
      await delete(syncMetadataTable).go();
    });
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

  @override
  Future<bool> isDatabaseEmpty() async {
    final formulae = await (select(formulaeTable)..limit(1)).get();
    final casks = await (select(casksTable)..limit(1)).get();
    return formulae.isEmpty && casks.isEmpty;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'bartender.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
