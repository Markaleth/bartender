import 'dart:convert';
import 'package:drift/drift.dart';
import '../models/formula/formula_model.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

class MapConverter extends TypeConverter<Map<String, dynamic>, String> {
  const MapConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    return jsonDecode(fromDb) as Map<String, dynamic>;
  }

  @override
  String toSql(Map<String, dynamic> value) {
    return jsonEncode(value);
  }
}

class FormulaVersionsConverter extends TypeConverter<FormulaVersions, String> {
  const FormulaVersionsConverter();

  @override
  FormulaVersions fromSql(String fromDb) {
    return FormulaVersions.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(FormulaVersions value) {
    return jsonEncode(value.toJson());
  }
}
