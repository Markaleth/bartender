import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

extension OperationStatusAppearance on OperationStatus {
  Color get borderColor {
    return switch (this) {
      OperationStatus.inProgress => AppColors.primary,
      OperationStatus.success => AppColors.success,
      OperationStatus.error => AppColors.error,
      _ => AppColors.borderNeutral,
    };
  }

  Color get bgColor {
    return switch (this) {
      OperationStatus.inProgress => AppColors.primary.withValues(alpha: 0.2),
      OperationStatus.success => AppColors.success.withValues(alpha: 0.1),
      OperationStatus.error => AppColors.error.withValues(alpha: 0.1),
      _ => AppColors.surface,
    };
  }

  IconData get icon {
    return switch (this) {
      OperationStatus.inProgress => Icons.download,
      OperationStatus.success => Icons.check_circle_outline,
      OperationStatus.error => Icons.error_outline,
      _ => Icons.inventory_2,
    };
  }
}

class TaskVisualizerItem extends StatelessWidget {
  final OperationTask task;
  final bool isSelected;
  final VoidCallback onTap;

  const TaskVisualizerItem({
    super.key,
    required this.task,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: spacingXl,
          height: spacingXl,
          decoration: BoxDecoration(
            color: task.status.bgColor,
            borderRadius: BorderRadius.circular(radiusS),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : task.status.borderColor,
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
            task.status.icon,
            size: spacingM,
            color: task.status.borderColor == AppColors.borderNeutral
                ? AppColors.textSecondary
                : task.status.borderColor,
          ),
        ),
      ),
    );
  }
}
