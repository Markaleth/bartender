class ShellCommandResult {
  final int exitCode;
  final String stdout;
  final String stderr;

  bool get isSuccess => exitCode == 0;

  ShellCommandResult({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });

  @override
  String toString() {
    return 'ShellCommandResult(exitCode: $exitCode, stdout: $stdout, stderr: $stderr)';
  }
}
