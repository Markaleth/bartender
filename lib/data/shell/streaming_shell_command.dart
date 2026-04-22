import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StreamingShellCommand {
  final Process _process;
  
  StreamingShellCommand(this._process);

  /// Stream of stdout lines
  Stream<String> get stdout => _process.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter());

  /// Stream of stderr lines
  Stream<String> get stderr => _process.stderr
      .transform(utf8.decoder)
      .transform(const LineSplitter());

  /// Stream of combined stdout and stderr chunks (not necessarily split by line, useful for raw terminal parsing)
  Stream<String> get mergedOutput {
    final controller = StreamController<String>();
    
    _process.stdout.transform(utf8.decoder).listen((data) => controller.add(data));
    _process.stderr.transform(utf8.decoder).listen((data) => controller.add(data));
    
    _process.exitCode.then((_) => controller.close());
    
    return controller.stream;
  }

  /// Future that completes with the exit code
  Future<int> get exitCode => _process.exitCode;
}
