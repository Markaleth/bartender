import 'dart:io';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:flutter/foundation.dart';

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

  static Future<void> init() async {
    if (kDebugMode && _isInContainer) {
      await _initForContainer();
    } else {
      _initForHost();
    }
  }

  static Future<void> _initForContainer() async {
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

    _resolvedBrewPath = '/home/linuxbrew/.linuxbrew/bin/brew';
    debugPrint(
      'Failed to resolve brew path dynamically. Defaulting to: $_resolvedBrewPath',
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
      debugPrint(
        'Failed to resolve brew path natively. Relying on system PATH.',
      );
    }
  }

  static Future<String?> _resolveViaHostShell() async {
    try {
      final result = await Process.run('distrobox-host-exec', [
        'sh',
        '-c',
        'command -v brew',
      ]).timeout(defaultTimeoutDuration);
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
      try {
        final res = await Process.run('distrobox-host-exec', [
          'test',
          '-x',
          path,
        ]).timeout(defaultTimeoutDuration);
        if (res.exitCode == 0) {
          debugPrint('Resolved brew path via fallback test: $path');
          return path;
        }
      } catch (e) {
        debugPrint('Error testing fallback path $path: $e');
      }
    }
    return null;
  }

  static String _getExecutable(String executable) {
    if (kDebugMode && _isInContainer) {
      return 'distrobox-host-exec';
    }
    if (executable == 'brew') {
      final customPath = _settingsService?.brewExecutablePath;
      if (customPath != null && customPath.isNotEmpty) {
        return customPath;
      }
      return _resolvedBrewPath ?? executable;
    }
    return executable;
  }

  static List<String> _buildArgs(String executable, List<String> args) {
    if (kDebugMode && _isInContainer) {
      if (executable == 'brew') {
        final customPath = _settingsService?.brewExecutablePath;
        if (customPath != null && customPath.isNotEmpty) {
          return [customPath, ...args];
        }
        return [
          _resolvedBrewPath ?? '/home/linuxbrew/.linuxbrew/bin/brew',
          ...args,
        ];
      }
      return [executable, ...args];
    }
    return args;
  }

  static Future<ProcessResult> run(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
  }) {
    return Process.run(
      _getExecutable(executable),
      _buildArgs(executable, arguments),
      workingDirectory: workingDirectory,
      environment: _buildEnv(executable, environment),
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
    );
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
  }) {
    return Process.start(
      _getExecutable(executable),
      _buildArgs(executable, arguments),
      workingDirectory: workingDirectory,
      environment: _buildEnv(executable, environment),
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
      mode: mode,
    );
  }
}
