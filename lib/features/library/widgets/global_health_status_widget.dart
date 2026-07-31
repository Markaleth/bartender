import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/models/system_health_state.dart';

class GlobalHealthStatusWidget extends StatelessWidget {
  final SystemHealthState healthState;
  final VoidCallback onAutoremove;
  final VoidCallback onOpenDashboard;

  const GlobalHealthStatusWidget({
    super.key,
    required this.healthState,
    required this.onAutoremove,
    required this.onOpenDashboard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingM),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: StatusCard(
                  title: systemStorageUsedLabel,
                  value: healthState.systemStorageUsed,
                  icon: storageIcon,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: orphanedDependenciesLabel,
                  value: healthState.orphanedDependenciesCount.toString(),
                  icon: missingDependencyIcon,
                  color: healthState.orphanedDependenciesCount > 0
                      ? AppColors.error
                      : AppColors.secondary,
                  action: healthState.orphanedDependenciesCount > 0
                      ? IconButton(
                        icon: const IconWidget(
                          assetName: updateIcon,
                          color: AppColors.textPrimary,
                          size: iconSizeM,
                        ),
                          onPressed: onAutoremove,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: globalHealthScoreTitle,
                  value: '${healthState.globalHealthScore}%',
                  icon: healthIcon,
                  color: healthState.healthScoreColor,
                  action: IconButton(
                    icon: const IconWidget(
                      assetName: openNewIcon,
                      color: AppColors.textPrimary,
                      size: iconSizeM,
                    ),
                    onPressed: onOpenDashboard,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: spacingM),
          Row(
            children: [
              Expanded(
                child: StatusCard(
                  title: pendingUpdatesLabel,
                  value: healthState.outdatedCount.toString(),
                  icon: systemUpdateIcon,
                  color: healthState.outdatedCount > 0
                      ? AppColors.warning
                      : AppColors.secondary,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: reclaimableSpaceLabel,
                  value: healthState.reclaimableSpace,
                  icon: cleanupIcon,
                  color:
                      healthState.reclaimableSpace != '0 B' &&
                          healthState.reclaimableSpace.isNotEmpty
                      ? AppColors.warning
                      : AppColors.secondary,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: doctorWarningsLabel,
                  value:
                      (healthState.doctorWarningsCount +
                              healthState.doctorErrorsCount)
                          .toString(),
                  icon: doctorIcon,
                  color:
                      (healthState.doctorWarningsCount > 0 ||
                          healthState.doctorErrorsCount > 0)
                      ? AppColors.error
                      : AppColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  final Color color;
  final Widget? action;

  const StatusCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radiusM),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconWidget(assetName: icon, color: color),
              const SizedBox(width: spacingS),
              Expanded(
                child: Text(
                  title,
                  style: context.bodyM.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ?action,
            ],
          ),
          const SizedBox(height: spacingM),
          Text(
            value,
            style: context.headM.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
