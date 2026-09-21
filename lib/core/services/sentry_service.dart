import 'package:bartender/core/config/env.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryService {
  static final RegExp _userPathRegex = RegExp(r'(/Users/|/home/)[^/\s]+');

  /// Initializes Sentry and wraps the app startup inside Sentry's guarded zone.
  static Future<void> init({
    required SettingsService settingsService,
    required AppRunner appRunner,
  }) async {
    await SentryFlutter.init((options) {
      options.dsn = Env.sentryDsn.isNotEmpty ? Env.sentryDsn : null;
      options.tracesSampleRate = kReleaseMode ? 0.2 : 1.0;
      options.environment = kReleaseMode ? 'production' : 'development';
      options.sendDefaultPii = false;
      options.enableNativeCrashHandling = true;
      options.enableAutoSessionTracking = true;

      options.beforeSend = (event, hint) {
        if (!settingsService.enableCrashReporting) {
          return null;
        }
        return _scrubSensitivePaths(event);
      };

      options.beforeBreadcrumb = (breadcrumb, hint) {
        return _scrubBreadcrumb(breadcrumb);
      };
    }, appRunner: appRunner);
  }

  static SentryEvent? _scrubSensitivePaths(SentryEvent event) {
    final scrubbedExceptions = event.exceptions?.map((ex) {
      return ex.copyWith(
        value: ex.value?.replaceAll(_userPathRegex, r'$1[REDACTED]'),
      );
    }).toList();

    final scrubbedBreadcrumbs = event.breadcrumbs
        ?.map(_scrubBreadcrumb)
        .whereType<Breadcrumb>()
        .toList();

    return event.copyWith(
      message: event.message?.copyWith(
        formatted: event.message?.formatted.replaceAll(
          _userPathRegex,
          r'$1[REDACTED]',
        ),
      ),
      exceptions: scrubbedExceptions,
      breadcrumbs: scrubbedBreadcrumbs,
    );
  }

  static Breadcrumb? _scrubBreadcrumb(Breadcrumb? breadcrumb) {
    if (breadcrumb == null) return null;
    return breadcrumb.copyWith(
      message: breadcrumb.message?.replaceAll(_userPathRegex, r'$1[REDACTED]'),
    );
  }
}
