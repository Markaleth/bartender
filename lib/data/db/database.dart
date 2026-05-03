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
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import '../models/icon_cache/resolved_icon.dart';
import '../../core/enums/analytics_period.dart';
import 'type_converters.dart';
import 'database_interface.dart';

import '../../core/enums/package_type_filter.dart';
import '../../core/enums/os_support_filter.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    CasksTable,
    FormulaeTable,
    IconCacheTable,
    // Removed standalone analytics tables
    CategoryAnalyticsTable,
    SyncMetadataTable,
  ],
)
class AppDatabase extends _$AppDatabase implements DatabaseInterface {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }

  @override
  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    OsSupportFilter osSupport = OsSupportFilter.all,
    int limit = 50,
    int offset = 0,
  }) async {
    final args = <Variable>[];
    String formulaWhere = '1=1';
    String caskWhere = '1=1';

    if (query.isNotEmpty) {
      final likeQuery = '%$query%';
      formulaWhere += ' AND (name LIKE ? OR desc LIKE ?)';
      caskWhere += ' AND (token LIKE ? OR name LIKE ? OR desc LIKE ?)';
      args.addAll([
        Variable.withString(likeQuery),
        Variable.withString(likeQuery),
        Variable.withString(likeQuery),
        Variable.withString(likeQuery),
        Variable.withString(likeQuery),
      ]);
    }

    if (installedOnly) {
      formulaWhere += ' AND is_installed = 1';
      caskWhere += ' AND is_installed = 1';
    }

    if (osSupport == OsSupportFilter.linux) {
      formulaWhere +=
          " AND (requirements IS NULL OR requirements NOT LIKE '%\"name\":\"macos\"%')";
    } else if (osSupport == OsSupportFilter.macOS) {
      formulaWhere +=
          " AND (requirements IS NULL OR requirements NOT LIKE '%\"name\":\"linux\"%')";
    }

    String sql = '';

    if (type == PackageTypeFilter.all) {
      sql =
          '''
        SELECT name AS id, 'formula' AS type FROM formulae_table WHERE $formulaWhere
        UNION ALL
        SELECT token AS id, 'cask' AS type FROM casks_table WHERE $caskWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
    } else if (type == PackageTypeFilter.formulae) {
      sql =
          '''
        SELECT name AS id, 'formula' AS type FROM formulae_table WHERE $formulaWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
      if (query.isNotEmpty) {
        args.removeLast();
        args.removeLast();
        args.removeLast();
      }
    } else if (type == PackageTypeFilter.casks) {
      sql =
          '''
        SELECT token AS id, 'cask' AS type FROM casks_table WHERE $caskWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
      if (query.isNotEmpty) {
        args.clear();
        args.addAll([
          Variable.withString('%$query%'),
          Variable.withString('%$query%'),
          Variable.withString('%$query%'),
        ]);
      }
    }

    args.add(Variable.withInt(limit));
    args.add(Variable.withInt(offset));

    final result = await customSelect(sql, variables: args).get();

    final formulaIds = <String>[];
    final caskIds = <String>[];

    for (final row in result) {
      if (row.read<String>('type') == 'formula') {
        formulaIds.add(row.read<String>('id'));
      } else {
        caskIds.add(row.read<String>('id'));
      }
    }

    final formulae = formulaIds.isNotEmpty
        ? await (select(
            formulaeTable,
          )..where((t) => t.name.isIn(formulaIds))).get()
        : <FormulaModel>[];
    final casks = caskIds.isNotEmpty
        ? await (select(casksTable)..where((t) => t.token.isIn(caskIds))).get()
        : <CaskModel>[];

    final formulaMap = {for (var f in formulae) f.name: f};
    final caskMap = {for (var c in casks) c.token: c};

    final orderedResults = <dynamic>[];
    for (final row in result) {
      final id = row.read<String>('id');
      final pType = row.read<String>('type');
      if (pType == 'formula') {
        if (formulaMap.containsKey(id)) {
          orderedResults.add(formulaMap[id]);
        }
      } else {
        if (caskMap.containsKey(id)) {
          orderedResults.add(caskMap[id]);
        }
      }
    }

    return orderedResults;
  }

  @override
  Future<void> cacheFormulae(List<FormulaModel> formulae) async {
    await batch((batch) {
      batch.insertAll(
        formulaeTable,
        formulae.map((model) => model.toInsertable()),
        onConflict: DoUpdate.withExcluded((old, excluded) {
          final ex = excluded as FormulaeTable;
          return FormulaeTableCompanion.custom(
            fullName: ex.fullName,
            tap: ex.tap,
            desc: ex.desc,
            license: ex.license,
            homepage: ex.homepage,
            versions: ex.versions,
            dependencies: ex.dependencies,
            buildDependencies: ex.buildDependencies,
            outdated: ex.outdated,
            deprecated: ex.deprecated,
            disabled: ex.disabled,
            generatedDate: ex.generatedDate,
          );
        }),
      );
    });
  }

  @override
  Future<void> cacheCasks(List<CaskModel> casks) async {
    await batch((batch) {
      batch.insertAll(
        casksTable,
        casks.map((model) => model.toInsertable()),
        onConflict: DoUpdate.withExcluded((old, excluded) {
          final ex = excluded as CasksTable;
          return CasksTableCompanion.custom(
            fullToken: ex.fullToken,
            name: ex.name,
            desc: ex.desc,
            homepage: ex.homepage,
            url: ex.url,
            version: ex.version,
            autoUpdates: ex.autoUpdates,
            dependsOn: ex.dependsOn,
            outdated: ex.outdated,
            deprecated: ex.deprecated,
            disabled: ex.disabled,
            generatedDate: ex.generatedDate,
          );
        }),
      );
    });
  }

  @override
  Future<void> cacheFormula(FormulaModel formula) async {
    await into(formulaeTable).insert(
      formula.toInsertable(),
      onConflict: DoUpdate.withExcluded((old, excluded) {
        final ex = excluded as FormulaeTable;
        return FormulaeTableCompanion.custom(
          fullName: ex.fullName,
          tap: ex.tap,
          desc: ex.desc,
          license: ex.license,
          homepage: ex.homepage,
          versions: ex.versions,
          dependencies: ex.dependencies,
          buildDependencies: ex.buildDependencies,
          outdated: ex.outdated,
          deprecated: ex.deprecated,
          disabled: ex.disabled,
          generatedDate: ex.generatedDate,
        );
      }),
    );
  }

  @override
  Future<void> cacheCask(CaskModel cask) async {
    await into(casksTable).insert(
      cask.toInsertable(),
      onConflict: DoUpdate.withExcluded((old, excluded) {
        final ex = excluded as CasksTable;
        return CasksTableCompanion.custom(
          fullToken: ex.fullToken,
          name: ex.name,
          desc: ex.desc,
          homepage: ex.homepage,
          url: ex.url,
          version: ex.version,
          autoUpdates: ex.autoUpdates,
          dependsOn: ex.dependsOn,
          outdated: ex.outdated,
          deprecated: ex.deprecated,
          disabled: ex.disabled,
          generatedDate: ex.generatedDate,
        );
      }),
    );
  }

  @override
  Future<void> updateFormulaInstallationStatus(
    String name,
    bool isInstalled,
  ) async {
    await (update(formulaeTable)..where((t) => t.name.equals(name))).write(
      FormulaeTableCompanion(isInstalled: Value(isInstalled)),
    );
  }

  @override
  Future<void> updateCaskInstallationStatus(
    String token,
    bool isInstalled,
  ) async {
    await (update(casksTable)..where((t) => t.token.equals(token))).write(
      CasksTableCompanion(isInstalled: Value(isInstalled)),
    );
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
    return (select(
      formulaeTable,
    )..where((table) => table.isInstalled.equals(true))).get();
  }

  @override
  Future<List<CaskModel>> getInstalledCasks() {
    return (select(
      casksTable,
    )..where((table) => table.isInstalled.equals(true))).get();
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
  Future<void> updateFormulaAnalytics(
    String name,
    int installs,
    AnalyticsPeriod period,
  ) async {
    final companion = switch (period) {
      AnalyticsPeriod.days30 => FormulaeTableCompanion(
        installs30d: Value(installs),
      ),
      AnalyticsPeriod.days90 => FormulaeTableCompanion(
        installs90d: Value(installs),
      ),
      AnalyticsPeriod.days365 => FormulaeTableCompanion(
        installs365d: Value(installs),
      ),
    };
    await (update(
      formulaeTable,
    )..where((t) => t.name.equals(name))).write(companion);
  }

  @override
  Future<void> updateCaskAnalytics(
    String token,
    int installs,
    AnalyticsPeriod period,
  ) async {
    final companion = switch (period) {
      AnalyticsPeriod.days30 => CasksTableCompanion(
        installs30d: Value(installs),
      ),
      AnalyticsPeriod.days90 => CasksTableCompanion(
        installs90d: Value(installs),
      ),
      AnalyticsPeriod.days365 => CasksTableCompanion(
        installs365d: Value(installs),
      ),
    };
    await (update(
      casksTable,
    )..where((t) => t.token.equals(token))).write(companion);
  }

  @override
  Future<void> updateFormulaeAnalyticsBatch(
    List<FormulaAnalyticsItem> items,
    AnalyticsPeriod period,
  ) async {
    await batch((batch) {
      for (final item in items) {
        final installs = int.tryParse(item.count.replaceAll(',', '')) ?? 0;
        final companion = switch (period) {
          AnalyticsPeriod.days30 => FormulaeTableCompanion(
            installs30d: Value(installs),
          ),
          AnalyticsPeriod.days90 => FormulaeTableCompanion(
            installs90d: Value(installs),
          ),
          AnalyticsPeriod.days365 => FormulaeTableCompanion(
            installs365d: Value(installs),
          ),
        };
        batch.update(
          formulaeTable,
          companion,
          where: (t) => t.name.equals(item.formula),
        );
      }
    });
  }

  @override
  Future<void> updateCasksAnalyticsBatch(
    List<CaskAnalyticsItem> items,
    AnalyticsPeriod period,
  ) async {
    await batch((batch) {
      for (final item in items) {
        final installs = int.tryParse(item.count.replaceAll(',', '')) ?? 0;
        final companion = switch (period) {
          AnalyticsPeriod.days30 => CasksTableCompanion(
            installs30d: Value(installs),
          ),
          AnalyticsPeriod.days90 => CasksTableCompanion(
            installs90d: Value(installs),
          ),
          AnalyticsPeriod.days365 => CasksTableCompanion(
            installs365d: Value(installs),
          ),
        };
        batch.update(
          casksTable,
          companion,
          where: (t) => t.token.equals(item.cask),
        );
      }
    });
  }

  @override
  Future<void> cacheCategoryAnalytics(
    String category,
    AnalyticsPeriod period,
    List<CategoryAnalyticsItem> items,
  ) async {
    await transaction(() async {
      await (delete(categoryAnalyticsTable)..where(
            (t) => t.category.equals(category) & t.period.equals(period.value),
          ))
          .go();

      await batch((batch) {
        batch.insertAll(
          categoryAnalyticsTable,
          items.map(
            (item) => CategoryAnalyticsTableCompanion.insert(
              category: category,
              period: period.value,
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
    AnalyticsPeriod period,
  ) async {
    final results =
        await (select(categoryAnalyticsTable)..where(
              (t) =>
                  t.category.equals(category) & t.period.equals(period.value),
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

  @override
  Future<List<FormulaModel>> getMostDownloadedFormulae(
    AnalyticsPeriod period, {
    int limit = 10,
  }) async {
    final column = switch (period) {
      AnalyticsPeriod.days30 => formulaeTable.installs30d,
      AnalyticsPeriod.days90 => formulaeTable.installs90d,
      AnalyticsPeriod.days365 => formulaeTable.installs365d,
    };

    return (select(formulaeTable)
          ..where((t) => column.isNotNull())
          ..orderBy([
            (t) => OrderingTerm(expression: column, mode: OrderingMode.desc),
          ])
          ..limit(limit))
        .get();
  }

  @override
  Future<List<CaskModel>> getMostDownloadedCasks(
    AnalyticsPeriod period, {
    int limit = 10,
  }) async {
    final column = switch (period) {
      AnalyticsPeriod.days30 => casksTable.installs30d,
      AnalyticsPeriod.days90 => casksTable.installs90d,
      AnalyticsPeriod.days365 => casksTable.installs365d,
    };

    return (select(casksTable)
          ..where((t) => column.isNotNull())
          ..orderBy([
            (t) => OrderingTerm(expression: column, mode: OrderingMode.desc),
          ])
          ..limit(limit))
        .get();
  }

  @override
  Future<String?> getETag(String endpoint) async {
    final row = await (select(
      syncMetadataTable,
    )..where((t) => t.endpoint.equals(endpoint))).getSingleOrNull();
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

  @override
  Future<void> saveIconCache(
    String packageName,
    String? iconUrl,
    bool isSvg,
  ) async {
    await into(iconCacheTable).insert(
      IconCacheTableCompanion.insert(
        packageName: packageName,
        iconUrl: Value(iconUrl),
        isSvg: Value(isSvg),
        resolvedAt: DateTime.now(),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<ResolvedIcon?> getIconCache(String packageName) {
    return (select(
      iconCacheTable,
    )..where((t) => t.packageName.equals(packageName))).getSingleOrNull();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'bartender.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
