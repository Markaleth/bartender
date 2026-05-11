part of 'database.dart';

mixin DatabaseQueries on _$AppDatabase implements DatabaseInterface {
  @override
  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    int limit = 50,
    int offset = 0,
  }) async {
    final queryData = buildPackageQuery(
      query: query,
      installedOnly: installedOnly,
      type: type,
      limit: limit,
      offset: offset,
    );

    final result = await customSelect(
      queryData.sql,
      variables: queryData.args,
    ).get();

    return await _fetchOrderedPackageModels(result);
  }

  Future<List<dynamic>> _fetchOrderedPackageModels(
    List<QueryRow> result,
  ) async {
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
        onConflict: DoUpdate.withExcluded(
          (old, excluded) =>
              updateFormulaFromExcluded(excluded as $FormulaeTableTable),
        ),
      );
    });
  }

  @override
  Future<void> cacheCasks(List<CaskModel> casks) async {
    await batch((batch) {
      batch.insertAll(
        casksTable,
        casks.map((model) => model.toInsertable()),
        onConflict: DoUpdate.withExcluded(
          (old, excluded) =>
              updateCaskFromExcluded(excluded as $CasksTableTable),
        ),
      );
    });
  }

  @override
  Future<void> cacheFormula(FormulaModel formula) async {
    await into(formulaeTable).insert(
      formula.toInsertable(),
      onConflict: DoUpdate.withExcluded(
        (old, excluded) => updateFormulaFromExcluded(excluded),
      ),
    );
  }

  @override
  Future<void> cacheCask(CaskModel cask) async {
    await into(casksTable).insert(
      cask.toInsertable(),
      onConflict: DoUpdate.withExcluded(
        (old, excluded) => updateCaskFromExcluded(excluded),
      ),
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
    await (update(formulaeTable)..where((t) => t.name.equals(name))).write(
      createFormulaAnalyticsCompanion(period, installs),
    );
  }

  @override
  Future<void> updateCaskAnalytics(
    String token,
    int installs,
    AnalyticsPeriod period,
  ) async {
    await (update(casksTable)..where((t) => t.token.equals(token))).write(
      createCaskAnalyticsCompanion(period, installs),
    );
  }

  @override
  Future<void> updateFormulaeAnalyticsBatch(
    List<FormulaAnalyticsItem> items,
    AnalyticsPeriod period,
  ) async {
    await batch((batch) {
      for (final item in items) {
        final installs = int.tryParse(item.count.replaceAll(',', '')) ?? 0;
        batch.update(
          formulaeTable,
          createFormulaAnalyticsCompanion(period, installs),
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
        batch.update(
          casksTable,
          createCaskAnalyticsCompanion(period, installs),
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
