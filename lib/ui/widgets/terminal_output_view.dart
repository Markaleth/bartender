import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bartender/utils/ansi_parser.dart';

class TerminalOutputView extends StatefulWidget {
  final Stream<String> outputStream;

  const TerminalOutputView({super.key, required this.outputStream});

  @override
  State<TerminalOutputView> createState() => _TerminalOutputViewState();
}

class _TerminalOutputViewState extends State<TerminalOutputView> {
  final List<String> _lines = [];
  final ScrollController _scrollController = ScrollController();
  StreamSubscription<String>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscribeToStream();
  }

  @override
  void didUpdateWidget(covariant TerminalOutputView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.outputStream != widget.outputStream) {
      _subscription?.cancel();
      _lines.clear();
      _subscribeToStream();
    }
  }

  void _subscribeToStream() {
    _subscription = widget.outputStream.listen((line) {
      if (mounted) {
        setState(() {
          _lines.add(line);
        });
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _lines.length,
        itemBuilder: (context, index) {
          return SelectableText.rich(
            TextSpan(children: AnsiParser.parse(_lines[index])),
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              color: Colors.white70,
              height: 1.2,
            ),
          );
        },
      ),
    );
  }
}
