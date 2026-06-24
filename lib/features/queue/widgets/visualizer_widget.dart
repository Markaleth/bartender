import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/queue/models/queue_state.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:flutter/material.dart';

import 'task_visualizer_item.dart';

class VisualizerWidget extends StatelessWidget {
  const VisualizerWidget({
    super.key,
    required this.context,
    required this.viewModel,
    required this.state,
  });

  final BuildContext context;
  final QueueViewModel viewModel;
  final QueueState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: terminalDrawerQueueVisualizerHeight,
      padding: const EdgeInsets.symmetric(horizontal: spacingM),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.surface)),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.tasks.length,
        separatorBuilder: (_, _) => Container(
          width: spacingM,
          height: thicknessXs,
          color: AppColors.borderNeutral,
          margin: const EdgeInsets.symmetric(horizontal: spacingS),
        ),
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          final isSelected = state.activeTaskId == task.id;

          return TaskVisualizerItem(
            task: task,
            isSelected: isSelected,
            onTap: () => viewModel.selectTask(task.id),
          );
        },
      ),
    );
  }
}
