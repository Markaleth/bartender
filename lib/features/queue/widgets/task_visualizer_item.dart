import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';

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

  String get iconAssetName {
    return switch (this) {
      OperationStatus.inProgress => downloadIcon,
      OperationStatus.success => checkIcon,
      OperationStatus.error => warningIcon,
      _ => barrelIcon,
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
              color: isSelected ? AppColors.primary : task.status.borderColor,
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
          child: IconWidget(
            assetName: task.status.iconAssetName,
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
