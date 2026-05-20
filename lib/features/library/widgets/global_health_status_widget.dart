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
                  title: 'System Storage',
                  value: healthState.systemStorageUsed,
                  icon: Icons.storage,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: 'Orphaned Dependencies',
                  value: healthState.orphanedDependenciesCount.toString(),
                  icon: Icons.cleaning_services,
                  color: healthState.orphanedDependenciesCount > 0
                      ? AppColors.error
                      : AppColors.secondary,
                  action: healthState.orphanedDependenciesCount > 0
                      ? IconButton(
                          icon: const Icon(
                            Icons.autorenew,
                            color: AppColors.textPrimary,
                            size: 20,
                          ),
                          onPressed: onAutoremove,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: 'Global Health Score',
                  value: '${healthState.globalHealthScore}%',
                  icon: Icons.favorite,
                  color: _getHealthColor(healthState.globalHealthScore),
                  action: IconButton(
                    icon: const Icon(
                      Icons.open_in_new,
                      color: AppColors.textPrimary,
                      size: 20,
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
                  title: 'Pending Updates',
                  value: healthState.outdatedCount.toString(),
                  icon: Icons.system_update,
                  color: healthState.outdatedCount > 0
                      ? AppColors.tertiary
                      : AppColors.secondary,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: 'Reclaimable Space',
                  value: healthState.reclaimableSpace,
                  icon: Icons.auto_delete_outlined,
                  color:
                      healthState.reclaimableSpace != '0 B' &&
                          healthState.reclaimableSpace.isNotEmpty
                      ? AppColors.tertiary
                      : AppColors.secondary,
                ),
              ),
              const SizedBox(width: spacingM),
              Expanded(
                child: StatusCard(
                  title: 'Doctor Warnings',
                  value:
                      (healthState.doctorWarningsCount +
                              healthState.doctorErrorsCount)
                          .toString(),
                  icon: Icons.warning_amber_rounded,
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

  Color _getHealthColor(int score) {
    if (score >= 90) return AppColors.secondary;
    if (score >= 70) return AppColors.tertiary;
    return AppColors.error;
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
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
              Icon(icon, color: color, size: 24),
              const SizedBox(width: spacingS),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (action != null) action!,
            ],
          ),
          const SizedBox(height: spacingM),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
