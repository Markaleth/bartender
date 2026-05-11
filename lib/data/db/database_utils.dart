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
}) {
  if (Platform.isLinux && type == PackageTypeFilter.all) {
    type = PackageTypeFilter.formulae;
  }

  final formulaArgs = <Variable<Object>>[];
  final caskArgs = <Variable<Object>>[];

  String formulaWhere = '1=1';
  String caskWhere = '1=1';

  if (query.isNotEmpty) {
    final likeQuery = '%$query%';
    formulaWhere += ' AND (name LIKE ? OR desc LIKE ?)';
    formulaArgs.addAll([
      Variable.withString(likeQuery),
      Variable.withString(likeQuery),
    ]);

    caskWhere += ' AND (token LIKE ? OR name LIKE ? OR desc LIKE ?)';
    caskArgs.addAll([
      Variable.withString(likeQuery),
      Variable.withString(likeQuery),
      Variable.withString(likeQuery),
    ]);
  }

  if (installedOnly) {
    formulaWhere += ' AND is_installed = 1';
    caskWhere += ' AND is_installed = 1';
  }

  if (Platform.isLinux) {
    formulaWhere +=
        " AND (requirements IS NULL OR requirements NOT LIKE '%\"name\":\"macos\"%')";
    caskWhere += " AND 1=0";
  } else if (Platform.isMacOS) {
    formulaWhere +=
        " AND (requirements IS NULL OR requirements NOT LIKE '%\"name\":\"linux\"%')";
  }

  String sql = '';
  final args = <Variable<Object>>[];

  if (type == PackageTypeFilter.all) {
    sql = '''
        SELECT name AS id, 'formula' AS type FROM formulae_table WHERE $formulaWhere
        UNION ALL
        SELECT token AS id, 'cask' AS type FROM casks_table WHERE $caskWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
    args.addAll([...formulaArgs, ...caskArgs]);
  } else if (type == PackageTypeFilter.formulae) {
    sql = '''
        SELECT name AS id, 'formula' AS type FROM formulae_table WHERE $formulaWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
    args.addAll(formulaArgs);
  } else if (type == PackageTypeFilter.casks) {
    sql = '''
        SELECT token AS id, 'cask' AS type FROM casks_table WHERE $caskWhere
        ORDER BY id ASC
        LIMIT ? OFFSET ?
      ''';
    args.addAll(caskArgs);
  }

  args.addAll([Variable.withInt(limit), Variable.withInt(offset)]);

  return (sql: sql, args: args);
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
}