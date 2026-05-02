import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static Future<void> launch(String urlString) async {
    log('Launching URL: $urlString');
    try {
      final uri = Uri.parse(urlString);
      // SECURITY: Strictly allow only HTTP and HTTPS schemes
      if (uri.scheme != 'http' && uri.scheme != 'https') {
        log(
          'Security Block: Attempted to launch non-http/https URL scheme: ${uri.scheme}',
        );
        return;
      }

      if (kDebugMode && Platform.isLinux) {
        // uri.toString() is now guaranteed to be an http/https URL,
        // and Process.run (with runInShell: false) prevents shell injection.
        await Process.run('xdg-open', [uri.toString()]);
      } else {
        final launched = await launchUrl(uri);
        if (!launched) {
          log('Could not launch $urlString');
        }
      }
    } catch (e) {
      log('Error launching URL: $e');
    }
  }
}
