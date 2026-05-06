import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xterm/xterm.dart';

class TerminalOutputView extends StatefulWidget {
  final Stream<String> outputStream;

  const TerminalOutputView({super.key, required this.outputStream});

  @override
  State<TerminalOutputView> createState() => _TerminalOutputViewState();
}

class _TerminalOutputViewState extends State<TerminalOutputView> {
  late final Terminal _terminal;
  StreamSubscription<String>? _subscription;

  @override
  void initState() {
    super.initState();
    _terminal = Terminal();
    _subscribeToStream();
  }

  @override
  void didUpdateWidget(covariant TerminalOutputView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.outputStream != widget.outputStream) {
      _subscription?.cancel();
      _terminal.eraseDisplay();
      _terminal.setCursor(0, 0);
      _subscribeToStream();
    }
  }

  void _subscribeToStream() {
    _subscription = widget.outputStream.listen((chunk) {
      if (mounted) {
        _terminal.write(chunk);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(8.0),
      child: TerminalView(_terminal),
    );
  }
}
