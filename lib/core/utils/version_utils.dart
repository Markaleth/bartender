class VersionUtils {
  static bool isRemoteNewer(String localVersion, String remoteVersion) {
    if (localVersion.isEmpty || remoteVersion.isEmpty) return false;

    // Remove any 'v' prefix if present
    final l = localVersion.replaceAll(RegExp(r'^v'), '').split('.');
    final r = remoteVersion.replaceAll(RegExp(r'^v'), '').split('.');

    final length = l.length > r.length ? l.length : r.length;

    for (var i = 0; i < length; i++) {
      final lPart = i < l.length ? int.tryParse(l[i]) ?? 0 : 0;
      final rPart = i < r.length ? int.tryParse(r[i]) ?? 0 : 0;

      if (rPart > lPart) {
        return true;
      } else if (rPart < lPart) {
        return false;
      }
    }

    return false;
  }
}
