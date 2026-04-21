// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CasksTableTable extends CasksTable
    with TableInfo<$CasksTableTable, CaskModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CasksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullTokenMeta = const VerificationMeta(
    'fullToken',
  );
  @override
  late final GeneratedColumn<String> fullToken = GeneratedColumn<String>(
    'full_token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> name =
      GeneratedColumn<String>(
        'name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($CasksTableTable.$convertername);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _homepageMeta = const VerificationMeta(
    'homepage',
  );
  @override
  late final GeneratedColumn<String> homepage = GeneratedColumn<String>(
    'homepage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _autoUpdatesMeta = const VerificationMeta(
    'autoUpdates',
  );
  @override
  late final GeneratedColumn<bool> autoUpdates = GeneratedColumn<bool>(
    'auto_updates',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_updates" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  dependsOn = GeneratedColumn<String>(
    'depends_on',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($CasksTableTable.$converterdependsOnn);
  static const VerificationMeta _outdatedMeta = const VerificationMeta(
    'outdated',
  );
  @override
  late final GeneratedColumn<bool> outdated = GeneratedColumn<bool>(
    'outdated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("outdated" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deprecatedMeta = const VerificationMeta(
    'deprecated',
  );
  @override
  late final GeneratedColumn<bool> deprecated = GeneratedColumn<bool>(
    'deprecated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deprecated" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _disabledMeta = const VerificationMeta(
    'disabled',
  );
  @override
  late final GeneratedColumn<bool> disabled = GeneratedColumn<bool>(
    'disabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("disabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  analytics = GeneratedColumn<String>(
    'analytics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($CasksTableTable.$converteranalyticsn);
  static const VerificationMeta _generatedDateMeta = const VerificationMeta(
    'generatedDate',
  );
  @override
  late final GeneratedColumn<String> generatedDate = GeneratedColumn<String>(
    'generated_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    token,
    fullToken,
    name,
    desc,
    homepage,
    url,
    version,
    autoUpdates,
    dependsOn,
    outdated,
    deprecated,
    disabled,
    analytics,
    generatedDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'casks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaskModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('full_token')) {
      context.handle(
        _fullTokenMeta,
        fullToken.isAcceptableOrUnknown(data['full_token']!, _fullTokenMeta),
      );
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    }
    if (data.containsKey('homepage')) {
      context.handle(
        _homepageMeta,
        homepage.isAcceptableOrUnknown(data['homepage']!, _homepageMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('auto_updates')) {
      context.handle(
        _autoUpdatesMeta,
        autoUpdates.isAcceptableOrUnknown(
          data['auto_updates']!,
          _autoUpdatesMeta,
        ),
      );
    }
    if (data.containsKey('outdated')) {
      context.handle(
        _outdatedMeta,
        outdated.isAcceptableOrUnknown(data['outdated']!, _outdatedMeta),
      );
    }
    if (data.containsKey('deprecated')) {
      context.handle(
        _deprecatedMeta,
        deprecated.isAcceptableOrUnknown(data['deprecated']!, _deprecatedMeta),
      );
    }
    if (data.containsKey('disabled')) {
      context.handle(
        _disabledMeta,
        disabled.isAcceptableOrUnknown(data['disabled']!, _disabledMeta),
      );
    }
    if (data.containsKey('generated_date')) {
      context.handle(
        _generatedDateMeta,
        generatedDate.isAcceptableOrUnknown(
          data['generated_date']!,
          _generatedDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {token};
  @override
  CaskModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaskModel(
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
      fullToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_token'],
      ),
      name: $CasksTableTable.$convertername.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}name'],
        )!,
      ),
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      ),
      homepage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}homepage'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      )!,
      autoUpdates: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_updates'],
      ),
      dependsOn: $CasksTableTable.$converterdependsOnn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}depends_on'],
        ),
      ),
      outdated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}outdated'],
      )!,
      deprecated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deprecated'],
      )!,
      disabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}disabled'],
      )!,
      analytics: $CasksTableTable.$converteranalyticsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}analytics'],
        ),
      ),
      generatedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}generated_date'],
      ),
    );
  }

  @override
  $CasksTableTable createAlias(String alias) {
    return $CasksTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertername =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converterdependsOn =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterdependsOnn =
      NullAwareTypeConverter.wrap($converterdependsOn);
  static TypeConverter<Map<String, dynamic>, String> $converteranalytics =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converteranalyticsn =
      NullAwareTypeConverter.wrap($converteranalytics);
}

class CasksTableCompanion extends UpdateCompanion<CaskModel> {
  final Value<String> token;
  final Value<String?> fullToken;
  final Value<List<String>> name;
  final Value<String?> desc;
  final Value<String?> homepage;
  final Value<String?> url;
  final Value<String> version;
  final Value<bool?> autoUpdates;
  final Value<Map<String, dynamic>?> dependsOn;
  final Value<bool> outdated;
  final Value<bool> deprecated;
  final Value<bool> disabled;
  final Value<Map<String, dynamic>?> analytics;
  final Value<String?> generatedDate;
  final Value<int> rowid;
  const CasksTableCompanion({
    this.token = const Value.absent(),
    this.fullToken = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.homepage = const Value.absent(),
    this.url = const Value.absent(),
    this.version = const Value.absent(),
    this.autoUpdates = const Value.absent(),
    this.dependsOn = const Value.absent(),
    this.outdated = const Value.absent(),
    this.deprecated = const Value.absent(),
    this.disabled = const Value.absent(),
    this.analytics = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CasksTableCompanion.insert({
    required String token,
    this.fullToken = const Value.absent(),
    required List<String> name,
    this.desc = const Value.absent(),
    this.homepage = const Value.absent(),
    this.url = const Value.absent(),
    required String version,
    this.autoUpdates = const Value.absent(),
    this.dependsOn = const Value.absent(),
    this.outdated = const Value.absent(),
    this.deprecated = const Value.absent(),
    this.disabled = const Value.absent(),
    this.analytics = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : token = Value(token),
       name = Value(name),
       version = Value(version);
  static Insertable<CaskModel> custom({
    Expression<String>? token,
    Expression<String>? fullToken,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? homepage,
    Expression<String>? url,
    Expression<String>? version,
    Expression<bool>? autoUpdates,
    Expression<String>? dependsOn,
    Expression<bool>? outdated,
    Expression<bool>? deprecated,
    Expression<bool>? disabled,
    Expression<String>? analytics,
    Expression<String>? generatedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (token != null) 'token': token,
      if (fullToken != null) 'full_token': fullToken,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (homepage != null) 'homepage': homepage,
      if (url != null) 'url': url,
      if (version != null) 'version': version,
      if (autoUpdates != null) 'auto_updates': autoUpdates,
      if (dependsOn != null) 'depends_on': dependsOn,
      if (outdated != null) 'outdated': outdated,
      if (deprecated != null) 'deprecated': deprecated,
      if (disabled != null) 'disabled': disabled,
      if (analytics != null) 'analytics': analytics,
      if (generatedDate != null) 'generated_date': generatedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CasksTableCompanion copyWith({
    Value<String>? token,
    Value<String?>? fullToken,
    Value<List<String>>? name,
    Value<String?>? desc,
    Value<String?>? homepage,
    Value<String?>? url,
    Value<String>? version,
    Value<bool?>? autoUpdates,
    Value<Map<String, dynamic>?>? dependsOn,
    Value<bool>? outdated,
    Value<bool>? deprecated,
    Value<bool>? disabled,
    Value<Map<String, dynamic>?>? analytics,
    Value<String?>? generatedDate,
    Value<int>? rowid,
  }) {
    return CasksTableCompanion(
      token: token ?? this.token,
      fullToken: fullToken ?? this.fullToken,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      homepage: homepage ?? this.homepage,
      url: url ?? this.url,
      version: version ?? this.version,
      autoUpdates: autoUpdates ?? this.autoUpdates,
      dependsOn: dependsOn ?? this.dependsOn,
      outdated: outdated ?? this.outdated,
      deprecated: deprecated ?? this.deprecated,
      disabled: disabled ?? this.disabled,
      analytics: analytics ?? this.analytics,
      generatedDate: generatedDate ?? this.generatedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (fullToken.present) {
      map['full_token'] = Variable<String>(fullToken.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(
        $CasksTableTable.$convertername.toSql(name.value),
      );
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (homepage.present) {
      map['homepage'] = Variable<String>(homepage.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (autoUpdates.present) {
      map['auto_updates'] = Variable<bool>(autoUpdates.value);
    }
    if (dependsOn.present) {
      map['depends_on'] = Variable<String>(
        $CasksTableTable.$converterdependsOnn.toSql(dependsOn.value),
      );
    }
    if (outdated.present) {
      map['outdated'] = Variable<bool>(outdated.value);
    }
    if (deprecated.present) {
      map['deprecated'] = Variable<bool>(deprecated.value);
    }
    if (disabled.present) {
      map['disabled'] = Variable<bool>(disabled.value);
    }
    if (analytics.present) {
      map['analytics'] = Variable<String>(
        $CasksTableTable.$converteranalyticsn.toSql(analytics.value),
      );
    }
    if (generatedDate.present) {
      map['generated_date'] = Variable<String>(generatedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CasksTableCompanion(')
          ..write('token: $token, ')
          ..write('fullToken: $fullToken, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('homepage: $homepage, ')
          ..write('url: $url, ')
          ..write('version: $version, ')
          ..write('autoUpdates: $autoUpdates, ')
          ..write('dependsOn: $dependsOn, ')
          ..write('outdated: $outdated, ')
          ..write('deprecated: $deprecated, ')
          ..write('disabled: $disabled, ')
          ..write('analytics: $analytics, ')
          ..write('generatedDate: $generatedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$CaskModelInsertable implements Insertable<CaskModel> {
  CaskModel _object;
  _$CaskModelInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return CasksTableCompanion(
      token: Value(_object.token),
      fullToken: Value(_object.fullToken),
      name: Value(_object.name),
      desc: Value(_object.desc),
      homepage: Value(_object.homepage),
      url: Value(_object.url),
      version: Value(_object.version),
      autoUpdates: Value(_object.autoUpdates),
      dependsOn: Value(_object.dependsOn),
      outdated: Value(_object.outdated),
      deprecated: Value(_object.deprecated),
      disabled: Value(_object.disabled),
      analytics: Value(_object.analytics),
      generatedDate: Value(_object.generatedDate),
    ).toColumns(false);
  }
}

extension CaskModelToInsertable on CaskModel {
  _$CaskModelInsertable toInsertable() {
    return _$CaskModelInsertable(this);
  }
}

class $FormulaeTableTable extends FormulaeTable
    with TableInfo<$FormulaeTableTable, FormulaModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormulaeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tapMeta = const VerificationMeta('tap');
  @override
  late final GeneratedColumn<String> tap = GeneratedColumn<String>(
    'tap',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _licenseMeta = const VerificationMeta(
    'license',
  );
  @override
  late final GeneratedColumn<String> license = GeneratedColumn<String>(
    'license',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _homepageMeta = const VerificationMeta(
    'homepage',
  );
  @override
  late final GeneratedColumn<String> homepage = GeneratedColumn<String>(
    'homepage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FormulaVersions, String>
  versions = GeneratedColumn<String>(
    'versions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<FormulaVersions>($FormulaeTableTable.$converterversions);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  dependencies = GeneratedColumn<String>(
    'dependencies',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($FormulaeTableTable.$converterdependencies);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  buildDependencies =
      GeneratedColumn<String>(
        'build_dependencies',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>(
        $FormulaeTableTable.$converterbuildDependencies,
      );
  static const VerificationMeta _outdatedMeta = const VerificationMeta(
    'outdated',
  );
  @override
  late final GeneratedColumn<bool> outdated = GeneratedColumn<bool>(
    'outdated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("outdated" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deprecatedMeta = const VerificationMeta(
    'deprecated',
  );
  @override
  late final GeneratedColumn<bool> deprecated = GeneratedColumn<bool>(
    'deprecated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deprecated" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _disabledMeta = const VerificationMeta(
    'disabled',
  );
  @override
  late final GeneratedColumn<bool> disabled = GeneratedColumn<bool>(
    'disabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("disabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  analytics =
      GeneratedColumn<String>(
        'analytics',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        $FormulaeTableTable.$converteranalyticsn,
      );
  static const VerificationMeta _generatedDateMeta = const VerificationMeta(
    'generatedDate',
  );
  @override
  late final GeneratedColumn<String> generatedDate = GeneratedColumn<String>(
    'generated_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    name,
    fullName,
    tap,
    desc,
    license,
    homepage,
    versions,
    dependencies,
    buildDependencies,
    outdated,
    deprecated,
    disabled,
    analytics,
    generatedDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'formulae_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FormulaModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('tap')) {
      context.handle(
        _tapMeta,
        tap.isAcceptableOrUnknown(data['tap']!, _tapMeta),
      );
    } else if (isInserting) {
      context.missing(_tapMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('license')) {
      context.handle(
        _licenseMeta,
        license.isAcceptableOrUnknown(data['license']!, _licenseMeta),
      );
    }
    if (data.containsKey('homepage')) {
      context.handle(
        _homepageMeta,
        homepage.isAcceptableOrUnknown(data['homepage']!, _homepageMeta),
      );
    }
    if (data.containsKey('outdated')) {
      context.handle(
        _outdatedMeta,
        outdated.isAcceptableOrUnknown(data['outdated']!, _outdatedMeta),
      );
    }
    if (data.containsKey('deprecated')) {
      context.handle(
        _deprecatedMeta,
        deprecated.isAcceptableOrUnknown(data['deprecated']!, _deprecatedMeta),
      );
    }
    if (data.containsKey('disabled')) {
      context.handle(
        _disabledMeta,
        disabled.isAcceptableOrUnknown(data['disabled']!, _disabledMeta),
      );
    }
    if (data.containsKey('generated_date')) {
      context.handle(
        _generatedDateMeta,
        generatedDate.isAcceptableOrUnknown(
          data['generated_date']!,
          _generatedDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  FormulaModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormulaModel(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      tap: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tap'],
      )!,
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      )!,
      license: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license'],
      ),
      homepage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}homepage'],
      ),
      versions: $FormulaeTableTable.$converterversions.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}versions'],
        )!,
      ),
      dependencies: $FormulaeTableTable.$converterdependencies.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dependencies'],
        )!,
      ),
      buildDependencies: $FormulaeTableTable.$converterbuildDependencies
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}build_dependencies'],
            )!,
          ),
      outdated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}outdated'],
      )!,
      deprecated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deprecated'],
      )!,
      disabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}disabled'],
      )!,
      analytics: $FormulaeTableTable.$converteranalyticsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}analytics'],
        ),
      ),
      generatedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}generated_date'],
      ),
    );
  }

  @override
  $FormulaeTableTable createAlias(String alias) {
    return $FormulaeTableTable(attachedDatabase, alias);
  }

  static TypeConverter<FormulaVersions, String> $converterversions =
      const FormulaVersionsConverter();
  static TypeConverter<List<String>, String> $converterdependencies =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterbuildDependencies =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converteranalytics =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converteranalyticsn =
      NullAwareTypeConverter.wrap($converteranalytics);
}

class FormulaeTableCompanion extends UpdateCompanion<FormulaModel> {
  final Value<String> name;
  final Value<String> fullName;
  final Value<String> tap;
  final Value<String> desc;
  final Value<String?> license;
  final Value<String?> homepage;
  final Value<FormulaVersions> versions;
  final Value<List<String>> dependencies;
  final Value<List<String>> buildDependencies;
  final Value<bool> outdated;
  final Value<bool> deprecated;
  final Value<bool> disabled;
  final Value<Map<String, dynamic>?> analytics;
  final Value<String?> generatedDate;
  final Value<int> rowid;
  const FormulaeTableCompanion({
    this.name = const Value.absent(),
    this.fullName = const Value.absent(),
    this.tap = const Value.absent(),
    this.desc = const Value.absent(),
    this.license = const Value.absent(),
    this.homepage = const Value.absent(),
    this.versions = const Value.absent(),
    this.dependencies = const Value.absent(),
    this.buildDependencies = const Value.absent(),
    this.outdated = const Value.absent(),
    this.deprecated = const Value.absent(),
    this.disabled = const Value.absent(),
    this.analytics = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FormulaeTableCompanion.insert({
    required String name,
    required String fullName,
    required String tap,
    required String desc,
    this.license = const Value.absent(),
    this.homepage = const Value.absent(),
    required FormulaVersions versions,
    required List<String> dependencies,
    required List<String> buildDependencies,
    this.outdated = const Value.absent(),
    this.deprecated = const Value.absent(),
    this.disabled = const Value.absent(),
    this.analytics = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       fullName = Value(fullName),
       tap = Value(tap),
       desc = Value(desc),
       versions = Value(versions),
       dependencies = Value(dependencies),
       buildDependencies = Value(buildDependencies);
  static Insertable<FormulaModel> custom({
    Expression<String>? name,
    Expression<String>? fullName,
    Expression<String>? tap,
    Expression<String>? desc,
    Expression<String>? license,
    Expression<String>? homepage,
    Expression<String>? versions,
    Expression<String>? dependencies,
    Expression<String>? buildDependencies,
    Expression<bool>? outdated,
    Expression<bool>? deprecated,
    Expression<bool>? disabled,
    Expression<String>? analytics,
    Expression<String>? generatedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (fullName != null) 'full_name': fullName,
      if (tap != null) 'tap': tap,
      if (desc != null) 'desc': desc,
      if (license != null) 'license': license,
      if (homepage != null) 'homepage': homepage,
      if (versions != null) 'versions': versions,
      if (dependencies != null) 'dependencies': dependencies,
      if (buildDependencies != null) 'build_dependencies': buildDependencies,
      if (outdated != null) 'outdated': outdated,
      if (deprecated != null) 'deprecated': deprecated,
      if (disabled != null) 'disabled': disabled,
      if (analytics != null) 'analytics': analytics,
      if (generatedDate != null) 'generated_date': generatedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FormulaeTableCompanion copyWith({
    Value<String>? name,
    Value<String>? fullName,
    Value<String>? tap,
    Value<String>? desc,
    Value<String?>? license,
    Value<String?>? homepage,
    Value<FormulaVersions>? versions,
    Value<List<String>>? dependencies,
    Value<List<String>>? buildDependencies,
    Value<bool>? outdated,
    Value<bool>? deprecated,
    Value<bool>? disabled,
    Value<Map<String, dynamic>?>? analytics,
    Value<String?>? generatedDate,
    Value<int>? rowid,
  }) {
    return FormulaeTableCompanion(
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      tap: tap ?? this.tap,
      desc: desc ?? this.desc,
      license: license ?? this.license,
      homepage: homepage ?? this.homepage,
      versions: versions ?? this.versions,
      dependencies: dependencies ?? this.dependencies,
      buildDependencies: buildDependencies ?? this.buildDependencies,
      outdated: outdated ?? this.outdated,
      deprecated: deprecated ?? this.deprecated,
      disabled: disabled ?? this.disabled,
      analytics: analytics ?? this.analytics,
      generatedDate: generatedDate ?? this.generatedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (tap.present) {
      map['tap'] = Variable<String>(tap.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (license.present) {
      map['license'] = Variable<String>(license.value);
    }
    if (homepage.present) {
      map['homepage'] = Variable<String>(homepage.value);
    }
    if (versions.present) {
      map['versions'] = Variable<String>(
        $FormulaeTableTable.$converterversions.toSql(versions.value),
      );
    }
    if (dependencies.present) {
      map['dependencies'] = Variable<String>(
        $FormulaeTableTable.$converterdependencies.toSql(dependencies.value),
      );
    }
    if (buildDependencies.present) {
      map['build_dependencies'] = Variable<String>(
        $FormulaeTableTable.$converterbuildDependencies.toSql(
          buildDependencies.value,
        ),
      );
    }
    if (outdated.present) {
      map['outdated'] = Variable<bool>(outdated.value);
    }
    if (deprecated.present) {
      map['deprecated'] = Variable<bool>(deprecated.value);
    }
    if (disabled.present) {
      map['disabled'] = Variable<bool>(disabled.value);
    }
    if (analytics.present) {
      map['analytics'] = Variable<String>(
        $FormulaeTableTable.$converteranalyticsn.toSql(analytics.value),
      );
    }
    if (generatedDate.present) {
      map['generated_date'] = Variable<String>(generatedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormulaeTableCompanion(')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('tap: $tap, ')
          ..write('desc: $desc, ')
          ..write('license: $license, ')
          ..write('homepage: $homepage, ')
          ..write('versions: $versions, ')
          ..write('dependencies: $dependencies, ')
          ..write('buildDependencies: $buildDependencies, ')
          ..write('outdated: $outdated, ')
          ..write('deprecated: $deprecated, ')
          ..write('disabled: $disabled, ')
          ..write('analytics: $analytics, ')
          ..write('generatedDate: $generatedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$FormulaModelInsertable implements Insertable<FormulaModel> {
  FormulaModel _object;
  _$FormulaModelInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FormulaeTableCompanion(
      name: Value(_object.name),
      fullName: Value(_object.fullName),
      tap: Value(_object.tap),
      desc: Value(_object.desc),
      license: Value(_object.license),
      homepage: Value(_object.homepage),
      versions: Value(_object.versions),
      dependencies: Value(_object.dependencies),
      buildDependencies: Value(_object.buildDependencies),
      outdated: Value(_object.outdated),
      deprecated: Value(_object.deprecated),
      disabled: Value(_object.disabled),
      analytics: Value(_object.analytics),
      generatedDate: Value(_object.generatedDate),
    ).toColumns(false);
  }
}

extension FormulaModelToInsertable on FormulaModel {
  _$FormulaModelInsertable toInsertable() {
    return _$FormulaModelInsertable(this);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CasksTableTable casksTable = $CasksTableTable(this);
  late final $FormulaeTableTable formulaeTable = $FormulaeTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    casksTable,
    formulaeTable,
  ];
}

typedef $$CasksTableTableCreateCompanionBuilder =
    CasksTableCompanion Function({
      required String token,
      Value<String?> fullToken,
      required List<String> name,
      Value<String?> desc,
      Value<String?> homepage,
      Value<String?> url,
      required String version,
      Value<bool?> autoUpdates,
      Value<Map<String, dynamic>?> dependsOn,
      Value<bool> outdated,
      Value<bool> deprecated,
      Value<bool> disabled,
      Value<Map<String, dynamic>?> analytics,
      Value<String?> generatedDate,
      Value<int> rowid,
    });
typedef $$CasksTableTableUpdateCompanionBuilder =
    CasksTableCompanion Function({
      Value<String> token,
      Value<String?> fullToken,
      Value<List<String>> name,
      Value<String?> desc,
      Value<String?> homepage,
      Value<String?> url,
      Value<String> version,
      Value<bool?> autoUpdates,
      Value<Map<String, dynamic>?> dependsOn,
      Value<bool> outdated,
      Value<bool> deprecated,
      Value<bool> disabled,
      Value<Map<String, dynamic>?> analytics,
      Value<String?> generatedDate,
      Value<int> rowid,
    });

class $$CasksTableTableFilterComposer
    extends Composer<_$AppDatabase, $CasksTableTable> {
  $$CasksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullToken => $composableBuilder(
    column: $table.fullToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get name =>
      $composableBuilder(
        column: $table.name,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homepage => $composableBuilder(
    column: $table.homepage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autoUpdates => $composableBuilder(
    column: $table.autoUpdates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get dependsOn => $composableBuilder(
    column: $table.dependsOn,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get outdated => $composableBuilder(
    column: $table.outdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deprecated => $composableBuilder(
    column: $table.deprecated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get disabled => $composableBuilder(
    column: $table.disabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get analytics => $composableBuilder(
    column: $table.analytics,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CasksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CasksTableTable> {
  $$CasksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullToken => $composableBuilder(
    column: $table.fullToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homepage => $composableBuilder(
    column: $table.homepage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autoUpdates => $composableBuilder(
    column: $table.autoUpdates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dependsOn => $composableBuilder(
    column: $table.dependsOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get outdated => $composableBuilder(
    column: $table.outdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deprecated => $composableBuilder(
    column: $table.deprecated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get disabled => $composableBuilder(
    column: $table.disabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get analytics => $composableBuilder(
    column: $table.analytics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CasksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CasksTableTable> {
  $$CasksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get fullToken =>
      $composableBuilder(column: $table.fullToken, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<String> get homepage =>
      $composableBuilder(column: $table.homepage, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get autoUpdates => $composableBuilder(
    column: $table.autoUpdates,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get dependsOn =>
      $composableBuilder(column: $table.dependsOn, builder: (column) => column);

  GeneratedColumn<bool> get outdated =>
      $composableBuilder(column: $table.outdated, builder: (column) => column);

  GeneratedColumn<bool> get deprecated => $composableBuilder(
    column: $table.deprecated,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get disabled =>
      $composableBuilder(column: $table.disabled, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get analytics =>
      $composableBuilder(column: $table.analytics, builder: (column) => column);

  GeneratedColumn<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => column,
  );
}

class $$CasksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CasksTableTable,
          CaskModel,
          $$CasksTableTableFilterComposer,
          $$CasksTableTableOrderingComposer,
          $$CasksTableTableAnnotationComposer,
          $$CasksTableTableCreateCompanionBuilder,
          $$CasksTableTableUpdateCompanionBuilder,
          (
            CaskModel,
            BaseReferences<_$AppDatabase, $CasksTableTable, CaskModel>,
          ),
          CaskModel,
          PrefetchHooks Function()
        > {
  $$CasksTableTableTableManager(_$AppDatabase db, $CasksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CasksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CasksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CasksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> token = const Value.absent(),
                Value<String?> fullToken = const Value.absent(),
                Value<List<String>> name = const Value.absent(),
                Value<String?> desc = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<bool?> autoUpdates = const Value.absent(),
                Value<Map<String, dynamic>?> dependsOn = const Value.absent(),
                Value<bool> outdated = const Value.absent(),
                Value<bool> deprecated = const Value.absent(),
                Value<bool> disabled = const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CasksTableCompanion(
                token: token,
                fullToken: fullToken,
                name: name,
                desc: desc,
                homepage: homepage,
                url: url,
                version: version,
                autoUpdates: autoUpdates,
                dependsOn: dependsOn,
                outdated: outdated,
                deprecated: deprecated,
                disabled: disabled,
                analytics: analytics,
                generatedDate: generatedDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String token,
                Value<String?> fullToken = const Value.absent(),
                required List<String> name,
                Value<String?> desc = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<String?> url = const Value.absent(),
                required String version,
                Value<bool?> autoUpdates = const Value.absent(),
                Value<Map<String, dynamic>?> dependsOn = const Value.absent(),
                Value<bool> outdated = const Value.absent(),
                Value<bool> deprecated = const Value.absent(),
                Value<bool> disabled = const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CasksTableCompanion.insert(
                token: token,
                fullToken: fullToken,
                name: name,
                desc: desc,
                homepage: homepage,
                url: url,
                version: version,
                autoUpdates: autoUpdates,
                dependsOn: dependsOn,
                outdated: outdated,
                deprecated: deprecated,
                disabled: disabled,
                analytics: analytics,
                generatedDate: generatedDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CasksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CasksTableTable,
      CaskModel,
      $$CasksTableTableFilterComposer,
      $$CasksTableTableOrderingComposer,
      $$CasksTableTableAnnotationComposer,
      $$CasksTableTableCreateCompanionBuilder,
      $$CasksTableTableUpdateCompanionBuilder,
      (CaskModel, BaseReferences<_$AppDatabase, $CasksTableTable, CaskModel>),
      CaskModel,
      PrefetchHooks Function()
    >;
typedef $$FormulaeTableTableCreateCompanionBuilder =
    FormulaeTableCompanion Function({
      required String name,
      required String fullName,
      required String tap,
      required String desc,
      Value<String?> license,
      Value<String?> homepage,
      required FormulaVersions versions,
      required List<String> dependencies,
      required List<String> buildDependencies,
      Value<bool> outdated,
      Value<bool> deprecated,
      Value<bool> disabled,
      Value<Map<String, dynamic>?> analytics,
      Value<String?> generatedDate,
      Value<int> rowid,
    });
typedef $$FormulaeTableTableUpdateCompanionBuilder =
    FormulaeTableCompanion Function({
      Value<String> name,
      Value<String> fullName,
      Value<String> tap,
      Value<String> desc,
      Value<String?> license,
      Value<String?> homepage,
      Value<FormulaVersions> versions,
      Value<List<String>> dependencies,
      Value<List<String>> buildDependencies,
      Value<bool> outdated,
      Value<bool> deprecated,
      Value<bool> disabled,
      Value<Map<String, dynamic>?> analytics,
      Value<String?> generatedDate,
      Value<int> rowid,
    });

class $$FormulaeTableTableFilterComposer
    extends Composer<_$AppDatabase, $FormulaeTableTable> {
  $$FormulaeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tap => $composableBuilder(
    column: $table.tap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homepage => $composableBuilder(
    column: $table.homepage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FormulaVersions, FormulaVersions, String>
  get versions => $composableBuilder(
    column: $table.versions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get dependencies => $composableBuilder(
    column: $table.dependencies,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get buildDependencies => $composableBuilder(
    column: $table.buildDependencies,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get outdated => $composableBuilder(
    column: $table.outdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deprecated => $composableBuilder(
    column: $table.deprecated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get disabled => $composableBuilder(
    column: $table.disabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get analytics => $composableBuilder(
    column: $table.analytics,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FormulaeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FormulaeTableTable> {
  $$FormulaeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tap => $composableBuilder(
    column: $table.tap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homepage => $composableBuilder(
    column: $table.homepage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get versions => $composableBuilder(
    column: $table.versions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dependencies => $composableBuilder(
    column: $table.dependencies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buildDependencies => $composableBuilder(
    column: $table.buildDependencies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get outdated => $composableBuilder(
    column: $table.outdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deprecated => $composableBuilder(
    column: $table.deprecated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get disabled => $composableBuilder(
    column: $table.disabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get analytics => $composableBuilder(
    column: $table.analytics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FormulaeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FormulaeTableTable> {
  $$FormulaeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get tap =>
      $composableBuilder(column: $table.tap, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<String> get license =>
      $composableBuilder(column: $table.license, builder: (column) => column);

  GeneratedColumn<String> get homepage =>
      $composableBuilder(column: $table.homepage, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FormulaVersions, String> get versions =>
      $composableBuilder(column: $table.versions, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get dependencies =>
      $composableBuilder(
        column: $table.dependencies,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>, String>
  get buildDependencies => $composableBuilder(
    column: $table.buildDependencies,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get outdated =>
      $composableBuilder(column: $table.outdated, builder: (column) => column);

  GeneratedColumn<bool> get deprecated => $composableBuilder(
    column: $table.deprecated,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get disabled =>
      $composableBuilder(column: $table.disabled, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get analytics =>
      $composableBuilder(column: $table.analytics, builder: (column) => column);

  GeneratedColumn<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => column,
  );
}

class $$FormulaeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FormulaeTableTable,
          FormulaModel,
          $$FormulaeTableTableFilterComposer,
          $$FormulaeTableTableOrderingComposer,
          $$FormulaeTableTableAnnotationComposer,
          $$FormulaeTableTableCreateCompanionBuilder,
          $$FormulaeTableTableUpdateCompanionBuilder,
          (
            FormulaModel,
            BaseReferences<_$AppDatabase, $FormulaeTableTable, FormulaModel>,
          ),
          FormulaModel,
          PrefetchHooks Function()
        > {
  $$FormulaeTableTableTableManager(_$AppDatabase db, $FormulaeTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormulaeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormulaeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormulaeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> tap = const Value.absent(),
                Value<String> desc = const Value.absent(),
                Value<String?> license = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<FormulaVersions> versions = const Value.absent(),
                Value<List<String>> dependencies = const Value.absent(),
                Value<List<String>> buildDependencies = const Value.absent(),
                Value<bool> outdated = const Value.absent(),
                Value<bool> deprecated = const Value.absent(),
                Value<bool> disabled = const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FormulaeTableCompanion(
                name: name,
                fullName: fullName,
                tap: tap,
                desc: desc,
                license: license,
                homepage: homepage,
                versions: versions,
                dependencies: dependencies,
                buildDependencies: buildDependencies,
                outdated: outdated,
                deprecated: deprecated,
                disabled: disabled,
                analytics: analytics,
                generatedDate: generatedDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required String fullName,
                required String tap,
                required String desc,
                Value<String?> license = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                required FormulaVersions versions,
                required List<String> dependencies,
                required List<String> buildDependencies,
                Value<bool> outdated = const Value.absent(),
                Value<bool> deprecated = const Value.absent(),
                Value<bool> disabled = const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FormulaeTableCompanion.insert(
                name: name,
                fullName: fullName,
                tap: tap,
                desc: desc,
                license: license,
                homepage: homepage,
                versions: versions,
                dependencies: dependencies,
                buildDependencies: buildDependencies,
                outdated: outdated,
                deprecated: deprecated,
                disabled: disabled,
                analytics: analytics,
                generatedDate: generatedDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FormulaeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FormulaeTableTable,
      FormulaModel,
      $$FormulaeTableTableFilterComposer,
      $$FormulaeTableTableOrderingComposer,
      $$FormulaeTableTableAnnotationComposer,
      $$FormulaeTableTableCreateCompanionBuilder,
      $$FormulaeTableTableUpdateCompanionBuilder,
      (
        FormulaModel,
        BaseReferences<_$AppDatabase, $FormulaeTableTable, FormulaModel>,
      ),
      FormulaModel,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CasksTableTableTableManager get casksTable =>
      $$CasksTableTableTableManager(_db, _db.casksTable);
  $$FormulaeTableTableTableManager get formulaeTable =>
      $$FormulaeTableTableTableManager(_db, _db.formulaeTable);
}
