import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/models/system_health_state.dart';

class HealthDashboardModal extends StatelessWidget {
  final SystemHealthState healthState;
  final VoidCallback onUpdateAll;
  final VoidCallback onCleanup;
  final VoidCallback onRemoveOrphans;

  const HealthDashboardModal({
    super.key,
    required this.healthState,
    required this.onUpdateAll,
    required this.onCleanup,
    required this.onRemoveOrphans,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusL),
      ),
      child: Container(
        width: globalHealthStatusDialogSize,
        height: globalHealthStatusDialogSize,
        padding: const EdgeInsets.all(spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  systemHealthTitle,
                  style: context.headM.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: spacingL),
            Expanded(
              child: ListView(
                children: [
                  HealthDashboardSection(
                    title: outdatedPackagesTitle,
                    value: '${healthState.outdatedCount} updates available',
                    actionLabel: updateAllActionLabel,
                    onAction: healthState.outdatedCount > 0
                        ? onUpdateAll
                        : null,
                    iconAssetName: systemUpdateIcon,
                  ),
                  const SizedBox(height: spacingM),
                  HealthDashboardSection(
                    title: reclaimDiskSpaceTitle,
                    value: healthState.reclaimableSpace,
                    actionLabel: runCleanupActionLabel,
                    onAction:
                        healthState.reclaimableSpace != '0 B' &&
                            healthState.reclaimableSpace.isNotEmpty
                        ? onCleanup
                        : null,
                    iconAssetName: cleanupIcon,
                  ),
                  const SizedBox(height: spacingM),
                  HealthDashboardSection(
                    title: orphanedDependenciesTitle,
                    value: '${healthState.orphanedDependenciesCount} orphans',
                    actionLabel: removeOrphansActionLabel,
                    onAction: healthState.orphanedDependenciesCount > 0
                        ? onRemoveOrphans
                        : null,
                    iconAssetName: missingDependencyIcon,
                  ),
                  const SizedBox(height: spacingM),
                  Text(
                    brewDoctorTitle,
                    style: context.titleM.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: spacingS),
                  if (healthState.doctorIssues.isEmpty)
                    Text(
                      noIssuesCopy,
                      style: context.bodyM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                  else
                  //TODO: lol, why??? asMap? why the fuckMothertingChrist??
                    ...healthState.doctorIssues.asMap().entries.map(
                      (entry) => Container(
                        margin: const EdgeInsets.only(bottom: spacingS),
                        padding: const EdgeInsets.all(spacingM),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(radiusM),
                          border: Border.all(color: AppColors.borderNeutral),
                        ),
                        child: Row(
                          children: [
                            if (entry.value.toLowerCase().contains('warning'))
                              IconWidget(
                                assetName: warningIcon,
                                color: AppColors.warning,
                                size: iconSizeXl,
                              ),
                            const SizedBox(width: spacingM),
                            Expanded(
                              child: Text(
                                healthState.formattedDoctorIssues[entry.key],
                                style: context.bodyM.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthDashboardSection extends StatelessWidget {
  final String title;
  final String value;
  final String actionLabel;
  final VoidCallback? onAction;
  final String iconAssetName;

  const HealthDashboardSection({
    super.key,
    required this.title,
    required this.value,
    required this.actionLabel,
    this.onAction,
    required this.iconAssetName,
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
      child: Row(
        children: [
          IconWidget(
            assetName: iconAssetName,
            color: AppColors.secondary,
            size: iconSizeXl,
          ),
          const SizedBox(width: spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.bodyM.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: context.bodyL.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (onAction != null)
            SizedBox(
              width: defaultButtonWidth,
              child: ButtonWidget.primary(
                label: actionLabel,
                onPressed: onAction!,
              ),
            ),
        ],
      ),
    );
  }
}
