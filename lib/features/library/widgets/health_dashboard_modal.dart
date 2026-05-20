import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

class HealthDashboardModal extends StatelessWidget {
  const HealthDashboardModal({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final healthState = viewModel.state.healthState;

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
                  _buildSection(
                    context,
                    title: 'Outdated Packages',
                    value: '${healthState.outdatedCount} updates available',
                    actionLabel: 'Update All',
                    onAction: healthState.outdatedCount > 0
                        ? () {
                            context.read<QueueViewModel>().queueOperation(
                              packageId: 'all',
                              type: PackageType.system,
                              operation: OperationType.upgrade,
                            );
                          }
                        : null,
                    icon: Icons.system_update,
                  ),
                  const SizedBox(height: spacingM),
                  _buildSection(
                    context,
                    title: 'Reclaimable Space',
                    value: healthState.reclaimableSpace,
                    actionLabel: 'Run Cleanup',
                    onAction: healthState.reclaimableSpace != '0 B' && healthState.reclaimableSpace.isNotEmpty
                        ? () {
                            context.read<QueueViewModel>().queueOperation(
                              packageId: 'system',
                              type: PackageType.system,
                              operation: OperationType.cleanup,
                            );
                          }
                        : null,
                    icon: Icons.cleaning_services,
                  ),
                  const SizedBox(height: spacingM),
                  _buildSection(
                    context,
                    title: 'Orphaned Dependencies',
                    value: '${healthState.orphanedDependenciesCount} orphans',
                    actionLabel: 'Remove Orphans',
                    onAction: healthState.orphanedDependenciesCount > 0
                        ? () {
                            context.read<QueueViewModel>().queueOperation(
                              packageId: 'system',
                              type: PackageType.system,
                              operation: OperationType.autoremove,
                            );
                          }
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

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String value,
    required String actionLabel,
    VoidCallback? onAction,
    required IconData icon,
  }) {
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
