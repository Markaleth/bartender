typedef IconUrlBuilder = String? Function(String packageName, Uri? homepageUri, bool isCask);

class IconUrlBuilders {
  static String? githubAvatar(String packageName, Uri? uri, bool isCask) {
    if (uri == null || !uri.host.contains('github')) return null;
    
    if (uri.host == 'github.com' && uri.pathSegments.isNotEmpty) {
      return 'https://github.com/${uri.pathSegments.first}.png';
    } else if (uri.host.endsWith('.github.io')) {
      return 'https://github.com/${uri.host.split('.github.io').first}.png';
    }
    return null;
  }

  static String? clearbit(String packageName, Uri? uri, bool isCask) {
    if (uri == null || uri.host.isEmpty) return null;
    return 'https://logo.clearbit.com/${uri.host}';
  }

  static String? googleFavicon(String packageName, Uri? uri, bool isCask) {
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
