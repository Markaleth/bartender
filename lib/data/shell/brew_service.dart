import 'dart:io';

import 'package:bartender/data/shell/shell_command_result.dart';
import 'package:bartender/data/shell/streaming_shell_command.dart';

class BrewService {
  final String executable;

  BrewService({this.executable = 'brew'});

  /// Runs a command quickly without streaming output.
  Future<ShellCommandResult> runCommand(List<String> args) async {
    try {
      final result = await Process.run(executable, args);
      return ShellCommandResult(
        exitCode: result.exitCode,
        stdout: result.stdout as String,
        stderr: result.stderr as String,
      );
    } catch (e) {
      return ShellCommandResult(
        exitCode: -1,
        stdout: '',
        stderr: e.toString(),
      );
    }
  }

  /// Starts a command and streams its output.
  Future<StreamingShellCommand> streamCommand(List<String> args) async {
    final process = await Process.start(executable, args);
    return StreamingShellCommand(process);
  }

  // --- Essential Commands Helpers ---

  Future<ShellCommandResult> install(String package, {bool isCask = false}) {
    final args = ['install'];
    if (isCask) args.add('--cask');
    args.add(package);
    return runCommand(args);
  }

  Future<StreamingShellCommand> installWithStream(String package, {bool isCask = false}) {
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

  Future<StreamingShellCommand> uninstallWithStream(String package, {bool isCask = false}) {
    final args = ['uninstall'];
    if (isCask) args.add('--cask');
    args.add(package);
    return streamCommand(args);
  }

  Future<StreamingShellCommand> update() {
    return streamCommand(['update']);
  }

  Future<StreamingShellCommand> upgrade({String? package, bool isCask = false}) {
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
