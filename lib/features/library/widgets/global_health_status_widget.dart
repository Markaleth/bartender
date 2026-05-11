import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

class GlobalHealthStatusWidget extends StatelessWidget {
  const GlobalHealthStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingM),
      child: Row(
        children: [
          Expanded(
            child: _buildBentoCard(
              title: 'System Storage',
              value: state.systemStorageUsed,
              icon: Icons.storage,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(width: spacingM),
          Expanded(
            child: _buildBentoCard(
              title: 'Orphaned Dependencies',
              value: state.orphanedDependenciesCount.toString(),
              icon: Icons.cleaning_services,
              color: state.orphanedDependenciesCount > 0
                  ? AppColors.error
                  : AppColors.secondary,
              action: state.orphanedDependenciesCount > 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.autorenew,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () {
                        context.read<QueueViewModel>().queueOperation(
                          packageId: 'system',
                          type: PackageType.system,
                          operation: OperationType.autoremove,
                        );
                      },
                    )
                  : null,
            ),
          ),
          const SizedBox(width: spacingM),
          Expanded(
            child: _buildBentoCard(
              title: 'Global Health Score',
              value: '${state.globalHealthScore}%',
              icon: Icons.favorite,
              color: _getHealthColor(state.globalHealthScore),
            ),
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

  Widget _buildBentoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    Widget? action,
  }) {
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
                ),
              ),
              ?action,
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
          ),
        ],
      ),
    );
  }
}
