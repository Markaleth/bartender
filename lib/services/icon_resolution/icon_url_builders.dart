typedef IconUrlBuilder = String? Function(String packageName, Uri? homepageUri);

class IconUrlBuilders {
  static String? githubAvatar(String packageName, Uri? uri) {
    return _extractFromSsh(uri) ?? _extractFromHttp(uri);
  }

  static String? _extractFromSsh(Uri? uri) {
    final urlString = uri?.toString() ?? '';
    if (urlString.startsWith('git@github.com:')) {
      final path = urlString.substring('git@github.com:'.length);
      final user = path.split('/').first;
      if (user.isNotEmpty) {
        return 'https://github.com/$user.png';
      }
    }
    return null;
  }

  static String? _extractFromHttp(Uri? uri) {
    if (uri == null || !uri.host.contains('github')) return null;

    if (uri.host == 'github.com' && uri.pathSegments.isNotEmpty) {
      return 'https://github.com/${uri.pathSegments.first}.png';
    } else if (uri.host.endsWith('.github.io')) {
      return 'https://github.com/${uri.host.split('.github.io').first}.png';
    }

    return null;
  }

  static String? clearbit(String packageName, Uri? uri) {
    if (uri == null || uri.host.isEmpty) return null;
    return 'https://logo.clearbit.com/${uri.host}';
  }

  static String? googleFavicon(String packageName, Uri? uri) {
    if (uri == null || uri.host.isEmpty) return null;
    return 'https://www.google.com/s2/favicons?domain=${uri.host}&sz=128';
  }

  // The waterfall order
  static const List<IconUrlBuilder> waterfall = [
    githubAvatar,
    clearbit,
    googleFavicon,
  ];
}
