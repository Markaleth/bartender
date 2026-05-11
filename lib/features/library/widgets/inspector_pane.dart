import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

class InspectorPane extends StatelessWidget {
  const InspectorPane({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;
    final package = state.selectedPackage;

    if (package == null) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(radiusM),
          border: Border.all(color: AppColors.borderNeutral),
        ),
        child: const Center(
          child: Text(
            'Select a package to view details',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    final isCask = package is CaskModel;
    final name = isCask ? package.token : (package as FormulaModel).name;
    final version = isCask ? package.version : (package as FormulaModel).versions.stable;
    final description = isCask ? (package.desc ?? 'No description available') : (package as FormulaModel).desc;
    final installPath = isCask
        ? '${state.brewPrefix}/Caskroom/$name'
        : '${state.brewPrefix}/Cellar/$name';
    
    List<String> dependencies = [];
    if (!isCask) {
      dependencies = (package as FormulaModel).dependencies;
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radiusM),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      padding: const EdgeInsets.all(spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)),
          Text('v$version', style: const TextStyle(color: AppColors.secondary, fontSize: 16)),
          const SizedBox(height: spacingM),
          Text(description, style: const TextStyle(color: AppColors.textSecondary)),
          
          const Divider(height: spacingL * 2, color: AppColors.borderNeutral),
          
          // Config Paths
          const Text('Install Path', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
          const SizedBox(height: spacingXs),
          Container(
            padding: const EdgeInsets.all(spacingS),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(radiusS),
              border: Border.all(color: AppColors.borderNeutral),
            ),
            child: Text(installPath, style: const TextStyle(color: AppColors.textSecondary, fontFamily: 'monospace')),
          ),
          
          const SizedBox(height: spacingL),
          
          // Dependency Graph
          if (!isCask && dependencies.isNotEmpty) ...[
            const Text('Dependencies', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
            const SizedBox(height: spacingS),
            Wrap(
              spacing: spacingS,
              runSpacing: spacingS,
              children: dependencies.map((dep) => Chip(
                label: Text(dep, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                backgroundColor: AppColors.background,
                side: const BorderSide(color: AppColors.borderNeutral),
              )).toList(),
            ),
            const SizedBox(height: spacingL),
          ],
          
          const Spacer(),
          
          // Management Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                context: context,
                label: 'Pin Version',
                icon: Icons.push_pin,
                color: AppColors.primary,
                onTap: () {
                  context.read<QueueViewModel>().queueOperation(
                    packageId: name,
                    type: isCask ? PackageType.cask : PackageType.formula,
                    operation: OperationType.pin,
                  );
                },
              ),
              _buildActionButton(
                context: context,
                label: 'Force Upgrade',
                icon: Icons.upgrade,
                color: AppColors.secondary,
                onTap: () {
                  context.read<QueueViewModel>().queueOperation(
                    packageId: name,
                    type: isCask ? PackageType.cask : PackageType.formula,
                    operation: OperationType.update,
                  );
                },
              ),
              _buildActionButton(
                context: context,
                label: 'Uninstall',
                icon: Icons.delete,
                color: AppColors.error,
                onTap: () {
                  context.read<QueueViewModel>().queueOperation(
                    packageId: name,
                    type: isCask ? PackageType.cask : PackageType.formula,
                    operation: OperationType.uninstall,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withValues(alpha: 0.1),
        foregroundColor: color,
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
      ),
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
