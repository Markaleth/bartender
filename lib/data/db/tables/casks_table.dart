import 'package:drift/drift.dart';
import '../../models/cask/cask_model.dart';
import '../type_converters.dart';

@UseRowClass(CaskModel, generateInsertable: true)
class CasksTable extends Table {
  TextColumn get token => text()();
  TextColumn get fullToken => text().nullable()();
  TextColumn get name => text().map(const StringListConverter())();
  TextColumn get desc => text().nullable()();
  TextColumn get homepage => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get version => text()();
  BoolColumn get autoUpdates => boolean().nullable()();
  TextColumn get dependsOn => text().map(const MapConverter()).nullable()();
  BoolColumn get outdated => boolean().withDefault(const Constant(false))();
  BoolColumn get deprecated => boolean().withDefault(const Constant(false))();
  BoolColumn get disabled => boolean().withDefault(const Constant(false))();
  TextColumn get analytics => text().map(const MapConverter()).nullable()();
  TextColumn get generatedDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {token};
}
