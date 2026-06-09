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

  /// Formats an integer with comma separators.
  /// Example: 120400 becomes '120,400'.
  static String formatWithCommas(int? value, {String fallback = 'N/A'}) {
    if (value == null) return fallback;
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  static String formatSize(dynamic size) {
    if (size == null) return 'Unknown';

    int? bytes;
    if (size is int) {
      bytes = size;
    } else if (size is String) {
      bytes = int.tryParse(size);
      if (bytes == null) return size; // Return string if not int
    }

    if (bytes == null) return 'Unknown';

    return switch (bytes) {
      0 => '0 B',
      < 1024 => '$bytes B',
      < 1024 * 1024 => '${(bytes / 1024).toStringAsFixed(1)} KB',
      < 1024 * 1024 * 1024 => '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB',
      < 1024 * 1024 * 1024 * 1024 => '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB',
      _ => '${(bytes / (1024 * 1024 * 1024 * 1024)).toStringAsFixed(2)} TB',
    };
  }

  static String formatDate(int? timestamp) {
    if (timestamp == null) return 'Unknown';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  static String parseTapName(String input) {
    var s = input.trim();

    // Drop .git
    s = s.replaceAll(RegExp(r'\.git$'), '');

    // Get path from git@ or http
    if (s.startsWith('git@')) {
      s = s.split(':').last;
    } else if (s.startsWith('http')) {
      s = Uri.tryParse(s)?.path.replaceAll(RegExp(r'^/'), '') ?? s;
    }

    // Get user/repo, strip homebrew-
    final parts = s.split('/');
    if (parts.length >= 2) {
      final user = parts[parts.length - 2];
      var repo = parts.last;
      if (repo.startsWith('homebrew-')) {
        repo = repo.replaceFirst('homebrew-', '');
      }
      return '$user/$repo';
    }

    return s;
  }

  static String? formatSystemStorage(String? storage) {
    if (storage == null) return null;
    final sizeMatch = RegExp(r'^(\S+)').firstMatch(storage);

    if (sizeMatch != null) {
      final size = sizeMatch.group(1)!.toUpperCase();
      return size.replaceAllMapped(RegExp(r'([KMGT])$'), (m) => ' ${m[1]}B');
    }
    return null;
  }
}
