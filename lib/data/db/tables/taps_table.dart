import 'package:drift/drift.dart';
import '../../models/tap/tap_model.dart';
import '../type_converters.dart';

@UseRowClass(TapModel, generateInsertable: true)
class TapsTable extends Table {
  TextColumn get name => text()();
  TextColumn get user => text()();
  TextColumn get repo => text()();
  TextColumn get path => text()();
  BoolColumn get installed => boolean().withDefault(const Constant(false))();
  BoolColumn get official => boolean().withDefault(const Constant(false))();
  BoolColumn get customRemote => boolean().nullable()();
  TextColumn get remote => text().nullable()();
  
  TextColumn get formulaNames => text().map(const StringListConverter()).withDefault(const Constant('[]'))();
  TextColumn get caskTokens => text().map(const StringListConverter()).withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {name};
}
