import 'dart:io';

import 'package:bartender/data/shell/shell_command_result.dart';
import 'package:bartender/data/shell/streaming_shell_command.dart';
import 'package:flutter/foundation.dart';

class BrewService {
  bool get _isInContainer =>
      Platform.isLinux && File('/run/.containerenv').existsSync();

  String get _executable {
    if (kDebugMode && _isInContainer) {
      return 'distrobox-host-exec';
    }
    return 'brew';
  }

  List<String> _buildArgs(List<String> args) {
    if (kDebugMode && _isInContainer) {
      return ['/home/linuxbrew/.linuxbrew/bin/brew', ...args];
    }
    return args;
  }

  /// Runs a command quickly without streaming output.
  Future<ShellCommandResult> runCommand(List<String> args) async {
    try {
      final result = await Process.run(_executable, _buildArgs(args));
      return ShellCommandResult(
        exitCode: result.exitCode,
        stdout: result.stdout as String,
        stderr: result.stderr as String,
      );
    } catch (e) {
      return ShellCommandResult(exitCode: -1, stdout: '', stderr: e.toString());
    }
  }

  /// Starts a command and streams its output.
  Future<StreamingShellCommand> streamCommand(List<String> args) async {
    final process = await Process.start(_executable, _buildArgs(args));
    return StreamingShellCommand(process);
  }

  // --- Generic Commands ---

  /// Run an arbitrary brew command without streaming.
  Future<ShellCommandResult> runCustom(List<String> args) {
    return runCommand(args);
  }

  /// Run an arbitrary brew command and stream its output.
  Future<StreamingShellCommand> runCustomStream(List<String> args) {
    return streamCommand(args);
  }

  // --- Essential Commands Helpers ---

  Future<ShellCommandResult> install(String package, {bool isCask = false}) {
    final args = ['install'];
    if (isCask) args.add('--cask');
    args.add(package);
    return runCommand(args);
  }

  Future<StreamingShellCommand> installWithStream(
    String package, {
    bool isCask = false,
  }) {
    final args = ['install'];
    if (isCask) args.add('--cask');
    args.add(package);
    return streamCommand(args);
  }

  Future<ShellCommandResult> uninstall(String package, {bool isCask = false}) {
    final args = ['uninstall'];
    if (isCask) args.add('--cask');
    args.add(package);
    return runCommand(args);
  }

  Future<StreamingShellCommand> uninstallWithStream(
    String package, {
    bool isCask = false,
  }) {
    final args = ['uninstall'];
    if (isCask) args.add('--cask');
    args.add(package);
    return streamCommand(args);
  }

  Future<StreamingShellCommand> update() {
    return streamCommand(['update']);
  }

  Future<StreamingShellCommand> upgrade({
    String? package,
    bool isCask = false,
  }) {
    final args = ['upgrade'];
    if (package != null) {
      if (isCask) args.add('--cask');
      args.add(package);
    }
    return streamCommand(args);
  }

  Future<ShellCommandResult> search(String query) {
    return runCommand(['search', query]);
  }

  Future<ShellCommandResult> list() {
    return runCommand(['list']);
  }

  Future<ShellCommandResult> info(String package) {
    return runCommand(['info', '--json=v2', package]);
  }

  Future<ShellCommandResult> infoInstalled() {
    return runCommand(['info', '--installed', '--json=v2']);
  }

  Future<ShellCommandResult> outdated() {
    return runCommand(['outdated', '--json=v2']);
  }

  Future<StreamingShellCommand> doctor() {
    return streamCommand(['doctor']);
  }

  Future<StreamingShellCommand> cleanup() {
    return streamCommand(['cleanup']);
  }

  // --- Services Commands ---

  Future<ShellCommandResult> servicesStart(String service) {
    return runCommand(['services', 'start', service]);
  }

  Future<ShellCommandResult> servicesStop(String service) {
    return runCommand(['services', 'stop', service]);
  }

  Future<ShellCommandResult> servicesRestart(String service) {
    return runCommand(['services', 'restart', service]);
  }

  Future<ShellCommandResult> servicesList() {
    return runCommand(['services', 'list']);
  }
}
