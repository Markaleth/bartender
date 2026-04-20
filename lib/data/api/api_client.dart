import 'package:dio/dio.dart';
import 'api_client_interface.dart';
import '../models/formula/formula_model.dart';
import '../models/cask/cask_model.dart';
import '../models/analytics/analytics_model.dart';
import '../network_resource.dart';

class ApiClient implements ApiClientInterface {
  final Dio _dio;

  static const String _baseUrl = 'https://formulae.brew.sh/api';

  static const _listingTimeoutDuration = Duration(seconds: 30);
  static const _defaultTimeoutDuration = Duration(seconds: 10);

  final Options _listingOptions = Options(
    receiveTimeout: _listingTimeoutDuration,
  );
  final Options _defaultOptions = Options(
    receiveTimeout: _defaultTimeoutDuration,
  );

  ApiClient(this._dio) {
    _dio.options.baseUrl = _baseUrl;
  }

  @override
  Future<NetworkResource<List<FormulaModel>>> getFormulaeListing() async {
    try {
      final response = await _dio.get(
        '/formula.json',
        options: _listingOptions,
      );
      final List<dynamic> data = response.data;
      return NetworkResource.success(
        data
            .map((json) => FormulaModel.fromJson(json as Map<String, dynamic>))
            .toList(),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<List<CaskModel>>> getCasksListing() async {
    try {
      final response = await _dio.get('/cask.json', options: _listingOptions);
      final List<dynamic> data = response.data;
      return NetworkResource.success(
        data
            .map((json) => CaskModel.fromJson(json as Map<String, dynamic>))
            .toList(),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<FormulaModel>> getFormulaDetails(
    String formula,
  ) async {
    try {
      final response = await _dio.get(
        '/formula/$formula.json',
        options: _defaultOptions,
      );
      return NetworkResource.success(
        FormulaModel.fromJson(response.data as Map<String, dynamic>),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<CaskModel>> getCaskDetails(String cask) async {
    try {
      final response = await _dio.get(
        '/cask/$cask.json',
        options: _defaultOptions,
      );
      return NetworkResource.success(
        CaskModel.fromJson(response.data as Map<String, dynamic>),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<AnalyticsResponse>> getCategoryAnalytics(
    String category,
    String days,
  ) async {
    try {
      final response = await _dio.get(
        '/analytics/$category/$days.json',
        options: _defaultOptions,
      );
      return NetworkResource.success(
        AnalyticsResponse.fromJson(response.data as Map<String, dynamic>),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<AnalyticsResponse>> getFormulaeAnalytics(
    String category,
    String days,
  ) async {
    try {
      final response = await _dio.get(
        '/analytics/$category/homebrew-core/$days.json',
        options: _defaultOptions,
      );
      return NetworkResource.success(
        AnalyticsResponse.fromJson(response.data as Map<String, dynamic>),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<AnalyticsResponse>> getCasksAnalytics(
    String days,
  ) async {
    try {
      final response = await _dio.get(
        '/analytics/cask-install/homebrew-cask/$days.json',
        options: _defaultOptions,
      );
      return NetworkResource.success(
        AnalyticsResponse.fromJson(response.data as Map<String, dynamic>),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }
}
