import 'package:drift/drift.dart';
import '../../models/cask/cask_model.dart';
import '../type_converters.dart';

@UseRowClass(CaskModel, generateInsertable: true)
class CasksTable extends Table {
  TextColumn get token => text()();
  TextColumn get fullToken => text().nullable()();
  TextColumn get tap => text().nullable()();
  TextColumn get name => text().map(const StringListConverter())();
  TextColumn get desc => text().nullable()();
  TextColumn get homepage => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get version => text()();
  TextColumn get artifacts => text().map(const MapListConverter()).nullable()();
  BoolColumn get autoUpdates => boolean().nullable()();
  TextColumn get dependsOn => text().map(const MapConverter()).nullable()();
  BoolColumn get outdated => boolean().withDefault(const Constant(false))();
  BoolColumn get deprecated => boolean().withDefault(const Constant(false))();
  BoolColumn get disabled => boolean().withDefault(const Constant(false))();
  BoolColumn get isInstalled => boolean().withDefault(const Constant(false))();
  TextColumn get analytics => text().map(const MapConverter()).nullable()();
  TextColumn get variations => text().map(const MapConverter()).nullable()();
  IntColumn get installs30d => integer().nullable()();
  IntColumn get installs90d => integer().nullable()();
  IntColumn get installs365d => integer().nullable()();
  TextColumn get generatedDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {token};
}
