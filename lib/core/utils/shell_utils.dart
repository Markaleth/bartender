import 'dart:io';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Sandbox bridge used to run commands on the host.
enum HostBridge { none, distrobox, flatpak }

class ShellUtils {
  static String? _resolvedBrewPath;
  static SettingsService? _settingsService;

  static String? get resolvedBrewPath => _resolvedBrewPath;

  static void setSettingsService(SettingsService settingsService) {
    _settingsService = settingsService;
  }

  static Map<String, String>? _buildEnv(
    String executable,
    Map<String, String>? environment,
  ) {
    if (executable != 'brew') return environment;

    final disableAnalytics = _settingsService?.disableAnalytics ?? false;
    final suppressEnvHints = _settingsService?.suppressEnvHints ?? true;

    return {
      'HOMEBREW_NO_AUTO_UPDATE': '1',
      'HOMEBREW_NO_PAGER': '1',
      if (suppressEnvHints) 'HOMEBREW_NO_ENV_HINTS': '1',
      if (disableAnalytics) 'HOMEBREW_NO_ANALYTICS': '1',
      if (environment != null) ...environment,
    };
  }

  static bool get _isInContainer =>
      Platform.isLinux && File('/run/.containerenv').existsSync();

  static bool get _isInFlatpak =>
      Platform.isLinux && File('/.flatpak-info').existsSync();

  /// How commands reach the host: directly, or through a sandbox bridge.
  static HostBridge get hostBridge {
    if (_isInFlatpak) return HostBridge.flatpak;
    if (kDebugMode && _isInContainer) return HostBridge.distrobox;
    return HostBridge.none;
  }

  static bool get _usesHostBridge => hostBridge != HostBridge.none;

  /// Wraps [command] so it runs on the host under [bridge].
  ///
  /// `flatpak-spawn --host` does not forward the caller's environment, so
  /// [environment] is passed through as `--env=` flags.
  @visibleForTesting
  static List<String> bridgeCommand(
    HostBridge bridge,
    List<String> command, {
    Map<String, String>? environment,
  }) {
    switch (bridge) {
      case HostBridge.none:
        return command;
      case HostBridge.distrobox:
        return ['distrobox-host-exec', ...command];
      case HostBridge.flatpak:
        return [
          'flatpak-spawn',
          '--host',
          ...?environment?.entries.map((e) => '--env=${e.key}=${e.value}'),
          ...command,
        ];
    }
  }

  /// [command] wrapped for the current [hostBridge].
  static List<String> hostCommand(List<String> command) =>
      bridgeCommand(hostBridge, command);

  static Future<void> init() async {
    if (_usesHostBridge) {
      await _initViaHostBridge();
    } else {
      _initForHost();
    }
  }

  static Future<void> _initViaHostBridge() async {
    final hostShellPath = await _resolveViaHostShell();
    if (hostShellPath != null) {
      _resolvedBrewPath = hostShellPath;
      return;
    }

    final fallbackPath = await _resolveViaFallbackPaths();
    if (fallbackPath != null) {
      _resolvedBrewPath = fallbackPath;
      return;
    }

    _resolvedBrewPath = null;
    debugPrint(
      'Failed to resolve brew path dynamically through ${hostBridge.name}.',
    );
  }

  static void _initForHost() {
    if (File('/opt/homebrew/bin/brew').existsSync()) {
      _resolvedBrewPath = '/opt/homebrew/bin/brew';
    } else if (File('/usr/local/bin/brew').existsSync()) {
      _resolvedBrewPath = '/usr/local/bin/brew';
    } else if (File('/home/linuxbrew/.linuxbrew/bin/brew').existsSync()) {
      _resolvedBrewPath = '/home/linuxbrew/.linuxbrew/bin/brew';
    } else {
      try {
        final whichResult = Process.runSync('which', ['brew']);
        if (whichResult.exitCode == 0 &&
            whichResult.stdout.toString().trim().isNotEmpty) {
          _resolvedBrewPath = whichResult.stdout.toString().trim();
          return;
        }
      } catch (_) {}
      _resolvedBrewPath = null;
      debugPrint(
        'Failed to resolve brew path natively. Relying on system PATH.',
      );
    }
  }

  static Future<bool> isBrewExecutableAvailable() async {
    final customPath = _settingsService?.brewExecutablePath;
    if (customPath != null && customPath.isNotEmpty) {
      if (await _isExecutable(customPath)) return true;
    }

    if (_resolvedBrewPath != null) {
      if (await _isExecutable(_resolvedBrewPath!)) return true;
    }

    try {
      final res = await run('brew', ['--version']);
      if (res.exitCode == 0) {
        return true;
      }
    } catch (_) {}

    return false;
  }

  static Future<bool> _isExecutable(String path) async {
    if (!_usesHostBridge) return File(path).existsSync();
    try {
      final res = await _runOnHost(['test', '-x', path]);
      return res.exitCode == 0;
    } catch (_) {
      return false;
    }
  }

  /// Whether [name] resolves on the host's PATH.
  static Future<bool> isHostCommandAvailable(String name) async {
    try {
      final res = await _runOnHost([
        'sh',
        '-c',
        'command -v "\$1"',
        'sh',
        name,
      ]);
      return res.exitCode == 0;
    } catch (_) {
      return false;
    }
  }

  static Future<ProcessResult> _runOnHost(List<String> command) {
    final bridged = hostCommand(command);
    return Process.run(
      bridged.first,
      bridged.sublist(1),
    ).timeout(defaultTimeoutDuration);
  }

  static Future<String?> _resolveViaHostShell() async {
    try {
      final result = await _runOnHost(['sh', '-c', 'command -v brew']);
      if (result.exitCode == 0 && result.stdout.toString().trim().isNotEmpty) {
        final path = result.stdout.toString().trim();
        debugPrint('Resolved brew path via host shell: $path');
        return path;
      }
    } catch (e) {
      debugPrint('Error attempting to resolve brew via host shell: $e');
    }
    return null;
  }

  static Future<String?> _resolveViaFallbackPaths() async {
    const fallbackPaths = [
      '/opt/homebrew/bin/brew', // macOS Apple Silicon
      '/usr/local/bin/brew', // macOS Intel
      '/home/linuxbrew/.linuxbrew/bin/brew', // Linux
    ];

    for (final path in fallbackPaths) {
      if (await _isExecutable(path)) {
        debugPrint('Resolved brew path via fallback test: $path');
        return path;
      }
    }
    return null;
  }

  static String _resolveExecutable(String executable) {
    if (executable != 'brew') return executable;
    final customPath = _settingsService?.brewExecutablePath;
    if (customPath != null && customPath.isNotEmpty) {
      return customPath;
    }
    if (_resolvedBrewPath != null) return _resolvedBrewPath!;
    return _usesHostBridge ? '/home/linuxbrew/.linuxbrew/bin/brew' : executable;
  }

  static List<String> _buildCommand(
    String executable,
    List<String> args,
    Map<String, String>? environment,
  ) {
    return bridgeCommand(hostBridge, [
      _resolveExecutable(executable),
      ...args,
    ], environment: environment);
  }

  static Future<ProcessResult> run(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
  }) async {
    Sentry.addBreadcrumb(
      Breadcrumb(
        category: 'shell.exec',
        message: '$executable ${arguments.join(' ')}',
        level: SentryLevel.info,
      ),
    );

    try {
      final env = _buildEnv(executable, environment);
      final command = _buildCommand(executable, arguments, env);
      final result = await Process.run(
        command.first,
        command.sublist(1),
        workingDirectory: workingDirectory,
        environment: env,
        includeParentEnvironment: includeParentEnvironment,
        runInShell: runInShell,
      );

      if (result.exitCode != 0) {
        final stderrSnippet = result.stderr.toString().trim();
        Sentry.addBreadcrumb(
          Breadcrumb(
            category: 'shell.failure',
            message: '$executable exited with code ${result.exitCode}',
            level: SentryLevel.warning,
            data: {
              'exitCode': result.exitCode,
              if (stderrSnippet.isNotEmpty)
                'stderr': stderrSnippet.length > 300
                    ? stderrSnippet.substring(0, 300)
                    : stderrSnippet,
            },
          ),
        );
      }

      return result;
    } catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('shell_operation', 'run');
          scope.setTag('executable', executable);
        },
      );
      rethrow;
    }
  }

  static Future<void> openDirectory(String path) async {
    final executable = Platform.isLinux ? 'xdg-open' : 'open';
    try {
      await run(executable, [path]);
    } catch (e) {
      debugPrint('Error opening directory: $e');
    }
  }

  static Future<DateTime?> getModifiedDate(String path) async {
    // Try fast Dart native stat
    try {
      final stat = FileStat.statSync(path);
      if (stat.type != FileSystemEntityType.notFound) return stat.modified;
    } catch (_) {}

    // Fallback to shell stat if Dart sandboxed
    try {
      final flag = Platform.isMacOS ? '-f%m' : '-c%Y';
      final res = await ShellUtils.run('stat', [flag, path]);
      if (res.exitCode == 0) {
        final seconds = int.tryParse(res.stdout.toString().trim());
        if (seconds != null) {
          return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
        }
      }
    } catch (_) {}

    return null;
  }

  static Future<Process> start(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
    ProcessStartMode mode = ProcessStartMode.normal,
  }) async {
    final sanitizedArgs = arguments.join(' ');
    Sentry.addBreadcrumb(
      Breadcrumb(
        category: 'shell.stream_start',
        message: '$executable $sanitizedArgs',
        level: SentryLevel.info,
        data: {
          'executable': executable,
          'workingDirectory': workingDirectory ?? 'default',
        },
      ),
    );

    try {
      final env = _buildEnv(executable, environment);
      final command = _buildCommand(executable, arguments, env);
      return await Process.start(
        command.first,
        command.sublist(1),
        workingDirectory: workingDirectory,
        environment: env,
        includeParentEnvironment: includeParentEnvironment,
        runInShell: runInShell,
        mode: mode,
      );
    } catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('shell_operation', 'start');
          scope.setTag('executable', executable);
        },
      );
      rethrow;
    }
  }
}
