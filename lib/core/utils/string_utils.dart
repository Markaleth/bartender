import 'dart:ui';

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

  /// Returns a semantic color for a given variant tag.
  static Color getVariantColor(String tag) {
    final lowercaseTag = tag.toLowerCase();
    switch (lowercaseTag) {
      case 'beta':
        return const Color(0xFFE67E22); // Orange
      case 'ptb':
        return const Color(0xFF3498DB); // Blue
      case 'nightly':
        return const Color(0xFF9B59B6); // Purple
      case 'canary':
        return const Color(0xFFF1C40F); // Yellow
      case 'developer-edition':
      case 'dev':
        return const Color(0xFF1ABC9C); // Teal
      case 'esr':
        return const Color(0xFF2ECC71); // Green
      default:
        // Try to see if it's a version number like "3.10"
        if (RegExp(r'^[0-9.]+$').hasMatch(tag)) {
          return const Color(0xFF95A5A6); // Gray
        }
        return const Color(0xFF7F8C8D); // Dark Gray for unknown tags
    }
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
