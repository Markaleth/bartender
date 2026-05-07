import 'package:bartender/features/queue/models/queue_state.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/queue/widgets/header_widget.dart';
import 'package:bartender/features/queue/widgets/log_list_viewer_widget.dart';
import 'package:bartender/features/queue/widgets/visualizer_widget.dart';
import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({
    super.key,
    required this.viewModel,
    required this.state,
  });

  final QueueViewModel viewModel;
  final QueueState state;

  @override
  Widget build(BuildContext context) {
    final activeTask = state.tasks
        .where((t) => t.id == state.activeTaskId)
        .firstOrNull;

    return Column(
      children: [
        HeaderWidget(
          toggleDrawer: viewModel.toggleDrawer,
          clearCompleted: viewModel.clearCompleted,
        ),
        VisualizerWidget(
          context: context,
          viewModel: viewModel,
          state: state,
        ),
        Expanded(
          child: activeTask != null
              ? LogListViewer(logs: activeTask.logs)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
