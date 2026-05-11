import 'dart:io';
import 'package:flutter/foundation.dart';

class ShellUtils {
  static bool get _isInContainer =>
      Platform.isLinux && File('/run/.containerenv').existsSync();

  static String _getExecutable(String executable) {
    if (kDebugMode && _isInContainer) {
      return 'distrobox-host-exec';
    }
    return executable;
  }

  static List<String> _buildArgs(String executable, List<String> args) {
    if (kDebugMode && _isInContainer) {
      if (executable == 'brew') {
        return ['/home/linuxbrew/.linuxbrew/bin/brew', ...args];
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
      environment: environment,
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
    );
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
      environment: environment,
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
      mode: mode,
    );
  }
}
