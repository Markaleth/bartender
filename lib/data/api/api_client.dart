import 'package:dio/dio.dart';
import 'api_client_interface.dart';
import '../models/formula/formula_model.dart';
import '../models/cask/cask_model.dart';

class ApiClient implements ApiClientInterface {
  final Dio _dio;

  ApiClient(this._dio);

  @override
  Future<List<FormulaModel>> getFormulaeListing() async {
    final response = await _dio.get('https://formulae.brew.sh/api/formula.json');
    final List<dynamic> data = response.data;
    return data.map((json) => FormulaModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<CaskModel>> getCasksListing() async {
    final response = await _dio.get('https://formulae.brew.sh/api/cask.json');
    final List<dynamic> data = response.data;
    return data.map((json) => CaskModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<FormulaModel> getFormulaDetails(String formula) async {
    final response = await _dio.get('https://formulae.brew.sh/api/formula/$formula.json');
    return FormulaModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<CaskModel> getCaskDetails(String cask) async {
    final response = await _dio.get('https://formulae.brew.sh/api/cask/$cask.json');
    return CaskModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<dynamic> getCategoryAnalytics() {
    // TODO: implement getCategoryAnalytics
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getFormulaeAnalytics() {
    // TODO: implement getFormulaeAnalytics
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getCasksAnalytics() {
    // TODO: implement getCasksAnalytics
    throw UnimplementedError();
  }
}
