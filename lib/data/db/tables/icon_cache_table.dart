import 'package:drift/drift.dart';
import '../../models/icon_cache/resolved_icon.dart';

@UseRowClass(ResolvedIcon, generateInsertable: true)
class IconCacheTable extends Table {
  TextColumn get packageName => text()();
  TextColumn get iconUrl => text().nullable()();
  BoolColumn get isSvg => boolean().withDefault(const Constant(false))();
  DateTimeColumn get resolvedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {packageName};
}
