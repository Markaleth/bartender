import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'api_client_interface.dart';
import '../models/formula/formula_model.dart';
import '../../core/enums/analytics_period.dart';
import '../models/cask/cask_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../network_resource.dart';

List<FormulaModel> _parseFormulaeListing(String jsonString) {
  final List<dynamic> data = jsonDecode(jsonString);
  return data
      .map((json) => FormulaModel.fromJson(json as Map<String, dynamic>))
      .toList();
}

List<CaskModel> _parseCasksListing(String jsonString) {
  final List<dynamic> data = jsonDecode(jsonString);
  return data
      .map((json) => CaskModel.fromJson(json as Map<String, dynamic>))
      .toList();
}

CategoryAnalyticsResponse _parseCategoryAnalytics(String jsonString) {
  return CategoryAnalyticsResponse.fromJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );
}

FormulaeAnalyticsResponse _parseFormulaeAnalytics(String jsonString) {
  return FormulaeAnalyticsResponse.fromJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );
}

CasksAnalyticsResponse _parseCasksAnalytics(String jsonString) {
  return CasksAnalyticsResponse.fromJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );
}

class ApiClient implements ApiClientInterface {
  late Dio _dio;

  static ApiClient initialize() {
    ApiClient client = ApiClient();
    client._dio = Dio(_defaultOptions);
    if (kDebugMode) {
      client._dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: false,
          responseHeader: true,
          responseBody: false,
          error: true,
        ),
      );
    }

    return client;
  }

  static const String _baseUrl = 'https://formulae.brew.sh/api';
  static const _defaultTimeoutDuration = Duration(seconds: 10);

  static final BaseOptions _defaultOptions = BaseOptions(
    receiveTimeout: _defaultTimeoutDuration,
    baseUrl: _baseUrl,
  );

  Options _getOptionsWithETag(String? eTag) {
    return Options(
      receiveTimeout: _defaultTimeoutDuration,
      headers: eTag != null ? {'If-None-Match': eTag} : null,
      validateStatus: (status) =>
          status != null && (status >= 200 && status < 300 || status == 304),
      // We use ResponseType.plain to prevent Dio from automatically decoding
      // massive JSON payloads on the main thread, allowing us to pass the
      // raw string to a background isolate via compute().
      responseType: ResponseType.plain,
    );
  }

  /// Helper for heavy bulk endpoints using compute() isolates
  Future<NetworkResource<T>> _fetchAndParse<T>(
    String path,
    String? eTag,
    T Function(String) parseFunction,
  ) async {
    try {
      final response = await _dio.get(path, options: _getOptionsWithETag(eTag));

      if (response.statusCode == 304) {
        return NetworkResource.success(null, 304, eTag);
      }

      final String data = response.data;
      final parsedData = await compute(parseFunction, data);
      final newETag = response.headers.value('etag');

      return NetworkResource.success(parsedData, response.statusCode, newETag);
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  /// Helper for lightweight detail endpoints on the main thread
  Future<NetworkResource<T>> _fetchDetails<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await _dio.get(path);
      return NetworkResource.success(
        fromJson(response.data as Map<String, dynamic>),
        response.statusCode,
      );
    } on DioException catch (error) {
      return NetworkResource.errorFrom(error);
    } catch (error) {
      return NetworkResource.error(error.toString(), null);
    }
  }

  @override
  Future<NetworkResource<List<FormulaModel>>> getFormulaeListing({
    String? eTag,
  }) {
    return _fetchAndParse('/formula.json', eTag, _parseFormulaeListing);
  }

  @override
  Future<NetworkResource<List<CaskModel>>> getCasksListing({String? eTag}) {
    return _fetchAndParse('/cask.json', eTag, _parseCasksListing);
  }

  @override
  Future<NetworkResource<FormulaModel>> getFormulaDetails(String formula) {
    return _fetchDetails('/formula/$formula.json', FormulaModel.fromJson);
  }

  @override
  Future<NetworkResource<CaskModel>> getCaskDetails(String cask) {
    return _fetchDetails('/cask/$cask.json', CaskModel.fromJson);
  }

  @override
  Future<NetworkResource<CategoryAnalyticsResponse>> getCategoryAnalytics(
    String category,
    AnalyticsPeriod days, {
    String? eTag,
  }) {
    return _fetchAndParse(
      '/analytics/$category/${days.value}.json',
      eTag,
      _parseCategoryAnalytics,
    );
  }

  @override
  Future<NetworkResource<FormulaeAnalyticsResponse>> getFormulaeAnalytics(
    String category,
    AnalyticsPeriod days, {
    String? eTag,
  }) {
    return _fetchAndParse(
      '/analytics/$category/homebrew-core/${days.value}.json',
      eTag,
      _parseFormulaeAnalytics,
    );
  }

  @override
  Future<NetworkResource<CasksAnalyticsResponse>> getCasksAnalytics(
    AnalyticsPeriod days, {
    String? eTag,
  }) {
    return _fetchAndParse(
      '/analytics/cask-install/homebrew-cask/${days.value}.json',
      eTag,
      _parseCasksAnalytics,
    );
  }
}
