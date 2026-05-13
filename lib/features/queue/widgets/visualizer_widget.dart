import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/queue/models/queue_state.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:flutter/material.dart';

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

  ({Color borderColor, Color bgColor, IconData icon}) _getTaskAppearance(
    OperationStatus status,
  ) {
    return switch (status) {
      OperationStatus.inProgress => (
        borderColor: AppColors.primary,
        bgColor: AppColors.primary.withValues(alpha: 0.2),
        icon: Icons.download,
      ),
      OperationStatus.success => (
        borderColor: AppColors.secondary,
        bgColor: AppColors.secondary.withValues(alpha: 0.1),
        icon: Icons.check_circle_outline,
      ),
      OperationStatus.error => (
        borderColor: AppColors.error,
        bgColor: AppColors.error.withValues(alpha: 0.1),
        icon: Icons.error_outline,
      ),
      _ => (
        borderColor: AppColors.borderNeutral,
        bgColor: AppColors.surface,
        icon: Icons.inventory_2,
      ),
    };
  }

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
          height: 1,
          color: AppColors.borderNeutral,
          margin: const EdgeInsets.symmetric(horizontal: spacingS),
        ),
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          final isSelected = state.activeTaskId == task.id;
          final appearance = _getTaskAppearance(task.status);

          return GestureDetector(
            onTap: () => viewModel.selectTask(task.id),
            child: Center(
              child: Container(
                width: spacingXl,
                height: spacingXl,
                decoration: BoxDecoration(
                  color: appearance.bgColor,
                  borderRadius: BorderRadius.circular(radiusS),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : appearance.borderColor,
                    width: isSelected ? thicknessS : thicknessXs,
                  ),
                  boxShadow: task.status == OperationStatus.inProgress
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            blurRadius: 10,
                          ),
                        ]
                      : null,
                ),
                child: Icon(
                  appearance.icon,
                  size: spacingM,
                  color: appearance.borderColor == AppColors.borderNeutral
                      ? AppColors.textSecondary
                      : appearance.borderColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
