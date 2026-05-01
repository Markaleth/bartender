class StringUtils {
  /// Extracts a variant tag from a token by comparing it with the application name.
  /// Example: name "Discord", token "discord-ptb" -> returns "PTB"
  static String? extractVariantTag(String name, String token) {
    final normalizedName = name.toLowerCase().replaceAll(' ', '-');
    
    // Exact match, no variant
    if (normalizedName == token) {
      return null;
    }

    if (token.startsWith(normalizedName)) {
      final suffix = token.substring(normalizedName.length);
      
      if (suffix.startsWith('-')) {
        return suffix.substring(1).toUpperCase();
      } else if (suffix.startsWith('@')) {
        return suffix.substring(1).toUpperCase();
      }
    }

    return null;
  }

  /// Formats an integer into a shorthand representation.
  /// Example: 242095 becomes '242k', 1500000 becomes '1.5m'
  static String? formatDownloads(int? value) {
    if (value == null) {
      return null;
    }

    if (value >= 1000000) {
      final double millions = value / 1000000;
      return '${millions.toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}m';
    } else if (value >= 1000) {
      final int thousands = value ~/ 1000;
      return '${thousands}k';
    }

    return value.toString();
  }
}
