import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/casks_table.dart';
import 'tables/formulae_table.dart';
import 'tables/casks_analytics_table.dart';
import 'tables/formulae_analytics_table.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import 'type_converters.dart';
import 'database_interface.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    CasksTable,
    FormulaeTable,
    CasksAnalyticsTable,
    FormulaeAnalyticsTable,
  ],
)
class AppDatabase extends _$AppDatabase implements DatabaseInterface {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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
  Future<List<FormulaModel>> getAllFormulae() => select(formulaeTable).get();

  @override
  Future<List<CaskModel>> getAllCasks() => select(casksTable).get();

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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bartender.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
