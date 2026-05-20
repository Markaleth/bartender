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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusL)),
      child: Container(
        width: 600,
        height: 600,
        padding: const EdgeInsets.all(spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'System Health Dashboard',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
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
                    title: 'Outdated Packages',
                    value: '${healthState.outdatedCount} updates available',
                    actionLabel: 'Update All',
                    onAction: healthState.outdatedCount > 0 ? onUpdateAll : null,
                    icon: Icons.system_update,
                  ),
                  const SizedBox(height: spacingM),
                  HealthDashboardSection(
                    title: 'Reclaimable Space',
                    value: healthState.reclaimableSpace,
                    actionLabel: 'Run Cleanup',
                    onAction: healthState.reclaimableSpace != '0 B' && healthState.reclaimableSpace.isNotEmpty
                        ? onCleanup
                        : null,
                    icon: Icons.cleaning_services,
                  ),
                  const SizedBox(height: spacingM),
                  HealthDashboardSection(
                    title: 'Orphaned Dependencies',
                    value: '${healthState.orphanedDependenciesCount} orphans',
                    actionLabel: 'Remove Orphans',
                    onAction: healthState.orphanedDependenciesCount > 0
                        ? onRemoveOrphans
                        : null,
                    icon: Icons.delete_outline,
                  ),
                  const SizedBox(height: spacingM),
                  const Text(
                    'Brew Doctor',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: spacingS),
                  if (healthState.doctorIssues.isEmpty)
                    const Text('No issues found.', style: TextStyle(color: AppColors.textSecondary))
                  else
                    ...healthState.doctorIssues.map(
                      (issue) => Container(
                        margin: const EdgeInsets.only(bottom: spacingS),
                        padding: const EdgeInsets.all(spacingM),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(radiusM),
                          border: Border.all(color: AppColors.borderNeutral),
                        ),
                        child: Text(
                          issue,
                          style: const TextStyle(color: AppColors.textPrimary),
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
  final IconData icon;

  const HealthDashboardSection({
    super.key,
    required this.title,
    required this.value,
    required this.actionLabel,
    this.onAction,
    required this.icon,
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
          Icon(icon, color: AppColors.secondary, size: 32),
          const SizedBox(width: spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (onAction != null)
            ElevatedButton(
              onPressed: onAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textPrimary,
              ),
              child: Text(actionLabel),
            ),
        ],
      ),
    );
  }
}
