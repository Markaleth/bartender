import '../../api/api_client_interface.dart';
import '../../shell/brew_service.dart';
import '../../network_resource.dart';
import '../../../core/utils/version_utils.dart';

class SystemOperations {
  final ApiClientInterface _apiClient;
  final BrewService _brewService;

  SystemOperations(this._apiClient, this._brewService);

  Future<(String, bool)> checkUpdateStatus() async {
    final localVersion = await _brewService.getVersion();
    if (localVersion.isEmpty) {
      return ('', false);
    }

    final remoteResponse = await _apiClient.getLatestHomebrewVersion();
    if (remoteResponse.status == NetworkStatus.success &&
        remoteResponse.data != null) {
      final remoteVersion = remoteResponse.data!;
      final hasUpdate = VersionUtils.isRemoteNewer(localVersion, remoteVersion);
      return (localVersion, hasUpdate);
    }

    return (localVersion, false);
  }
}
