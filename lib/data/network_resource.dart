import 'package:dio/dio.dart';

enum NetworkStatus { success, error }

class NetworkResource<T> {
  final NetworkStatus status;
  final int? statusCode;
  final T? data;
  final String? errorMessage;

  NetworkResource(this.status, this.statusCode, this.data, this.errorMessage);

  factory NetworkResource.success(T data, int? statusCode) {
    return NetworkResource(NetworkStatus.success, statusCode, data, null);
  }

  factory NetworkResource.error(String? errorMessage, int? statusCode) {
    return NetworkResource(NetworkStatus.error, statusCode, null, errorMessage);
  }

  factory NetworkResource.errorFrom(DioException error) {
    int? statusCode = error.response?.statusCode;
    var errorData = error.response?.data;

    if (errorData == null) {
      return NetworkResource.error(
        _getNetworkErrorMessage(error.type),
        statusCode,
      );
    }

    if (errorData is String && errorData.contains('<html>')) {
      return NetworkResource.error(
        _getStatusCodeMessage(statusCode),
        statusCode,
      );
    }

    return NetworkResource.error(errorData.toString(), statusCode);
  }

  static String _getStatusCodeMessage(int? statusCode) {
    return switch (statusCode) {
      404 => 'Formula not found',
      500 => 'Server error',
      401 || 403 => 'Access denied',
      _ => 'Request failed',
    };
  }

  static String _getNetworkErrorMessage(DioExceptionType type) {
    return switch (type) {
      DioExceptionType.connectionTimeout => 'Connection timeout',
      DioExceptionType.receiveTimeout => 'Request timeout',
      DioExceptionType.connectionError => 'No internet connection',
      _ => 'Connection error',
    };
  }
}
