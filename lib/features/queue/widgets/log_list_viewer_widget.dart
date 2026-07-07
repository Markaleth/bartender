import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogListViewer extends StatefulWidget {
  final ValueNotifier<List<String>> logsNotifier;

  const LogListViewer({super.key, required this.logsNotifier});

  @override
  State<LogListViewer> createState() => _LogListViewerState();
}

class _LogListViewerState extends State<LogListViewer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.logsNotifier.addListener(_onLogsChanged);
  }

  @override
  void didUpdateWidget(covariant LogListViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logsNotifier != oldWidget.logsNotifier) {
      oldWidget.logsNotifier.removeListener(_onLogsChanged);
      widget.logsNotifier.addListener(_onLogsChanged);
    }
  }

  void _onLogsChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: logListViewerScrollAnimationDuration,
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    widget.logsNotifier.removeListener(_onLogsChanged);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.all(spacingM),
      child: ValueListenableBuilder<List<String>>(
        valueListenable: widget.logsNotifier,
        builder: (context, logs, child) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: logs.length,
            itemBuilder: (context, index) {
              return Text(
                logs[index],
                style: context.monoS.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: settings.terminalFontSize,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
