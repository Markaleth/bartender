import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/data/shell/shell_command_result.dart';
import 'package:bartender/data/shell/streaming_shell_command.dart';

class BrewService {
  final SettingsService _settingsService;

  BrewService(this._settingsService);

  /// Runs a command quickly without streaming output.
  Future<ShellCommandResult> runCommand(List<String> args) async {
    try {
      final result = await ShellUtils.run('brew', args);
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
    final process = await ShellUtils.start('brew', args);
    return StreamingShellCommand(process);
  }

  // --- Generic Commands ---

  /// Run an arbitrary brew command without streaming.
  Future<ShellCommandResult> runCustom(List<String> args) {
    return runCommand(args);
  }

  Future<String> getPrefix() async {
    final prefixResult = await runCustom(['--prefix']);
    if (prefixResult.exitCode == 0) {
      return prefixResult.stdout.trim();
    }
    return '/opt/homebrew';
  }

  Future<String> getVersion() async {
    final result = await runCustom(['--version']);
    if (result.exitCode == 0) {
      // First line is typically "Homebrew x.y.z"
      final lines = result.stdout.trim().split('\n');
      if (lines.isNotEmpty) {
        final match = RegExp(r'Homebrew\s+([\d\.]+)').firstMatch(lines.first);
        if (match != null && match.groupCount >= 1) {
          return match.group(1)!;
        }
      }
    }
    return '';
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

  Future<ShellCommandResult> uninstall(String package, {bool isCask = false, bool? zap}) {
    final shouldZap = zap ?? _settingsService.zapUninstallDefault;
    final args = ['uninstall'];
    if (isCask) {
      args.add('--cask');
      if (shouldZap) args.add('--zap');
    }
    args.add(package);
    return runCommand(args);
  }

  Future<StreamingShellCommand> uninstallWithStream(
    String package, {
    bool isCask = false,
    bool? zap,
  }) {
    final shouldZap = zap ?? _settingsService.zapUninstallDefault;
    final args = ['uninstall'];
    if (isCask) {
      args.add('--cask');
      if (shouldZap) args.add('--zap');
    }
    args.add(package);
    return streamCommand(args);
  }

  Future<ShellCommandResult> reinstall(String package, {bool isCask = false}) {
    final args = ['reinstall'];
    if (isCask) args.add('--cask');
    args.add(package);
    return runCommand(args);
  }

  Future<StreamingShellCommand> reinstallWithStream(
    String package, {
    bool isCask = false,
  }) {
    final args = ['reinstall'];
    if (isCask) args.add('--cask');
    args.add(package);
    return streamCommand(args);
  }

  Future<void> openPackageDirectory(String package) async {
    final prefixResult = await runCustom(['--prefix', package]);
    if (prefixResult.exitCode == 0) {
      final path = prefixResult.stdout.trim();
      if (path.isNotEmpty) {
        await ShellUtils.run('open', [path]);
      }
    }
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
    if (_settingsService.greedyUpgrades) {
      args.add('--greedy');
    }
    return streamCommand(args);
  }

  Future<ShellCommandResult> search(String query) {
    return runCommand(['search', query]);
  }

  Future<ShellCommandResult> list() {
    return runCommand(['list']);
  }

  Future<ShellCommandResult> pin(String package) {
    return runCommand(['pin', package]);
  }

  Future<ShellCommandResult> unpin(String package) {
    return runCommand(['unpin', package]);
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

  Future<ShellCommandResult> doctorSync() {
    return runCommand(['doctor']);
  }

  Future<ShellCommandResult> autoremoveDryRun() {
    return runCommand(['autoremove', '--dry-run']);
  }

  Future<ShellCommandResult> cleanupDryRun() {
    return runCommand(['cleanup', '--dry-run']);
  }

  Future<ShellCommandResult> missing() {
    return runCommand(['missing']);
  }

  Future<StreamingShellCommand> cleanup() {
    return streamCommand(['cleanup']);
  }

  // --- Bundle Commands ---

  Future<ShellCommandResult> bundleDump({String? file}) {
    final args = ['bundle', 'dump'];
    if (file != null) {
      args.addAll(['--file', file]);
    } else {
      args.add('--force'); // Overwrite if exists in current dir
    }
    return runCommand(args);
  }

  Future<StreamingShellCommand> bundleInstall({String? file}) {
    final args = ['bundle', 'install'];
    if (file != null) {
      args.addAll(['--file', file]);
    }
    return streamCommand(args);
  }

  // --- Services Commands ---

  Future<ShellCommandResult> listTaps() {
    return runCommand(['tap-info', '--installed', '--json']);
  }

  Future<ShellCommandResult> addTap(String name) {
    return runCommand(['tap', name]);
  }

  Future<ShellCommandResult> removeTap(String name) {
    return runCommand(['untap', name]);
  }

  Future<ShellCommandResult> trustTap(String name) {
    return runCommand(['trust', name]);
  }

  Future<ShellCommandResult> untrustTap(String name) {
    return runCommand(['untrust', name]);
  }

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
