import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class LogListViewer extends StatefulWidget {
  final List<String> logs;

  const LogListViewer({super.key, required this.logs});

  @override
  State<LogListViewer> createState() => _LogListViewerState();
}

class _LogListViewerState extends State<LogListViewer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant LogListViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logs.length > oldWidget.logs.length) {
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
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.all(spacingM),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.logs.length,
        itemBuilder: (context, index) {
          return Text(
            widget.logs[index],
            style: context.monoS.copyWith(color: AppColors.textSecondary),
          );
        },
      ),
    );
  }
}
