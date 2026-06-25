import '../../db/database_interface.dart';
import '../../network_resource.dart';

Future<void> fetchAndCache<T>({
  required DatabaseInterface database,
  required String endpoint,
  required Future<NetworkResource<T>> Function(String? currentETag) fetcher,
  required Future<void> Function(T data) cacher,
  required String errorMessage,
}) async {
  final currentETag = await database.getETag(endpoint);
  final response = await fetcher(currentETag);

  if (response.status == NetworkStatus.success) {
    if (response.statusCode == 304) return;
    if (response.data != null) {
      await cacher(response.data as T);
      if (response.eTag != null) {
        await database.saveETag(endpoint, response.eTag!);
      }
    }
  } else {
    throw Exception('$errorMessage: ${response.errorMessage}');
  }
}
