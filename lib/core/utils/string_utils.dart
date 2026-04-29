class StringUtils {
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
