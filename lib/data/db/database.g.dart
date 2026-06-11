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
  static const VerificationMeta _tapMeta = const VerificationMeta('tap');
  @override
  late final GeneratedColumn<String> tap = GeneratedColumn<String>(
    'tap',
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
  @override
  late final GeneratedColumnWithTypeConverter<
    List<Map<String, dynamic>>?,
    String
  >
  artifacts =
      GeneratedColumn<String>(
        'artifacts',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Map<String, dynamic>>?>(
        $CasksTableTable.$converterartifactsn,
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
  static const VerificationMeta _isInstalledMeta = const VerificationMeta(
    'isInstalled',
  );
  @override
  late final GeneratedColumn<bool> isInstalled = GeneratedColumn<bool>(
    'is_installed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_installed" IN (0, 1))',
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
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  variations =
      GeneratedColumn<String>(
        'variations',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        $CasksTableTable.$convertervariationsn,
      );
  static const VerificationMeta _installs30dMeta = const VerificationMeta(
    'installs30d',
  );
  @override
  late final GeneratedColumn<int> installs30d = GeneratedColumn<int>(
    'installs30d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installs90dMeta = const VerificationMeta(
    'installs90d',
  );
  @override
  late final GeneratedColumn<int> installs90d = GeneratedColumn<int>(
    'installs90d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installs365dMeta = const VerificationMeta(
    'installs365d',
  );
  @override
  late final GeneratedColumn<int> installs365d = GeneratedColumn<int>(
    'installs365d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _installedSizeMeta = const VerificationMeta(
    'installedSize',
  );
  @override
  late final GeneratedColumn<String> installedSize = GeneratedColumn<String>(
    'installed_size',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installedOnTimestampMeta =
      const VerificationMeta('installedOnTimestamp');
  @override
  late final GeneratedColumn<int> installedOnTimestamp = GeneratedColumn<int>(
    'installed_on_timestamp',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    token,
    fullToken,
    tap,
    name,
    desc,
    homepage,
    url,
    version,
    artifacts,
    autoUpdates,
    dependsOn,
    outdated,
    deprecated,
    disabled,
    isInstalled,
    analytics,
    variations,
    installs30d,
    installs90d,
    installs365d,
    generatedDate,
    installedSize,
    installedOnTimestamp,
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
    if (data.containsKey('tap')) {
      context.handle(
        _tapMeta,
        tap.isAcceptableOrUnknown(data['tap']!, _tapMeta),
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
    if (data.containsKey('is_installed')) {
      context.handle(
        _isInstalledMeta,
        isInstalled.isAcceptableOrUnknown(
          data['is_installed']!,
          _isInstalledMeta,
        ),
      );
    }
    if (data.containsKey('installs30d')) {
      context.handle(
        _installs30dMeta,
        installs30d.isAcceptableOrUnknown(
          data['installs30d']!,
          _installs30dMeta,
        ),
      );
    }
    if (data.containsKey('installs90d')) {
      context.handle(
        _installs90dMeta,
        installs90d.isAcceptableOrUnknown(
          data['installs90d']!,
          _installs90dMeta,
        ),
      );
    }
    if (data.containsKey('installs365d')) {
      context.handle(
        _installs365dMeta,
        installs365d.isAcceptableOrUnknown(
          data['installs365d']!,
          _installs365dMeta,
        ),
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
    if (data.containsKey('installed_size')) {
      context.handle(
        _installedSizeMeta,
        installedSize.isAcceptableOrUnknown(
          data['installed_size']!,
          _installedSizeMeta,
        ),
      );
    }
    if (data.containsKey('installed_on_timestamp')) {
      context.handle(
        _installedOnTimestampMeta,
        installedOnTimestamp.isAcceptableOrUnknown(
          data['installed_on_timestamp']!,
          _installedOnTimestampMeta,
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
      tap: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tap'],
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
      artifacts: $CasksTableTable.$converterartifactsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}artifacts'],
        ),
      ),
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
      isInstalled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_installed'],
      )!,
      variations: $CasksTableTable.$convertervariationsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}variations'],
        ),
      ),
      analytics: $CasksTableTable.$converteranalyticsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}analytics'],
        ),
      ),
      installs30d: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installs30d'],
      ),
      installs90d: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installs90d'],
      ),
      installs365d: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installs365d'],
      ),
      generatedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}generated_date'],
      ),
      installedSize: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}installed_size'],
      ),
      installedOnTimestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installed_on_timestamp'],
      ),
    );
  }

  @override
  $CasksTableTable createAlias(String alias) {
    return $CasksTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertername =
      const StringListConverter();
  static TypeConverter<List<Map<String, dynamic>>, String> $converterartifacts =
      const MapListConverter();
  static TypeConverter<List<Map<String, dynamic>>?, String?>
  $converterartifactsn = NullAwareTypeConverter.wrap($converterartifacts);
  static TypeConverter<Map<String, dynamic>, String> $converterdependsOn =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterdependsOnn =
      NullAwareTypeConverter.wrap($converterdependsOn);
  static TypeConverter<Map<String, dynamic>, String> $converteranalytics =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converteranalyticsn =
      NullAwareTypeConverter.wrap($converteranalytics);
  static TypeConverter<Map<String, dynamic>, String> $convertervariations =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertervariationsn =
      NullAwareTypeConverter.wrap($convertervariations);
}

class CasksTableCompanion extends UpdateCompanion<CaskModel> {
  final Value<String> token;
  final Value<String?> fullToken;
  final Value<String?> tap;
  final Value<List<String>> name;
  final Value<String?> desc;
  final Value<String?> homepage;
  final Value<String?> url;
  final Value<String> version;
  final Value<List<Map<String, dynamic>>?> artifacts;
  final Value<bool?> autoUpdates;
  final Value<Map<String, dynamic>?> dependsOn;
  final Value<bool> outdated;
  final Value<bool> deprecated;
  final Value<bool> disabled;
  final Value<bool> isInstalled;
  final Value<Map<String, dynamic>?> analytics;
  final Value<Map<String, dynamic>?> variations;
  final Value<int?> installs30d;
  final Value<int?> installs90d;
  final Value<int?> installs365d;
  final Value<String?> generatedDate;
  final Value<String?> installedSize;
  final Value<int?> installedOnTimestamp;
  final Value<int> rowid;
  const CasksTableCompanion({
    this.token = const Value.absent(),
    this.fullToken = const Value.absent(),
    this.tap = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.homepage = const Value.absent(),
    this.url = const Value.absent(),
    this.version = const Value.absent(),
    this.artifacts = const Value.absent(),
    this.autoUpdates = const Value.absent(),
    this.dependsOn = const Value.absent(),
    this.outdated = const Value.absent(),
    this.deprecated = const Value.absent(),
    this.disabled = const Value.absent(),
    this.isInstalled = const Value.absent(),
    this.analytics = const Value.absent(),
    this.variations = const Value.absent(),
    this.installs30d = const Value.absent(),
    this.installs90d = const Value.absent(),
    this.installs365d = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.installedSize = const Value.absent(),
    this.installedOnTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CasksTableCompanion.insert({
    required String token,
    this.fullToken = const Value.absent(),
    this.tap = const Value.absent(),
    required List<String> name,
    this.desc = const Value.absent(),
    this.homepage = const Value.absent(),
    this.url = const Value.absent(),
    required String version,
    this.artifacts = const Value.absent(),
    this.autoUpdates = const Value.absent(),
    this.dependsOn = const Value.absent(),
    this.outdated = const Value.absent(),
    this.deprecated = const Value.absent(),
    this.disabled = const Value.absent(),
    this.isInstalled = const Value.absent(),
    this.analytics = const Value.absent(),
    this.variations = const Value.absent(),
    this.installs30d = const Value.absent(),
    this.installs90d = const Value.absent(),
    this.installs365d = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.installedSize = const Value.absent(),
    this.installedOnTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : token = Value(token),
       name = Value(name),
       version = Value(version);
  static Insertable<CaskModel> custom({
    Expression<String>? token,
    Expression<String>? fullToken,
    Expression<String>? tap,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? homepage,
    Expression<String>? url,
    Expression<String>? version,
    Expression<String>? artifacts,
    Expression<bool>? autoUpdates,
    Expression<String>? dependsOn,
    Expression<bool>? outdated,
    Expression<bool>? deprecated,
    Expression<bool>? disabled,
    Expression<bool>? isInstalled,
    Expression<String>? analytics,
    Expression<String>? variations,
    Expression<int>? installs30d,
    Expression<int>? installs90d,
    Expression<int>? installs365d,
    Expression<String>? generatedDate,
    Expression<String>? installedSize,
    Expression<int>? installedOnTimestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (token != null) 'token': token,
      if (fullToken != null) 'full_token': fullToken,
      if (tap != null) 'tap': tap,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (homepage != null) 'homepage': homepage,
      if (url != null) 'url': url,
      if (version != null) 'version': version,
      if (artifacts != null) 'artifacts': artifacts,
      if (autoUpdates != null) 'auto_updates': autoUpdates,
      if (dependsOn != null) 'depends_on': dependsOn,
      if (outdated != null) 'outdated': outdated,
      if (deprecated != null) 'deprecated': deprecated,
      if (disabled != null) 'disabled': disabled,
      if (isInstalled != null) 'is_installed': isInstalled,
      if (analytics != null) 'analytics': analytics,
      if (variations != null) 'variations': variations,
      if (installs30d != null) 'installs30d': installs30d,
      if (installs90d != null) 'installs90d': installs90d,
      if (installs365d != null) 'installs365d': installs365d,
      if (generatedDate != null) 'generated_date': generatedDate,
      if (installedSize != null) 'installed_size': installedSize,
      if (installedOnTimestamp != null)
        'installed_on_timestamp': installedOnTimestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CasksTableCompanion copyWith({
    Value<String>? token,
    Value<String?>? fullToken,
    Value<String?>? tap,
    Value<List<String>>? name,
    Value<String?>? desc,
    Value<String?>? homepage,
    Value<String?>? url,
    Value<String>? version,
    Value<List<Map<String, dynamic>>?>? artifacts,
    Value<bool?>? autoUpdates,
    Value<Map<String, dynamic>?>? dependsOn,
    Value<bool>? outdated,
    Value<bool>? deprecated,
    Value<bool>? disabled,
    Value<bool>? isInstalled,
    Value<Map<String, dynamic>?>? analytics,
    Value<Map<String, dynamic>?>? variations,
    Value<int?>? installs30d,
    Value<int?>? installs90d,
    Value<int?>? installs365d,
    Value<String?>? generatedDate,
    Value<String?>? installedSize,
    Value<int?>? installedOnTimestamp,
    Value<int>? rowid,
  }) {
    return CasksTableCompanion(
      token: token ?? this.token,
      fullToken: fullToken ?? this.fullToken,
      tap: tap ?? this.tap,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      homepage: homepage ?? this.homepage,
      url: url ?? this.url,
      version: version ?? this.version,
      artifacts: artifacts ?? this.artifacts,
      autoUpdates: autoUpdates ?? this.autoUpdates,
      dependsOn: dependsOn ?? this.dependsOn,
      outdated: outdated ?? this.outdated,
      deprecated: deprecated ?? this.deprecated,
      disabled: disabled ?? this.disabled,
      isInstalled: isInstalled ?? this.isInstalled,
      analytics: analytics ?? this.analytics,
      variations: variations ?? this.variations,
      installs30d: installs30d ?? this.installs30d,
      installs90d: installs90d ?? this.installs90d,
      installs365d: installs365d ?? this.installs365d,
      generatedDate: generatedDate ?? this.generatedDate,
      installedSize: installedSize ?? this.installedSize,
      installedOnTimestamp: installedOnTimestamp ?? this.installedOnTimestamp,
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
    if (tap.present) {
      map['tap'] = Variable<String>(tap.value);
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
    if (artifacts.present) {
      map['artifacts'] = Variable<String>(
        $CasksTableTable.$converterartifactsn.toSql(artifacts.value),
      );
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
    if (isInstalled.present) {
      map['is_installed'] = Variable<bool>(isInstalled.value);
    }
    if (analytics.present) {
      map['analytics'] = Variable<String>(
        $CasksTableTable.$converteranalyticsn.toSql(analytics.value),
      );
    }
    if (variations.present) {
      map['variations'] = Variable<String>(
        $CasksTableTable.$convertervariationsn.toSql(variations.value),
      );
    }
    if (installs30d.present) {
      map['installs30d'] = Variable<int>(installs30d.value);
    }
    if (installs90d.present) {
      map['installs90d'] = Variable<int>(installs90d.value);
    }
    if (installs365d.present) {
      map['installs365d'] = Variable<int>(installs365d.value);
    }
    if (generatedDate.present) {
      map['generated_date'] = Variable<String>(generatedDate.value);
    }
    if (installedSize.present) {
      map['installed_size'] = Variable<String>(installedSize.value);
    }
    if (installedOnTimestamp.present) {
      map['installed_on_timestamp'] = Variable<int>(installedOnTimestamp.value);
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
          ..write('tap: $tap, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('homepage: $homepage, ')
          ..write('url: $url, ')
          ..write('version: $version, ')
          ..write('artifacts: $artifacts, ')
          ..write('autoUpdates: $autoUpdates, ')
          ..write('dependsOn: $dependsOn, ')
          ..write('outdated: $outdated, ')
          ..write('deprecated: $deprecated, ')
          ..write('disabled: $disabled, ')
          ..write('isInstalled: $isInstalled, ')
          ..write('analytics: $analytics, ')
          ..write('variations: $variations, ')
          ..write('installs30d: $installs30d, ')
          ..write('installs90d: $installs90d, ')
          ..write('installs365d: $installs365d, ')
          ..write('generatedDate: $generatedDate, ')
          ..write('installedSize: $installedSize, ')
          ..write('installedOnTimestamp: $installedOnTimestamp, ')
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
      tap: Value(_object.tap),
      name: Value(_object.name),
      desc: Value(_object.desc),
      homepage: Value(_object.homepage),
      url: Value(_object.url),
      version: Value(_object.version),
      artifacts: Value(_object.artifacts),
      autoUpdates: Value(_object.autoUpdates),
      dependsOn: Value(_object.dependsOn),
      outdated: Value(_object.outdated),
      deprecated: Value(_object.deprecated),
      disabled: Value(_object.disabled),
      isInstalled: Value(_object.isInstalled),
      analytics: Value(_object.analytics),
      variations: Value(_object.variations),
      installs30d: Value(_object.installs30d),
      installs90d: Value(_object.installs90d),
      installs365d: Value(_object.installs365d),
      generatedDate: Value(_object.generatedDate),
      installedSize: Value(_object.installedSize),
      installedOnTimestamp: Value(_object.installedOnTimestamp),
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
  static const VerificationMeta _isInstalledMeta = const VerificationMeta(
    'isInstalled',
  );
  @override
  late final GeneratedColumn<bool> isInstalled = GeneratedColumn<bool>(
    'is_installed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_installed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<
    List<Map<String, dynamic>>?,
    String
  >
  requirements =
      GeneratedColumn<String>(
        'requirements',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Map<String, dynamic>>?>(
        $FormulaeTableTable.$converterrequirementsn,
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
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  bottle = GeneratedColumn<String>(
    'bottle',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($FormulaeTableTable.$converterbottlen);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  variations =
      GeneratedColumn<String>(
        'variations',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        $FormulaeTableTable.$convertervariationsn,
      );
  static const VerificationMeta _installs30dMeta = const VerificationMeta(
    'installs30d',
  );
  @override
  late final GeneratedColumn<int> installs30d = GeneratedColumn<int>(
    'installs30d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installs90dMeta = const VerificationMeta(
    'installs90d',
  );
  @override
  late final GeneratedColumn<int> installs90d = GeneratedColumn<int>(
    'installs90d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installs365dMeta = const VerificationMeta(
    'installs365d',
  );
  @override
  late final GeneratedColumn<int> installs365d = GeneratedColumn<int>(
    'installs365d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _installedSizeMeta = const VerificationMeta(
    'installedSize',
  );
  @override
  late final GeneratedColumn<int> installedSize = GeneratedColumn<int>(
    'installed_size',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installedOnTimestampMeta =
      const VerificationMeta('installedOnTimestamp');
  @override
  late final GeneratedColumn<int> installedOnTimestamp = GeneratedColumn<int>(
    'installed_on_timestamp',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _builtAsBottleMeta = const VerificationMeta(
    'builtAsBottle',
  );
  @override
  late final GeneratedColumn<bool> builtAsBottle = GeneratedColumn<bool>(
    'built_as_bottle',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("built_as_bottle" IN (0, 1))',
    ),
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
    isInstalled,
    requirements,
    analytics,
    bottle,
    variations,
    installs30d,
    installs90d,
    installs365d,
    generatedDate,
    installedSize,
    installedOnTimestamp,
    builtAsBottle,
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
    if (data.containsKey('is_installed')) {
      context.handle(
        _isInstalledMeta,
        isInstalled.isAcceptableOrUnknown(
          data['is_installed']!,
          _isInstalledMeta,
        ),
      );
    }
    if (data.containsKey('installs30d')) {
      context.handle(
        _installs30dMeta,
        installs30d.isAcceptableOrUnknown(
          data['installs30d']!,
          _installs30dMeta,
        ),
      );
    }
    if (data.containsKey('installs90d')) {
      context.handle(
        _installs90dMeta,
        installs90d.isAcceptableOrUnknown(
          data['installs90d']!,
          _installs90dMeta,
        ),
      );
    }
    if (data.containsKey('installs365d')) {
      context.handle(
        _installs365dMeta,
        installs365d.isAcceptableOrUnknown(
          data['installs365d']!,
          _installs365dMeta,
        ),
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
    if (data.containsKey('installed_size')) {
      context.handle(
        _installedSizeMeta,
        installedSize.isAcceptableOrUnknown(
          data['installed_size']!,
          _installedSizeMeta,
        ),
      );
    }
    if (data.containsKey('installed_on_timestamp')) {
      context.handle(
        _installedOnTimestampMeta,
        installedOnTimestamp.isAcceptableOrUnknown(
          data['installed_on_timestamp']!,
          _installedOnTimestampMeta,
        ),
      );
    }
    if (data.containsKey('built_as_bottle')) {
      context.handle(
        _builtAsBottleMeta,
        builtAsBottle.isAcceptableOrUnknown(
          data['built_as_bottle']!,
          _builtAsBottleMeta,
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
      isInstalled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_installed'],
      )!,
      requirements: $FormulaeTableTable.$converterrequirementsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}requirements'],
        ),
      ),
      bottle: $FormulaeTableTable.$converterbottlen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bottle'],
        ),
      ),
      variations: $FormulaeTableTable.$convertervariationsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}variations'],
        ),
      ),
      analytics: $FormulaeTableTable.$converteranalyticsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}analytics'],
        ),
      ),
      installs30d: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installs30d'],
      ),
      installs90d: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installs90d'],
      ),
      installs365d: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installs365d'],
      ),
      generatedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}generated_date'],
      ),
      installedSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installed_size'],
      ),
      installedOnTimestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installed_on_timestamp'],
      ),
      builtAsBottle: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}built_as_bottle'],
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
  static TypeConverter<List<Map<String, dynamic>>, String>
  $converterrequirements = const MapListConverter();
  static TypeConverter<List<Map<String, dynamic>>?, String?>
  $converterrequirementsn = NullAwareTypeConverter.wrap($converterrequirements);
  static TypeConverter<Map<String, dynamic>, String> $converteranalytics =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converteranalyticsn =
      NullAwareTypeConverter.wrap($converteranalytics);
  static TypeConverter<Map<String, dynamic>, String> $converterbottle =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterbottlen =
      NullAwareTypeConverter.wrap($converterbottle);
  static TypeConverter<Map<String, dynamic>, String> $convertervariations =
      const MapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertervariationsn =
      NullAwareTypeConverter.wrap($convertervariations);
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
  final Value<bool> isInstalled;
  final Value<List<Map<String, dynamic>>?> requirements;
  final Value<Map<String, dynamic>?> analytics;
  final Value<Map<String, dynamic>?> bottle;
  final Value<Map<String, dynamic>?> variations;
  final Value<int?> installs30d;
  final Value<int?> installs90d;
  final Value<int?> installs365d;
  final Value<String?> generatedDate;
  final Value<int?> installedSize;
  final Value<int?> installedOnTimestamp;
  final Value<bool?> builtAsBottle;
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
    this.isInstalled = const Value.absent(),
    this.requirements = const Value.absent(),
    this.analytics = const Value.absent(),
    this.bottle = const Value.absent(),
    this.variations = const Value.absent(),
    this.installs30d = const Value.absent(),
    this.installs90d = const Value.absent(),
    this.installs365d = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.installedSize = const Value.absent(),
    this.installedOnTimestamp = const Value.absent(),
    this.builtAsBottle = const Value.absent(),
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
    this.isInstalled = const Value.absent(),
    this.requirements = const Value.absent(),
    this.analytics = const Value.absent(),
    this.bottle = const Value.absent(),
    this.variations = const Value.absent(),
    this.installs30d = const Value.absent(),
    this.installs90d = const Value.absent(),
    this.installs365d = const Value.absent(),
    this.generatedDate = const Value.absent(),
    this.installedSize = const Value.absent(),
    this.installedOnTimestamp = const Value.absent(),
    this.builtAsBottle = const Value.absent(),
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
    Expression<bool>? isInstalled,
    Expression<String>? requirements,
    Expression<String>? analytics,
    Expression<String>? bottle,
    Expression<String>? variations,
    Expression<int>? installs30d,
    Expression<int>? installs90d,
    Expression<int>? installs365d,
    Expression<String>? generatedDate,
    Expression<int>? installedSize,
    Expression<int>? installedOnTimestamp,
    Expression<bool>? builtAsBottle,
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
      if (isInstalled != null) 'is_installed': isInstalled,
      if (requirements != null) 'requirements': requirements,
      if (analytics != null) 'analytics': analytics,
      if (bottle != null) 'bottle': bottle,
      if (variations != null) 'variations': variations,
      if (installs30d != null) 'installs30d': installs30d,
      if (installs90d != null) 'installs90d': installs90d,
      if (installs365d != null) 'installs365d': installs365d,
      if (generatedDate != null) 'generated_date': generatedDate,
      if (installedSize != null) 'installed_size': installedSize,
      if (installedOnTimestamp != null)
        'installed_on_timestamp': installedOnTimestamp,
      if (builtAsBottle != null) 'built_as_bottle': builtAsBottle,
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
    Value<bool>? isInstalled,
    Value<List<Map<String, dynamic>>?>? requirements,
    Value<Map<String, dynamic>?>? analytics,
    Value<Map<String, dynamic>?>? bottle,
    Value<Map<String, dynamic>?>? variations,
    Value<int?>? installs30d,
    Value<int?>? installs90d,
    Value<int?>? installs365d,
    Value<String?>? generatedDate,
    Value<int?>? installedSize,
    Value<int?>? installedOnTimestamp,
    Value<bool?>? builtAsBottle,
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
      isInstalled: isInstalled ?? this.isInstalled,
      requirements: requirements ?? this.requirements,
      analytics: analytics ?? this.analytics,
      bottle: bottle ?? this.bottle,
      variations: variations ?? this.variations,
      installs30d: installs30d ?? this.installs30d,
      installs90d: installs90d ?? this.installs90d,
      installs365d: installs365d ?? this.installs365d,
      generatedDate: generatedDate ?? this.generatedDate,
      installedSize: installedSize ?? this.installedSize,
      installedOnTimestamp: installedOnTimestamp ?? this.installedOnTimestamp,
      builtAsBottle: builtAsBottle ?? this.builtAsBottle,
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
    if (isInstalled.present) {
      map['is_installed'] = Variable<bool>(isInstalled.value);
    }
    if (requirements.present) {
      map['requirements'] = Variable<String>(
        $FormulaeTableTable.$converterrequirementsn.toSql(requirements.value),
      );
    }
    if (analytics.present) {
      map['analytics'] = Variable<String>(
        $FormulaeTableTable.$converteranalyticsn.toSql(analytics.value),
      );
    }
    if (bottle.present) {
      map['bottle'] = Variable<String>(
        $FormulaeTableTable.$converterbottlen.toSql(bottle.value),
      );
    }
    if (variations.present) {
      map['variations'] = Variable<String>(
        $FormulaeTableTable.$convertervariationsn.toSql(variations.value),
      );
    }
    if (installs30d.present) {
      map['installs30d'] = Variable<int>(installs30d.value);
    }
    if (installs90d.present) {
      map['installs90d'] = Variable<int>(installs90d.value);
    }
    if (installs365d.present) {
      map['installs365d'] = Variable<int>(installs365d.value);
    }
    if (generatedDate.present) {
      map['generated_date'] = Variable<String>(generatedDate.value);
    }
    if (installedSize.present) {
      map['installed_size'] = Variable<int>(installedSize.value);
    }
    if (installedOnTimestamp.present) {
      map['installed_on_timestamp'] = Variable<int>(installedOnTimestamp.value);
    }
    if (builtAsBottle.present) {
      map['built_as_bottle'] = Variable<bool>(builtAsBottle.value);
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
          ..write('isInstalled: $isInstalled, ')
          ..write('requirements: $requirements, ')
          ..write('analytics: $analytics, ')
          ..write('bottle: $bottle, ')
          ..write('variations: $variations, ')
          ..write('installs30d: $installs30d, ')
          ..write('installs90d: $installs90d, ')
          ..write('installs365d: $installs365d, ')
          ..write('generatedDate: $generatedDate, ')
          ..write('installedSize: $installedSize, ')
          ..write('installedOnTimestamp: $installedOnTimestamp, ')
          ..write('builtAsBottle: $builtAsBottle, ')
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
      isInstalled: Value(_object.isInstalled),
      requirements: Value(_object.requirements),
      analytics: Value(_object.analytics),
      bottle: Value(_object.bottle),
      variations: Value(_object.variations),
      installs30d: Value(_object.installs30d),
      installs90d: Value(_object.installs90d),
      installs365d: Value(_object.installs365d),
      generatedDate: Value(_object.generatedDate),
      installedSize: Value(_object.installedSize),
      installedOnTimestamp: Value(_object.installedOnTimestamp),
      builtAsBottle: Value(_object.builtAsBottle),
    ).toColumns(false);
  }
}

extension FormulaModelToInsertable on FormulaModel {
  _$FormulaModelInsertable toInsertable() {
    return _$FormulaModelInsertable(this);
  }
}

class $IconCacheTableTable extends IconCacheTable
    with TableInfo<$IconCacheTableTable, ResolvedIcon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IconCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _packageNameMeta = const VerificationMeta(
    'packageName',
  );
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
    'package_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSvgMeta = const VerificationMeta('isSvg');
  @override
  late final GeneratedColumn<bool> isSvg = GeneratedColumn<bool>(
    'is_svg',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_svg" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _resolvedAtMeta = const VerificationMeta(
    'resolvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
    'resolved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    packageName,
    iconUrl,
    isSvg,
    resolvedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'icon_cache_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResolvedIcon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('package_name')) {
      context.handle(
        _packageNameMeta,
        packageName.isAcceptableOrUnknown(
          data['package_name']!,
          _packageNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    }
    if (data.containsKey('is_svg')) {
      context.handle(
        _isSvgMeta,
        isSvg.isAcceptableOrUnknown(data['is_svg']!, _isSvgMeta),
      );
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
        _resolvedAtMeta,
        resolvedAt.isAcceptableOrUnknown(data['resolved_at']!, _resolvedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_resolvedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {packageName};
  @override
  ResolvedIcon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResolvedIcon(
      packageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_name'],
      )!,
      iconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_url'],
      ),
      isSvg: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_svg'],
      )!,
      resolvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}resolved_at'],
      )!,
    );
  }

  @override
  $IconCacheTableTable createAlias(String alias) {
    return $IconCacheTableTable(attachedDatabase, alias);
  }
}

class IconCacheTableCompanion extends UpdateCompanion<ResolvedIcon> {
  final Value<String> packageName;
  final Value<String?> iconUrl;
  final Value<bool> isSvg;
  final Value<DateTime> resolvedAt;
  final Value<int> rowid;
  const IconCacheTableCompanion({
    this.packageName = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.isSvg = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IconCacheTableCompanion.insert({
    required String packageName,
    this.iconUrl = const Value.absent(),
    this.isSvg = const Value.absent(),
    required DateTime resolvedAt,
    this.rowid = const Value.absent(),
  }) : packageName = Value(packageName),
       resolvedAt = Value(resolvedAt);
  static Insertable<ResolvedIcon> custom({
    Expression<String>? packageName,
    Expression<String>? iconUrl,
    Expression<bool>? isSvg,
    Expression<DateTime>? resolvedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (packageName != null) 'package_name': packageName,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (isSvg != null) 'is_svg': isSvg,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IconCacheTableCompanion copyWith({
    Value<String>? packageName,
    Value<String?>? iconUrl,
    Value<bool>? isSvg,
    Value<DateTime>? resolvedAt,
    Value<int>? rowid,
  }) {
    return IconCacheTableCompanion(
      packageName: packageName ?? this.packageName,
      iconUrl: iconUrl ?? this.iconUrl,
      isSvg: isSvg ?? this.isSvg,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (isSvg.present) {
      map['is_svg'] = Variable<bool>(isSvg.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IconCacheTableCompanion(')
          ..write('packageName: $packageName, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('isSvg: $isSvg, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$ResolvedIconInsertable implements Insertable<ResolvedIcon> {
  ResolvedIcon _object;
  _$ResolvedIconInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return IconCacheTableCompanion(
      packageName: Value(_object.packageName),
      iconUrl: Value(_object.iconUrl),
      isSvg: Value(_object.isSvg),
      resolvedAt: Value(_object.resolvedAt),
    ).toColumns(false);
  }
}

extension ResolvedIconToInsertable on ResolvedIcon {
  _$ResolvedIconInsertable toInsertable() {
    return _$ResolvedIconInsertable(this);
  }
}

class $CategoryAnalyticsTableTable extends CategoryAnalyticsTable
    with TableInfo<$CategoryAnalyticsTableTable, CategoryAnalyticsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryAnalyticsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<String> period = GeneratedColumn<String>(
    'period',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _formulaMeta = const VerificationMeta(
    'formula',
  );
  @override
  late final GeneratedColumn<String> formula = GeneratedColumn<String>(
    'formula',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caskMeta = const VerificationMeta('cask');
  @override
  late final GeneratedColumn<String> cask = GeneratedColumn<String>(
    'cask',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<String> count = GeneratedColumn<String>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _percentMeta = const VerificationMeta(
    'percent',
  );
  @override
  late final GeneratedColumn<String> percent = GeneratedColumn<String>(
    'percent',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    period,
    number,
    formula,
    cask,
    count,
    percent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_analytics_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryAnalyticsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('period')) {
      context.handle(
        _periodMeta,
        period.isAcceptableOrUnknown(data['period']!, _periodMeta),
      );
    } else if (isInserting) {
      context.missing(_periodMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('formula')) {
      context.handle(
        _formulaMeta,
        formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta),
      );
    }
    if (data.containsKey('cask')) {
      context.handle(
        _caskMeta,
        cask.isAcceptableOrUnknown(data['cask']!, _caskMeta),
      );
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('percent')) {
      context.handle(
        _percentMeta,
        percent.isAcceptableOrUnknown(data['percent']!, _percentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryAnalyticsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryAnalyticsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      period: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      ),
      formula: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}formula'],
      ),
      cask: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cask'],
      ),
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}count'],
      )!,
      percent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}percent'],
      ),
    );
  }

  @override
  $CategoryAnalyticsTableTable createAlias(String alias) {
    return $CategoryAnalyticsTableTable(attachedDatabase, alias);
  }
}

class CategoryAnalyticsTableData extends DataClass
    implements Insertable<CategoryAnalyticsTableData> {
  final int id;
  final String category;
  final String period;
  final int? number;
  final String? formula;
  final String? cask;
  final String count;
  final String? percent;
  const CategoryAnalyticsTableData({
    required this.id,
    required this.category,
    required this.period,
    this.number,
    this.formula,
    this.cask,
    required this.count,
    this.percent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['period'] = Variable<String>(period);
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<int>(number);
    }
    if (!nullToAbsent || formula != null) {
      map['formula'] = Variable<String>(formula);
    }
    if (!nullToAbsent || cask != null) {
      map['cask'] = Variable<String>(cask);
    }
    map['count'] = Variable<String>(count);
    if (!nullToAbsent || percent != null) {
      map['percent'] = Variable<String>(percent);
    }
    return map;
  }

  CategoryAnalyticsTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryAnalyticsTableCompanion(
      id: Value(id),
      category: Value(category),
      period: Value(period),
      number: number == null && nullToAbsent
          ? const Value.absent()
          : Value(number),
      formula: formula == null && nullToAbsent
          ? const Value.absent()
          : Value(formula),
      cask: cask == null && nullToAbsent ? const Value.absent() : Value(cask),
      count: Value(count),
      percent: percent == null && nullToAbsent
          ? const Value.absent()
          : Value(percent),
    );
  }

  factory CategoryAnalyticsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryAnalyticsTableData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      period: serializer.fromJson<String>(json['period']),
      number: serializer.fromJson<int?>(json['number']),
      formula: serializer.fromJson<String?>(json['formula']),
      cask: serializer.fromJson<String?>(json['cask']),
      count: serializer.fromJson<String>(json['count']),
      percent: serializer.fromJson<String?>(json['percent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'period': serializer.toJson<String>(period),
      'number': serializer.toJson<int?>(number),
      'formula': serializer.toJson<String?>(formula),
      'cask': serializer.toJson<String?>(cask),
      'count': serializer.toJson<String>(count),
      'percent': serializer.toJson<String?>(percent),
    };
  }

  CategoryAnalyticsTableData copyWith({
    int? id,
    String? category,
    String? period,
    Value<int?> number = const Value.absent(),
    Value<String?> formula = const Value.absent(),
    Value<String?> cask = const Value.absent(),
    String? count,
    Value<String?> percent = const Value.absent(),
  }) => CategoryAnalyticsTableData(
    id: id ?? this.id,
    category: category ?? this.category,
    period: period ?? this.period,
    number: number.present ? number.value : this.number,
    formula: formula.present ? formula.value : this.formula,
    cask: cask.present ? cask.value : this.cask,
    count: count ?? this.count,
    percent: percent.present ? percent.value : this.percent,
  );
  CategoryAnalyticsTableData copyWithCompanion(
    CategoryAnalyticsTableCompanion data,
  ) {
    return CategoryAnalyticsTableData(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      period: data.period.present ? data.period.value : this.period,
      number: data.number.present ? data.number.value : this.number,
      formula: data.formula.present ? data.formula.value : this.formula,
      cask: data.cask.present ? data.cask.value : this.cask,
      count: data.count.present ? data.count.value : this.count,
      percent: data.percent.present ? data.percent.value : this.percent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryAnalyticsTableData(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('period: $period, ')
          ..write('number: $number, ')
          ..write('formula: $formula, ')
          ..write('cask: $cask, ')
          ..write('count: $count, ')
          ..write('percent: $percent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, category, period, number, formula, cask, count, percent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryAnalyticsTableData &&
          other.id == this.id &&
          other.category == this.category &&
          other.period == this.period &&
          other.number == this.number &&
          other.formula == this.formula &&
          other.cask == this.cask &&
          other.count == this.count &&
          other.percent == this.percent);
}

class CategoryAnalyticsTableCompanion
    extends UpdateCompanion<CategoryAnalyticsTableData> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> period;
  final Value<int?> number;
  final Value<String?> formula;
  final Value<String?> cask;
  final Value<String> count;
  final Value<String?> percent;
  const CategoryAnalyticsTableCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.period = const Value.absent(),
    this.number = const Value.absent(),
    this.formula = const Value.absent(),
    this.cask = const Value.absent(),
    this.count = const Value.absent(),
    this.percent = const Value.absent(),
  });
  CategoryAnalyticsTableCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String period,
    this.number = const Value.absent(),
    this.formula = const Value.absent(),
    this.cask = const Value.absent(),
    required String count,
    this.percent = const Value.absent(),
  }) : category = Value(category),
       period = Value(period),
       count = Value(count);
  static Insertable<CategoryAnalyticsTableData> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? period,
    Expression<int>? number,
    Expression<String>? formula,
    Expression<String>? cask,
    Expression<String>? count,
    Expression<String>? percent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (period != null) 'period': period,
      if (number != null) 'number': number,
      if (formula != null) 'formula': formula,
      if (cask != null) 'cask': cask,
      if (count != null) 'count': count,
      if (percent != null) 'percent': percent,
    });
  }

  CategoryAnalyticsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? category,
    Value<String>? period,
    Value<int?>? number,
    Value<String?>? formula,
    Value<String?>? cask,
    Value<String>? count,
    Value<String?>? percent,
  }) {
    return CategoryAnalyticsTableCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      period: period ?? this.period,
      number: number ?? this.number,
      formula: formula ?? this.formula,
      cask: cask ?? this.cask,
      count: count ?? this.count,
      percent: percent ?? this.percent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (period.present) {
      map['period'] = Variable<String>(period.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (formula.present) {
      map['formula'] = Variable<String>(formula.value);
    }
    if (cask.present) {
      map['cask'] = Variable<String>(cask.value);
    }
    if (count.present) {
      map['count'] = Variable<String>(count.value);
    }
    if (percent.present) {
      map['percent'] = Variable<String>(percent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryAnalyticsTableCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('period: $period, ')
          ..write('number: $number, ')
          ..write('formula: $formula, ')
          ..write('cask: $cask, ')
          ..write('count: $count, ')
          ..write('percent: $percent')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTableTable extends SyncMetadataTable
    with TableInfo<$SyncMetadataTableTable, SyncMetadataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _endpointMeta = const VerificationMeta(
    'endpoint',
  );
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
    'endpoint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  @override
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncDateMeta = const VerificationMeta(
    'lastSyncDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncDate = GeneratedColumn<DateTime>(
    'last_sync_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [endpoint, etag, lastSyncDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('endpoint')) {
      context.handle(
        _endpointMeta,
        endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta),
      );
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
        _etagMeta,
        etag.isAcceptableOrUnknown(data['etag']!, _etagMeta),
      );
    }
    if (data.containsKey('last_sync_date')) {
      context.handle(
        _lastSyncDateMeta,
        lastSyncDate.isAcceptableOrUnknown(
          data['last_sync_date']!,
          _lastSyncDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastSyncDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {endpoint};
  @override
  SyncMetadataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataTableData(
      endpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endpoint'],
      )!,
      etag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}etag'],
      ),
      lastSyncDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_date'],
      )!,
    );
  }

  @override
  $SyncMetadataTableTable createAlias(String alias) {
    return $SyncMetadataTableTable(attachedDatabase, alias);
  }
}

class SyncMetadataTableData extends DataClass
    implements Insertable<SyncMetadataTableData> {
  final String endpoint;
  final String? etag;
  final DateTime lastSyncDate;
  const SyncMetadataTableData({
    required this.endpoint,
    this.etag,
    required this.lastSyncDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['endpoint'] = Variable<String>(endpoint);
    if (!nullToAbsent || etag != null) {
      map['etag'] = Variable<String>(etag);
    }
    map['last_sync_date'] = Variable<DateTime>(lastSyncDate);
    return map;
  }

  SyncMetadataTableCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataTableCompanion(
      endpoint: Value(endpoint),
      etag: etag == null && nullToAbsent ? const Value.absent() : Value(etag),
      lastSyncDate: Value(lastSyncDate),
    );
  }

  factory SyncMetadataTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataTableData(
      endpoint: serializer.fromJson<String>(json['endpoint']),
      etag: serializer.fromJson<String?>(json['etag']),
      lastSyncDate: serializer.fromJson<DateTime>(json['lastSyncDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'endpoint': serializer.toJson<String>(endpoint),
      'etag': serializer.toJson<String?>(etag),
      'lastSyncDate': serializer.toJson<DateTime>(lastSyncDate),
    };
  }

  SyncMetadataTableData copyWith({
    String? endpoint,
    Value<String?> etag = const Value.absent(),
    DateTime? lastSyncDate,
  }) => SyncMetadataTableData(
    endpoint: endpoint ?? this.endpoint,
    etag: etag.present ? etag.value : this.etag,
    lastSyncDate: lastSyncDate ?? this.lastSyncDate,
  );
  SyncMetadataTableData copyWithCompanion(SyncMetadataTableCompanion data) {
    return SyncMetadataTableData(
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      etag: data.etag.present ? data.etag.value : this.etag,
      lastSyncDate: data.lastSyncDate.present
          ? data.lastSyncDate.value
          : this.lastSyncDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataTableData(')
          ..write('endpoint: $endpoint, ')
          ..write('etag: $etag, ')
          ..write('lastSyncDate: $lastSyncDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(endpoint, etag, lastSyncDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataTableData &&
          other.endpoint == this.endpoint &&
          other.etag == this.etag &&
          other.lastSyncDate == this.lastSyncDate);
}

class SyncMetadataTableCompanion
    extends UpdateCompanion<SyncMetadataTableData> {
  final Value<String> endpoint;
  final Value<String?> etag;
  final Value<DateTime> lastSyncDate;
  final Value<int> rowid;
  const SyncMetadataTableCompanion({
    this.endpoint = const Value.absent(),
    this.etag = const Value.absent(),
    this.lastSyncDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataTableCompanion.insert({
    required String endpoint,
    this.etag = const Value.absent(),
    required DateTime lastSyncDate,
    this.rowid = const Value.absent(),
  }) : endpoint = Value(endpoint),
       lastSyncDate = Value(lastSyncDate);
  static Insertable<SyncMetadataTableData> custom({
    Expression<String>? endpoint,
    Expression<String>? etag,
    Expression<DateTime>? lastSyncDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (endpoint != null) 'endpoint': endpoint,
      if (etag != null) 'etag': etag,
      if (lastSyncDate != null) 'last_sync_date': lastSyncDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataTableCompanion copyWith({
    Value<String>? endpoint,
    Value<String?>? etag,
    Value<DateTime>? lastSyncDate,
    Value<int>? rowid,
  }) {
    return SyncMetadataTableCompanion(
      endpoint: endpoint ?? this.endpoint,
      etag: etag ?? this.etag,
      lastSyncDate: lastSyncDate ?? this.lastSyncDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (lastSyncDate.present) {
      map['last_sync_date'] = Variable<DateTime>(lastSyncDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataTableCompanion(')
          ..write('endpoint: $endpoint, ')
          ..write('etag: $etag, ')
          ..write('lastSyncDate: $lastSyncDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TapsTableTable extends TapsTable
    with TableInfo<$TapsTableTable, TapModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TapsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repoMeta = const VerificationMeta('repo');
  @override
  late final GeneratedColumn<String> repo = GeneratedColumn<String>(
    'repo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _installedMeta = const VerificationMeta(
    'installed',
  );
  @override
  late final GeneratedColumn<bool> installed = GeneratedColumn<bool>(
    'installed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("installed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _officialMeta = const VerificationMeta(
    'official',
  );
  @override
  late final GeneratedColumn<bool> official = GeneratedColumn<bool>(
    'official',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("official" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _customRemoteMeta = const VerificationMeta(
    'customRemote',
  );
  @override
  late final GeneratedColumn<bool> customRemote = GeneratedColumn<bool>(
    'custom_remote',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("custom_remote" IN (0, 1))',
    ),
  );
  static const VerificationMeta _remoteMeta = const VerificationMeta('remote');
  @override
  late final GeneratedColumn<String> remote = GeneratedColumn<String>(
    'remote',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  formulaNames = GeneratedColumn<String>(
    'formula_names',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  ).withConverter<List<String>>($TapsTableTable.$converterformulaNames);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> caskTokens =
      GeneratedColumn<String>(
        'cask_tokens',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      ).withConverter<List<String>>($TapsTableTable.$convertercaskTokens);
  @override
  List<GeneratedColumn> get $columns => [
    name,
    user,
    repo,
    path,
    installed,
    official,
    customRemote,
    remote,
    formulaNames,
    caskTokens,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'taps_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TapModel> instance, {
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
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('repo')) {
      context.handle(
        _repoMeta,
        repo.isAcceptableOrUnknown(data['repo']!, _repoMeta),
      );
    } else if (isInserting) {
      context.missing(_repoMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('installed')) {
      context.handle(
        _installedMeta,
        installed.isAcceptableOrUnknown(data['installed']!, _installedMeta),
      );
    }
    if (data.containsKey('official')) {
      context.handle(
        _officialMeta,
        official.isAcceptableOrUnknown(data['official']!, _officialMeta),
      );
    }
    if (data.containsKey('custom_remote')) {
      context.handle(
        _customRemoteMeta,
        customRemote.isAcceptableOrUnknown(
          data['custom_remote']!,
          _customRemoteMeta,
        ),
      );
    }
    if (data.containsKey('remote')) {
      context.handle(
        _remoteMeta,
        remote.isAcceptableOrUnknown(data['remote']!, _remoteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  TapModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TapModel(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      user: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user'],
      )!,
      repo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repo'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      installed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}installed'],
      )!,
      official: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}official'],
      )!,
      customRemote: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}custom_remote'],
      ),
      remote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote'],
      ),
      formulaNames: $TapsTableTable.$converterformulaNames.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}formula_names'],
        )!,
      ),
      caskTokens: $TapsTableTable.$convertercaskTokens.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}cask_tokens'],
        )!,
      ),
    );
  }

  @override
  $TapsTableTable createAlias(String alias) {
    return $TapsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterformulaNames =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertercaskTokens =
      const StringListConverter();
}

class TapsTableCompanion extends UpdateCompanion<TapModel> {
  final Value<String> name;
  final Value<String> user;
  final Value<String> repo;
  final Value<String> path;
  final Value<bool> installed;
  final Value<bool> official;
  final Value<bool?> customRemote;
  final Value<String?> remote;
  final Value<List<String>> formulaNames;
  final Value<List<String>> caskTokens;
  final Value<int> rowid;
  const TapsTableCompanion({
    this.name = const Value.absent(),
    this.user = const Value.absent(),
    this.repo = const Value.absent(),
    this.path = const Value.absent(),
    this.installed = const Value.absent(),
    this.official = const Value.absent(),
    this.customRemote = const Value.absent(),
    this.remote = const Value.absent(),
    this.formulaNames = const Value.absent(),
    this.caskTokens = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TapsTableCompanion.insert({
    required String name,
    required String user,
    required String repo,
    required String path,
    this.installed = const Value.absent(),
    this.official = const Value.absent(),
    this.customRemote = const Value.absent(),
    this.remote = const Value.absent(),
    this.formulaNames = const Value.absent(),
    this.caskTokens = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       user = Value(user),
       repo = Value(repo),
       path = Value(path);
  static Insertable<TapModel> custom({
    Expression<String>? name,
    Expression<String>? user,
    Expression<String>? repo,
    Expression<String>? path,
    Expression<bool>? installed,
    Expression<bool>? official,
    Expression<bool>? customRemote,
    Expression<String>? remote,
    Expression<String>? formulaNames,
    Expression<String>? caskTokens,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (user != null) 'user': user,
      if (repo != null) 'repo': repo,
      if (path != null) 'path': path,
      if (installed != null) 'installed': installed,
      if (official != null) 'official': official,
      if (customRemote != null) 'custom_remote': customRemote,
      if (remote != null) 'remote': remote,
      if (formulaNames != null) 'formula_names': formulaNames,
      if (caskTokens != null) 'cask_tokens': caskTokens,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TapsTableCompanion copyWith({
    Value<String>? name,
    Value<String>? user,
    Value<String>? repo,
    Value<String>? path,
    Value<bool>? installed,
    Value<bool>? official,
    Value<bool?>? customRemote,
    Value<String?>? remote,
    Value<List<String>>? formulaNames,
    Value<List<String>>? caskTokens,
    Value<int>? rowid,
  }) {
    return TapsTableCompanion(
      name: name ?? this.name,
      user: user ?? this.user,
      repo: repo ?? this.repo,
      path: path ?? this.path,
      installed: installed ?? this.installed,
      official: official ?? this.official,
      customRemote: customRemote ?? this.customRemote,
      remote: remote ?? this.remote,
      formulaNames: formulaNames ?? this.formulaNames,
      caskTokens: caskTokens ?? this.caskTokens,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (repo.present) {
      map['repo'] = Variable<String>(repo.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (installed.present) {
      map['installed'] = Variable<bool>(installed.value);
    }
    if (official.present) {
      map['official'] = Variable<bool>(official.value);
    }
    if (customRemote.present) {
      map['custom_remote'] = Variable<bool>(customRemote.value);
    }
    if (remote.present) {
      map['remote'] = Variable<String>(remote.value);
    }
    if (formulaNames.present) {
      map['formula_names'] = Variable<String>(
        $TapsTableTable.$converterformulaNames.toSql(formulaNames.value),
      );
    }
    if (caskTokens.present) {
      map['cask_tokens'] = Variable<String>(
        $TapsTableTable.$convertercaskTokens.toSql(caskTokens.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TapsTableCompanion(')
          ..write('name: $name, ')
          ..write('user: $user, ')
          ..write('repo: $repo, ')
          ..write('path: $path, ')
          ..write('installed: $installed, ')
          ..write('official: $official, ')
          ..write('customRemote: $customRemote, ')
          ..write('remote: $remote, ')
          ..write('formulaNames: $formulaNames, ')
          ..write('caskTokens: $caskTokens, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$TapModelInsertable implements Insertable<TapModel> {
  TapModel _object;
  _$TapModelInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TapsTableCompanion(
      name: Value(_object.name),
      user: Value(_object.user),
      repo: Value(_object.repo),
      path: Value(_object.path),
      installed: Value(_object.installed),
      official: Value(_object.official),
      customRemote: Value(_object.customRemote),
      remote: Value(_object.remote),
      formulaNames: Value(_object.formulaNames),
      caskTokens: Value(_object.caskTokens),
    ).toColumns(false);
  }
}

extension TapModelToInsertable on TapModel {
  _$TapModelInsertable toInsertable() {
    return _$TapModelInsertable(this);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CasksTableTable casksTable = $CasksTableTable(this);
  late final $FormulaeTableTable formulaeTable = $FormulaeTableTable(this);
  late final $IconCacheTableTable iconCacheTable = $IconCacheTableTable(this);
  late final $CategoryAnalyticsTableTable categoryAnalyticsTable =
      $CategoryAnalyticsTableTable(this);
  late final $SyncMetadataTableTable syncMetadataTable =
      $SyncMetadataTableTable(this);
  late final $TapsTableTable tapsTable = $TapsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    casksTable,
    formulaeTable,
    iconCacheTable,
    categoryAnalyticsTable,
    syncMetadataTable,
    tapsTable,
  ];
}

typedef $$CasksTableTableCreateCompanionBuilder =
    CasksTableCompanion Function({
      required String token,
      Value<String?> fullToken,
      Value<String?> tap,
      required List<String> name,
      Value<String?> desc,
      Value<String?> homepage,
      Value<String?> url,
      required String version,
      Value<List<Map<String, dynamic>>?> artifacts,
      Value<bool?> autoUpdates,
      Value<Map<String, dynamic>?> dependsOn,
      Value<bool> outdated,
      Value<bool> deprecated,
      Value<bool> disabled,
      Value<bool> isInstalled,
      Value<Map<String, dynamic>?> analytics,
      Value<Map<String, dynamic>?> variations,
      Value<int?> installs30d,
      Value<int?> installs90d,
      Value<int?> installs365d,
      Value<String?> generatedDate,
      Value<String?> installedSize,
      Value<int?> installedOnTimestamp,
      Value<int> rowid,
    });
typedef $$CasksTableTableUpdateCompanionBuilder =
    CasksTableCompanion Function({
      Value<String> token,
      Value<String?> fullToken,
      Value<String?> tap,
      Value<List<String>> name,
      Value<String?> desc,
      Value<String?> homepage,
      Value<String?> url,
      Value<String> version,
      Value<List<Map<String, dynamic>>?> artifacts,
      Value<bool?> autoUpdates,
      Value<Map<String, dynamic>?> dependsOn,
      Value<bool> outdated,
      Value<bool> deprecated,
      Value<bool> disabled,
      Value<bool> isInstalled,
      Value<Map<String, dynamic>?> analytics,
      Value<Map<String, dynamic>?> variations,
      Value<int?> installs30d,
      Value<int?> installs90d,
      Value<int?> installs365d,
      Value<String?> generatedDate,
      Value<String?> installedSize,
      Value<int?> installedOnTimestamp,
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

  ColumnFilters<String> get tap => $composableBuilder(
    column: $table.tap,
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

  ColumnWithTypeConverterFilters<
    List<Map<String, dynamic>>?,
    List<Map<String, dynamic>>,
    String
  >
  get artifacts => $composableBuilder(
    column: $table.artifacts,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnFilters<bool> get isInstalled => $composableBuilder(
    column: $table.isInstalled,
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

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get variations => $composableBuilder(
    column: $table.variations,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get installs30d => $composableBuilder(
    column: $table.installs30d,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installs90d => $composableBuilder(
    column: $table.installs90d,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installs365d => $composableBuilder(
    column: $table.installs365d,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get installedSize => $composableBuilder(
    column: $table.installedSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installedOnTimestamp => $composableBuilder(
    column: $table.installedOnTimestamp,
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

  ColumnOrderings<String> get tap => $composableBuilder(
    column: $table.tap,
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

  ColumnOrderings<String> get artifacts => $composableBuilder(
    column: $table.artifacts,
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

  ColumnOrderings<bool> get isInstalled => $composableBuilder(
    column: $table.isInstalled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get analytics => $composableBuilder(
    column: $table.analytics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variations => $composableBuilder(
    column: $table.variations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installs30d => $composableBuilder(
    column: $table.installs30d,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installs90d => $composableBuilder(
    column: $table.installs90d,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installs365d => $composableBuilder(
    column: $table.installs365d,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get installedSize => $composableBuilder(
    column: $table.installedSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installedOnTimestamp => $composableBuilder(
    column: $table.installedOnTimestamp,
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

  GeneratedColumn<String> get tap =>
      $composableBuilder(column: $table.tap, builder: (column) => column);

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

  GeneratedColumnWithTypeConverter<List<Map<String, dynamic>>?, String>
  get artifacts =>
      $composableBuilder(column: $table.artifacts, builder: (column) => column);

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

  GeneratedColumn<bool> get isInstalled => $composableBuilder(
    column: $table.isInstalled,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get analytics =>
      $composableBuilder(column: $table.analytics, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get variations => $composableBuilder(
    column: $table.variations,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installs30d => $composableBuilder(
    column: $table.installs30d,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installs90d => $composableBuilder(
    column: $table.installs90d,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installs365d => $composableBuilder(
    column: $table.installs365d,
    builder: (column) => column,
  );

  GeneratedColumn<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get installedSize => $composableBuilder(
    column: $table.installedSize,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installedOnTimestamp => $composableBuilder(
    column: $table.installedOnTimestamp,
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
                Value<String?> tap = const Value.absent(),
                Value<List<String>> name = const Value.absent(),
                Value<String?> desc = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<List<Map<String, dynamic>>?> artifacts =
                    const Value.absent(),
                Value<bool?> autoUpdates = const Value.absent(),
                Value<Map<String, dynamic>?> dependsOn = const Value.absent(),
                Value<bool> outdated = const Value.absent(),
                Value<bool> deprecated = const Value.absent(),
                Value<bool> disabled = const Value.absent(),
                Value<bool> isInstalled = const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<Map<String, dynamic>?> variations = const Value.absent(),
                Value<int?> installs30d = const Value.absent(),
                Value<int?> installs90d = const Value.absent(),
                Value<int?> installs365d = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<String?> installedSize = const Value.absent(),
                Value<int?> installedOnTimestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CasksTableCompanion(
                token: token,
                fullToken: fullToken,
                tap: tap,
                name: name,
                desc: desc,
                homepage: homepage,
                url: url,
                version: version,
                artifacts: artifacts,
                autoUpdates: autoUpdates,
                dependsOn: dependsOn,
                outdated: outdated,
                deprecated: deprecated,
                disabled: disabled,
                isInstalled: isInstalled,
                analytics: analytics,
                variations: variations,
                installs30d: installs30d,
                installs90d: installs90d,
                installs365d: installs365d,
                generatedDate: generatedDate,
                installedSize: installedSize,
                installedOnTimestamp: installedOnTimestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String token,
                Value<String?> fullToken = const Value.absent(),
                Value<String?> tap = const Value.absent(),
                required List<String> name,
                Value<String?> desc = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<String?> url = const Value.absent(),
                required String version,
                Value<List<Map<String, dynamic>>?> artifacts =
                    const Value.absent(),
                Value<bool?> autoUpdates = const Value.absent(),
                Value<Map<String, dynamic>?> dependsOn = const Value.absent(),
                Value<bool> outdated = const Value.absent(),
                Value<bool> deprecated = const Value.absent(),
                Value<bool> disabled = const Value.absent(),
                Value<bool> isInstalled = const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<Map<String, dynamic>?> variations = const Value.absent(),
                Value<int?> installs30d = const Value.absent(),
                Value<int?> installs90d = const Value.absent(),
                Value<int?> installs365d = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<String?> installedSize = const Value.absent(),
                Value<int?> installedOnTimestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CasksTableCompanion.insert(
                token: token,
                fullToken: fullToken,
                tap: tap,
                name: name,
                desc: desc,
                homepage: homepage,
                url: url,
                version: version,
                artifacts: artifacts,
                autoUpdates: autoUpdates,
                dependsOn: dependsOn,
                outdated: outdated,
                deprecated: deprecated,
                disabled: disabled,
                isInstalled: isInstalled,
                analytics: analytics,
                variations: variations,
                installs30d: installs30d,
                installs90d: installs90d,
                installs365d: installs365d,
                generatedDate: generatedDate,
                installedSize: installedSize,
                installedOnTimestamp: installedOnTimestamp,
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
      Value<bool> isInstalled,
      Value<List<Map<String, dynamic>>?> requirements,
      Value<Map<String, dynamic>?> analytics,
      Value<Map<String, dynamic>?> bottle,
      Value<Map<String, dynamic>?> variations,
      Value<int?> installs30d,
      Value<int?> installs90d,
      Value<int?> installs365d,
      Value<String?> generatedDate,
      Value<int?> installedSize,
      Value<int?> installedOnTimestamp,
      Value<bool?> builtAsBottle,
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
      Value<bool> isInstalled,
      Value<List<Map<String, dynamic>>?> requirements,
      Value<Map<String, dynamic>?> analytics,
      Value<Map<String, dynamic>?> bottle,
      Value<Map<String, dynamic>?> variations,
      Value<int?> installs30d,
      Value<int?> installs90d,
      Value<int?> installs365d,
      Value<String?> generatedDate,
      Value<int?> installedSize,
      Value<int?> installedOnTimestamp,
      Value<bool?> builtAsBottle,
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

  ColumnFilters<bool> get isInstalled => $composableBuilder(
    column: $table.isInstalled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<Map<String, dynamic>>?,
    List<Map<String, dynamic>>,
    String
  >
  get requirements => $composableBuilder(
    column: $table.requirements,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get bottle => $composableBuilder(
    column: $table.bottle,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get variations => $composableBuilder(
    column: $table.variations,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get installs30d => $composableBuilder(
    column: $table.installs30d,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installs90d => $composableBuilder(
    column: $table.installs90d,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installs365d => $composableBuilder(
    column: $table.installs365d,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installedSize => $composableBuilder(
    column: $table.installedSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installedOnTimestamp => $composableBuilder(
    column: $table.installedOnTimestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get builtAsBottle => $composableBuilder(
    column: $table.builtAsBottle,
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

  ColumnOrderings<bool> get isInstalled => $composableBuilder(
    column: $table.isInstalled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requirements => $composableBuilder(
    column: $table.requirements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get analytics => $composableBuilder(
    column: $table.analytics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bottle => $composableBuilder(
    column: $table.bottle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variations => $composableBuilder(
    column: $table.variations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installs30d => $composableBuilder(
    column: $table.installs30d,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installs90d => $composableBuilder(
    column: $table.installs90d,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installs365d => $composableBuilder(
    column: $table.installs365d,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installedSize => $composableBuilder(
    column: $table.installedSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installedOnTimestamp => $composableBuilder(
    column: $table.installedOnTimestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get builtAsBottle => $composableBuilder(
    column: $table.builtAsBottle,
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

  GeneratedColumn<bool> get isInstalled => $composableBuilder(
    column: $table.isInstalled,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Map<String, dynamic>>?, String>
  get requirements => $composableBuilder(
    column: $table.requirements,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get analytics =>
      $composableBuilder(column: $table.analytics, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get bottle =>
      $composableBuilder(column: $table.bottle, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get variations => $composableBuilder(
    column: $table.variations,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installs30d => $composableBuilder(
    column: $table.installs30d,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installs90d => $composableBuilder(
    column: $table.installs90d,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installs365d => $composableBuilder(
    column: $table.installs365d,
    builder: (column) => column,
  );

  GeneratedColumn<String> get generatedDate => $composableBuilder(
    column: $table.generatedDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installedSize => $composableBuilder(
    column: $table.installedSize,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installedOnTimestamp => $composableBuilder(
    column: $table.installedOnTimestamp,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get builtAsBottle => $composableBuilder(
    column: $table.builtAsBottle,
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
                Value<bool> isInstalled = const Value.absent(),
                Value<List<Map<String, dynamic>>?> requirements =
                    const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<Map<String, dynamic>?> bottle = const Value.absent(),
                Value<Map<String, dynamic>?> variations = const Value.absent(),
                Value<int?> installs30d = const Value.absent(),
                Value<int?> installs90d = const Value.absent(),
                Value<int?> installs365d = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<int?> installedSize = const Value.absent(),
                Value<int?> installedOnTimestamp = const Value.absent(),
                Value<bool?> builtAsBottle = const Value.absent(),
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
                isInstalled: isInstalled,
                requirements: requirements,
                analytics: analytics,
                bottle: bottle,
                variations: variations,
                installs30d: installs30d,
                installs90d: installs90d,
                installs365d: installs365d,
                generatedDate: generatedDate,
                installedSize: installedSize,
                installedOnTimestamp: installedOnTimestamp,
                builtAsBottle: builtAsBottle,
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
                Value<bool> isInstalled = const Value.absent(),
                Value<List<Map<String, dynamic>>?> requirements =
                    const Value.absent(),
                Value<Map<String, dynamic>?> analytics = const Value.absent(),
                Value<Map<String, dynamic>?> bottle = const Value.absent(),
                Value<Map<String, dynamic>?> variations = const Value.absent(),
                Value<int?> installs30d = const Value.absent(),
                Value<int?> installs90d = const Value.absent(),
                Value<int?> installs365d = const Value.absent(),
                Value<String?> generatedDate = const Value.absent(),
                Value<int?> installedSize = const Value.absent(),
                Value<int?> installedOnTimestamp = const Value.absent(),
                Value<bool?> builtAsBottle = const Value.absent(),
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
                isInstalled: isInstalled,
                requirements: requirements,
                analytics: analytics,
                bottle: bottle,
                variations: variations,
                installs30d: installs30d,
                installs90d: installs90d,
                installs365d: installs365d,
                generatedDate: generatedDate,
                installedSize: installedSize,
                installedOnTimestamp: installedOnTimestamp,
                builtAsBottle: builtAsBottle,
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
typedef $$IconCacheTableTableCreateCompanionBuilder =
    IconCacheTableCompanion Function({
      required String packageName,
      Value<String?> iconUrl,
      Value<bool> isSvg,
      required DateTime resolvedAt,
      Value<int> rowid,
    });
typedef $$IconCacheTableTableUpdateCompanionBuilder =
    IconCacheTableCompanion Function({
      Value<String> packageName,
      Value<String?> iconUrl,
      Value<bool> isSvg,
      Value<DateTime> resolvedAt,
      Value<int> rowid,
    });

class $$IconCacheTableTableFilterComposer
    extends Composer<_$AppDatabase, $IconCacheTableTable> {
  $$IconCacheTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSvg => $composableBuilder(
    column: $table.isSvg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IconCacheTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IconCacheTableTable> {
  $$IconCacheTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSvg => $composableBuilder(
    column: $table.isSvg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IconCacheTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IconCacheTableTable> {
  $$IconCacheTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<bool> get isSvg =>
      $composableBuilder(column: $table.isSvg, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => column,
  );
}

class $$IconCacheTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IconCacheTableTable,
          ResolvedIcon,
          $$IconCacheTableTableFilterComposer,
          $$IconCacheTableTableOrderingComposer,
          $$IconCacheTableTableAnnotationComposer,
          $$IconCacheTableTableCreateCompanionBuilder,
          $$IconCacheTableTableUpdateCompanionBuilder,
          (
            ResolvedIcon,
            BaseReferences<_$AppDatabase, $IconCacheTableTable, ResolvedIcon>,
          ),
          ResolvedIcon,
          PrefetchHooks Function()
        > {
  $$IconCacheTableTableTableManager(
    _$AppDatabase db,
    $IconCacheTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IconCacheTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IconCacheTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IconCacheTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> packageName = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<bool> isSvg = const Value.absent(),
                Value<DateTime> resolvedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IconCacheTableCompanion(
                packageName: packageName,
                iconUrl: iconUrl,
                isSvg: isSvg,
                resolvedAt: resolvedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String packageName,
                Value<String?> iconUrl = const Value.absent(),
                Value<bool> isSvg = const Value.absent(),
                required DateTime resolvedAt,
                Value<int> rowid = const Value.absent(),
              }) => IconCacheTableCompanion.insert(
                packageName: packageName,
                iconUrl: iconUrl,
                isSvg: isSvg,
                resolvedAt: resolvedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IconCacheTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IconCacheTableTable,
      ResolvedIcon,
      $$IconCacheTableTableFilterComposer,
      $$IconCacheTableTableOrderingComposer,
      $$IconCacheTableTableAnnotationComposer,
      $$IconCacheTableTableCreateCompanionBuilder,
      $$IconCacheTableTableUpdateCompanionBuilder,
      (
        ResolvedIcon,
        BaseReferences<_$AppDatabase, $IconCacheTableTable, ResolvedIcon>,
      ),
      ResolvedIcon,
      PrefetchHooks Function()
    >;
typedef $$CategoryAnalyticsTableTableCreateCompanionBuilder =
    CategoryAnalyticsTableCompanion Function({
      Value<int> id,
      required String category,
      required String period,
      Value<int?> number,
      Value<String?> formula,
      Value<String?> cask,
      required String count,
      Value<String?> percent,
    });
typedef $$CategoryAnalyticsTableTableUpdateCompanionBuilder =
    CategoryAnalyticsTableCompanion Function({
      Value<int> id,
      Value<String> category,
      Value<String> period,
      Value<int?> number,
      Value<String?> formula,
      Value<String?> cask,
      Value<String> count,
      Value<String?> percent,
    });

class $$CategoryAnalyticsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryAnalyticsTableTable> {
  $$CategoryAnalyticsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formula => $composableBuilder(
    column: $table.formula,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cask => $composableBuilder(
    column: $table.cask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get percent => $composableBuilder(
    column: $table.percent,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryAnalyticsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryAnalyticsTableTable> {
  $$CategoryAnalyticsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formula => $composableBuilder(
    column: $table.formula,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cask => $composableBuilder(
    column: $table.cask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get percent => $composableBuilder(
    column: $table.percent,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryAnalyticsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryAnalyticsTableTable> {
  $$CategoryAnalyticsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get formula =>
      $composableBuilder(column: $table.formula, builder: (column) => column);

  GeneratedColumn<String> get cask =>
      $composableBuilder(column: $table.cask, builder: (column) => column);

  GeneratedColumn<String> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<String> get percent =>
      $composableBuilder(column: $table.percent, builder: (column) => column);
}

class $$CategoryAnalyticsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryAnalyticsTableTable,
          CategoryAnalyticsTableData,
          $$CategoryAnalyticsTableTableFilterComposer,
          $$CategoryAnalyticsTableTableOrderingComposer,
          $$CategoryAnalyticsTableTableAnnotationComposer,
          $$CategoryAnalyticsTableTableCreateCompanionBuilder,
          $$CategoryAnalyticsTableTableUpdateCompanionBuilder,
          (
            CategoryAnalyticsTableData,
            BaseReferences<
              _$AppDatabase,
              $CategoryAnalyticsTableTable,
              CategoryAnalyticsTableData
            >,
          ),
          CategoryAnalyticsTableData,
          PrefetchHooks Function()
        > {
  $$CategoryAnalyticsTableTableTableManager(
    _$AppDatabase db,
    $CategoryAnalyticsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryAnalyticsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CategoryAnalyticsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CategoryAnalyticsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> period = const Value.absent(),
                Value<int?> number = const Value.absent(),
                Value<String?> formula = const Value.absent(),
                Value<String?> cask = const Value.absent(),
                Value<String> count = const Value.absent(),
                Value<String?> percent = const Value.absent(),
              }) => CategoryAnalyticsTableCompanion(
                id: id,
                category: category,
                period: period,
                number: number,
                formula: formula,
                cask: cask,
                count: count,
                percent: percent,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String category,
                required String period,
                Value<int?> number = const Value.absent(),
                Value<String?> formula = const Value.absent(),
                Value<String?> cask = const Value.absent(),
                required String count,
                Value<String?> percent = const Value.absent(),
              }) => CategoryAnalyticsTableCompanion.insert(
                id: id,
                category: category,
                period: period,
                number: number,
                formula: formula,
                cask: cask,
                count: count,
                percent: percent,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryAnalyticsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryAnalyticsTableTable,
      CategoryAnalyticsTableData,
      $$CategoryAnalyticsTableTableFilterComposer,
      $$CategoryAnalyticsTableTableOrderingComposer,
      $$CategoryAnalyticsTableTableAnnotationComposer,
      $$CategoryAnalyticsTableTableCreateCompanionBuilder,
      $$CategoryAnalyticsTableTableUpdateCompanionBuilder,
      (
        CategoryAnalyticsTableData,
        BaseReferences<
          _$AppDatabase,
          $CategoryAnalyticsTableTable,
          CategoryAnalyticsTableData
        >,
      ),
      CategoryAnalyticsTableData,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableTableCreateCompanionBuilder =
    SyncMetadataTableCompanion Function({
      required String endpoint,
      Value<String?> etag,
      required DateTime lastSyncDate,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableTableUpdateCompanionBuilder =
    SyncMetadataTableCompanion Function({
      Value<String> endpoint,
      Value<String?> etag,
      Value<DateTime> lastSyncDate,
      Value<int> rowid,
    });

class $$SyncMetadataTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTableTable> {
  $$SyncMetadataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncDate => $composableBuilder(
    column: $table.lastSyncDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTableTable> {
  $$SyncMetadataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncDate => $composableBuilder(
    column: $table.lastSyncDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTableTable> {
  $$SyncMetadataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get endpoint =>
      $composableBuilder(column: $table.endpoint, builder: (column) => column);

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncDate => $composableBuilder(
    column: $table.lastSyncDate,
    builder: (column) => column,
  );
}

class $$SyncMetadataTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTableTable,
          SyncMetadataTableData,
          $$SyncMetadataTableTableFilterComposer,
          $$SyncMetadataTableTableOrderingComposer,
          $$SyncMetadataTableTableAnnotationComposer,
          $$SyncMetadataTableTableCreateCompanionBuilder,
          $$SyncMetadataTableTableUpdateCompanionBuilder,
          (
            SyncMetadataTableData,
            BaseReferences<
              _$AppDatabase,
              $SyncMetadataTableTable,
              SyncMetadataTableData
            >,
          ),
          SyncMetadataTableData,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableTableManager(
    _$AppDatabase db,
    $SyncMetadataTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> endpoint = const Value.absent(),
                Value<String?> etag = const Value.absent(),
                Value<DateTime> lastSyncDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataTableCompanion(
                endpoint: endpoint,
                etag: etag,
                lastSyncDate: lastSyncDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String endpoint,
                Value<String?> etag = const Value.absent(),
                required DateTime lastSyncDate,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataTableCompanion.insert(
                endpoint: endpoint,
                etag: etag,
                lastSyncDate: lastSyncDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTableTable,
      SyncMetadataTableData,
      $$SyncMetadataTableTableFilterComposer,
      $$SyncMetadataTableTableOrderingComposer,
      $$SyncMetadataTableTableAnnotationComposer,
      $$SyncMetadataTableTableCreateCompanionBuilder,
      $$SyncMetadataTableTableUpdateCompanionBuilder,
      (
        SyncMetadataTableData,
        BaseReferences<
          _$AppDatabase,
          $SyncMetadataTableTable,
          SyncMetadataTableData
        >,
      ),
      SyncMetadataTableData,
      PrefetchHooks Function()
    >;
typedef $$TapsTableTableCreateCompanionBuilder =
    TapsTableCompanion Function({
      required String name,
      required String user,
      required String repo,
      required String path,
      Value<bool> installed,
      Value<bool> official,
      Value<bool?> customRemote,
      Value<String?> remote,
      Value<List<String>> formulaNames,
      Value<List<String>> caskTokens,
      Value<int> rowid,
    });
typedef $$TapsTableTableUpdateCompanionBuilder =
    TapsTableCompanion Function({
      Value<String> name,
      Value<String> user,
      Value<String> repo,
      Value<String> path,
      Value<bool> installed,
      Value<bool> official,
      Value<bool?> customRemote,
      Value<String?> remote,
      Value<List<String>> formulaNames,
      Value<List<String>> caskTokens,
      Value<int> rowid,
    });

class $$TapsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TapsTableTable> {
  $$TapsTableTableFilterComposer({
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

  ColumnFilters<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repo => $composableBuilder(
    column: $table.repo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get installed => $composableBuilder(
    column: $table.installed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get official => $composableBuilder(
    column: $table.official,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get customRemote => $composableBuilder(
    column: $table.customRemote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remote => $composableBuilder(
    column: $table.remote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get formulaNames => $composableBuilder(
    column: $table.formulaNames,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get caskTokens => $composableBuilder(
    column: $table.caskTokens,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$TapsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TapsTableTable> {
  $$TapsTableTableOrderingComposer({
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

  ColumnOrderings<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repo => $composableBuilder(
    column: $table.repo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get installed => $composableBuilder(
    column: $table.installed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get official => $composableBuilder(
    column: $table.official,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get customRemote => $composableBuilder(
    column: $table.customRemote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remote => $composableBuilder(
    column: $table.remote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formulaNames => $composableBuilder(
    column: $table.formulaNames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caskTokens => $composableBuilder(
    column: $table.caskTokens,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TapsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TapsTableTable> {
  $$TapsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get user =>
      $composableBuilder(column: $table.user, builder: (column) => column);

  GeneratedColumn<String> get repo =>
      $composableBuilder(column: $table.repo, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<bool> get installed =>
      $composableBuilder(column: $table.installed, builder: (column) => column);

  GeneratedColumn<bool> get official =>
      $composableBuilder(column: $table.official, builder: (column) => column);

  GeneratedColumn<bool> get customRemote => $composableBuilder(
    column: $table.customRemote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remote =>
      $composableBuilder(column: $table.remote, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get formulaNames =>
      $composableBuilder(
        column: $table.formulaNames,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>, String> get caskTokens =>
      $composableBuilder(
        column: $table.caskTokens,
        builder: (column) => column,
      );
}

class $$TapsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TapsTableTable,
          TapModel,
          $$TapsTableTableFilterComposer,
          $$TapsTableTableOrderingComposer,
          $$TapsTableTableAnnotationComposer,
          $$TapsTableTableCreateCompanionBuilder,
          $$TapsTableTableUpdateCompanionBuilder,
          (TapModel, BaseReferences<_$AppDatabase, $TapsTableTable, TapModel>),
          TapModel,
          PrefetchHooks Function()
        > {
  $$TapsTableTableTableManager(_$AppDatabase db, $TapsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TapsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TapsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TapsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<String> repo = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<bool> installed = const Value.absent(),
                Value<bool> official = const Value.absent(),
                Value<bool?> customRemote = const Value.absent(),
                Value<String?> remote = const Value.absent(),
                Value<List<String>> formulaNames = const Value.absent(),
                Value<List<String>> caskTokens = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TapsTableCompanion(
                name: name,
                user: user,
                repo: repo,
                path: path,
                installed: installed,
                official: official,
                customRemote: customRemote,
                remote: remote,
                formulaNames: formulaNames,
                caskTokens: caskTokens,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required String user,
                required String repo,
                required String path,
                Value<bool> installed = const Value.absent(),
                Value<bool> official = const Value.absent(),
                Value<bool?> customRemote = const Value.absent(),
                Value<String?> remote = const Value.absent(),
                Value<List<String>> formulaNames = const Value.absent(),
                Value<List<String>> caskTokens = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TapsTableCompanion.insert(
                name: name,
                user: user,
                repo: repo,
                path: path,
                installed: installed,
                official: official,
                customRemote: customRemote,
                remote: remote,
                formulaNames: formulaNames,
                caskTokens: caskTokens,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TapsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TapsTableTable,
      TapModel,
      $$TapsTableTableFilterComposer,
      $$TapsTableTableOrderingComposer,
      $$TapsTableTableAnnotationComposer,
      $$TapsTableTableCreateCompanionBuilder,
      $$TapsTableTableUpdateCompanionBuilder,
      (TapModel, BaseReferences<_$AppDatabase, $TapsTableTable, TapModel>),
      TapModel,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CasksTableTableTableManager get casksTable =>
      $$CasksTableTableTableManager(_db, _db.casksTable);
  $$FormulaeTableTableTableManager get formulaeTable =>
      $$FormulaeTableTableTableManager(_db, _db.formulaeTable);
  $$IconCacheTableTableTableManager get iconCacheTable =>
      $$IconCacheTableTableTableManager(_db, _db.iconCacheTable);
  $$CategoryAnalyticsTableTableTableManager get categoryAnalyticsTable =>
      $$CategoryAnalyticsTableTableTableManager(
        _db,
        _db.categoryAnalyticsTable,
      );
  $$SyncMetadataTableTableTableManager get syncMetadataTable =>
      $$SyncMetadataTableTableTableManager(_db, _db.syncMetadataTable);
  $$TapsTableTableTableManager get tapsTable =>
      $$TapsTableTableTableManager(_db, _db.tapsTable);
}
