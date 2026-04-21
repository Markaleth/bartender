import 'package:drift/drift.dart';
import '../../models/formula/formula_model.dart';
import '../type_converters.dart';

@UseRowClass(FormulaModel, generateInsertable: true)
class FormulaeTable extends Table {
  TextColumn get name => text()();
  TextColumn get fullName => text()();
  TextColumn get tap => text()();
  TextColumn get desc => text()();
  TextColumn get license => text().nullable()();
  TextColumn get homepage => text().nullable()();
  TextColumn get versions => text().map(const FormulaVersionsConverter())();
  TextColumn get dependencies => text().map(const StringListConverter())();
  TextColumn get buildDependencies => text().map(const StringListConverter())();
  BoolColumn get outdated => boolean().withDefault(const Constant(false))();
  BoolColumn get deprecated => boolean().withDefault(const Constant(false))();
  BoolColumn get disabled => boolean().withDefault(const Constant(false))();
  TextColumn get analytics => text().map(const MapConverter()).nullable()();
  TextColumn get generatedDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {name};
}
