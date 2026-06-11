import 'dart:io';

import 'package:drift/drift.dart';

import '../../core/enums/analytics_period.dart';
import '../../core/enums/package_type_filter.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import 'database.dart';

typedef PackageQueryData = ({String sql, List<Variable<Object>> args});

PackageQueryData buildPackageQuery({
  required String query,
  required bool installedOnly,
  required PackageTypeFilter type,
  required int limit,
  required int offset,
  String? tapFilter,
}) {
  final actualType = (Platform.isLinux && type == PackageTypeFilter.all)
      ? PackageTypeFilter.formulae
      : type;

  final formula = _buildFormulaWhere(
    query: query,
    installedOnly: installedOnly,
    tapFilter: tapFilter,
  );
  final cask = _buildCaskWhere(
    query: query,
    installedOnly: installedOnly,
    tapFilter: tapFilter,
  );

  final String sql;
  final args = <Variable<Object>>[];

  switch (actualType) {
    case PackageTypeFilter.all:
      sql = _PackageQueries.all(formula.where, cask.where);
      args.addAll([...formula.args, ...cask.args]);
    case PackageTypeFilter.formulae:
      sql = _PackageQueries.formulae(formula.where);
      args.addAll(formula.args);
    case PackageTypeFilter.casks:
      sql = _PackageQueries.casks(cask.where);
      args.addAll(cask.args);
  }

  args.addAll([Variable.withInt(limit), Variable.withInt(offset)]);

  return (sql: sql, args: args);
}

typedef _WhereClause = ({String where, List<Variable<Object>> args});

_WhereClause _buildFormulaWhere({
  required String query,
  required bool installedOnly,
  String? tapFilter,
}) {
  String where = '1=1';
  final args = <Variable<Object>>[];

  if (tapFilter != null && tapFilter.isNotEmpty) {
    where += ' AND tap = ?';
    args.add(Variable.withString(tapFilter));
  }

  if (query.isNotEmpty) {
    where += ' AND (name LIKE ? OR desc LIKE ?)';
    final likeQuery = '%$query%';
    args.addAll([
      Variable.withString(likeQuery),
      Variable.withString(likeQuery),
    ]);
  }

  if (installedOnly) {
    where += ' AND is_installed = 1';
  }

  if (Platform.isLinux) {
    where +=
        " AND (requirements IS NULL OR requirements NOT LIKE '%\"name\":\"macos\"%')";
  } else if (Platform.isMacOS) {
    where +=
        " AND (requirements IS NULL OR requirements NOT LIKE '%\"name\":\"linux\"%')";
  }

  return (where: where, args: args);
}

_WhereClause _buildCaskWhere({
  required String query,
  required bool installedOnly,
  String? tapFilter,
}) {
  String where = '1=1';
  final args = <Variable<Object>>[];

  if (tapFilter != null && tapFilter.isNotEmpty) {
    where += ' AND tap = ?';
    args.add(Variable.withString(tapFilter));
  }

  if (query.isNotEmpty) {
    where += ' AND (token LIKE ? OR name LIKE ? OR desc LIKE ?)';
    final likeQuery = '%$query%';
    args.addAll([
      Variable.withString(likeQuery),
      Variable.withString(likeQuery),
      Variable.withString(likeQuery),
    ]);
  }

  if (installedOnly) {
    where += ' AND is_installed = 1';
  }

  if (Platform.isLinux) {
    where += " AND 1=0";
  }

  return (where: where, args: args);
}

class _PackageQueries {
  static String all(String formulaWhere, String caskWhere) =>
      '''
        SELECT name AS id, 'formula' AS type FROM formulae_table WHERE $formulaWhere
        UNION ALL
        SELECT token AS id, 'cask' AS type FROM casks_table WHERE $caskWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';

  static String formulae(String where) =>
      '''
        SELECT name AS id, 'formula' AS type FROM formulae_table WHERE $where
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';

  static String casks(String where) =>
      '''
        SELECT token AS id, 'cask' AS type FROM casks_table WHERE $where
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
}

Insertable<FormulaModel> updateFormulaFromExcluded($FormulaeTableTable ex) {
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
    isInstalled: ex.isInstalled,
    installedSize: ex.installedSize,
    installedOnTimestamp: ex.installedOnTimestamp,
  );
}

Insertable<CaskModel> updateCaskFromExcluded($CasksTableTable ex) {
  return CasksTableCompanion.custom(
    fullToken: ex.fullToken,
    name: ex.name,
    desc: ex.desc,
    homepage: ex.homepage,
    url: ex.url,
    version: ex.version,
    autoUpdates: ex.autoUpdates,
    dependsOn: ex.dependsOn,
    isInstalled: ex.isInstalled,
    outdated: ex.outdated,
    deprecated: ex.deprecated,
    disabled: ex.disabled,
    generatedDate: ex.generatedDate,
    installedSize: ex.installedSize,
    installedOnTimestamp: ex.installedOnTimestamp,
  );
}

Insertable<FormulaModel> updateNetworkFormulaFromExcluded(
  $FormulaeTableTable ex,
) {
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
}

Insertable<CaskModel> updateNetworkCaskFromExcluded($CasksTableTable ex) {
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
}

FormulaeTableCompanion createFormulaAnalyticsCompanion(
  AnalyticsPeriod period,
  int installs,
) {
  return switch (period) {
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
}

CasksTableCompanion createCaskAnalyticsCompanion(
  AnalyticsPeriod period,
  int installs,
) {
  return switch (period) {
    AnalyticsPeriod.days30 => CasksTableCompanion(installs30d: Value(installs)),
    AnalyticsPeriod.days90 => CasksTableCompanion(installs90d: Value(installs)),
    AnalyticsPeriod.days365 => CasksTableCompanion(
      installs365d: Value(installs),
    ),
  };
}
