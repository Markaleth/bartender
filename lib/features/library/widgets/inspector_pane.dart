import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

class InspectorPane extends StatelessWidget {
  const InspectorPane({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    if (state.selectedPackage == null) {
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
          HeaderWidget(
            name: state.selectedPackageName,
            version: state.selectedPackageVersion,
            description: state.selectedPackageDescription,
          ),
          
          const Divider(height: spacingL * 2, color: AppColors.borderNeutral),
          
          ConfigPathsWidget(
            installPath: state.selectedPackageInstallPath,
          ),
          
          const SizedBox(height: spacingL),
          
          if (state.selectedPackageDependencies.isNotEmpty) ...[
            DependencyGraphWidget(
              dependencies: state.selectedPackageDependencies,
            ),
            const SizedBox(height: spacingL),
          ],
          
          const Spacer(),
          
          ManagementActionsWidget(
            packageName: state.selectedPackageName,
            isCask: state.isSelectedPackageCask,
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String name;
  final String version;
  final String description;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.version,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name, 
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)
        ),
        Text(
          'v$version', 
          style: const TextStyle(color: AppColors.secondary, fontSize: 16)
        ),
        const SizedBox(height: spacingM),
        Text(
          description, 
          style: const TextStyle(color: AppColors.textSecondary)
        ),
      ],
    );
  }
}

class ConfigPathsWidget extends StatelessWidget {
  final String installPath;

  const ConfigPathsWidget({
    super.key,
    required this.installPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Install Path', 
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)
        ),
        const SizedBox(height: spacingXs),
        Container(
          padding: const EdgeInsets.all(spacingS),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(radiusS),
            border: Border.all(color: AppColors.borderNeutral),
          ),
          child: Text(
            installPath, 
            style: const TextStyle(color: AppColors.textSecondary, fontFamily: 'monospace')
          ),
        ),
      ],
    );
  }
}

class DependencyGraphWidget extends StatelessWidget {
  final List<String> dependencies;

  const DependencyGraphWidget({
    super.key,
    required this.dependencies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dependencies', 
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)
        ),
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
      ],
    );
  }
}

class ManagementActionsWidget extends StatelessWidget {
  final String packageName;
  final bool isCask;

  const ManagementActionsWidget({
    super.key,
    required this.packageName,
    required this.isCask,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButtonWidget(
          label: 'Pin Version',
          icon: Icons.push_pin,
          color: AppColors.primary,
          onTap: () {
            context.read<QueueViewModel>().queueOperation(
              packageId: packageName,
              type: isCask ? PackageType.cask : PackageType.formula,
              operation: OperationType.pin,
            );
          },
        ),
        ActionButtonWidget(
          label: 'Force Upgrade',
          icon: Icons.upgrade,
          color: AppColors.secondary,
          onTap: () {
            context.read<QueueViewModel>().queueOperation(
              packageId: packageName,
              type: isCask ? PackageType.cask : PackageType.formula,
              operation: OperationType.update,
            );
          },
        ),
        ActionButtonWidget(
          label: 'Uninstall',
          icon: Icons.delete,
          color: AppColors.error,
          onTap: () {
            context.read<QueueViewModel>().queueOperation(
              packageId: packageName,
              type: isCask ? PackageType.cask : PackageType.formula,
              operation: OperationType.uninstall,
            );
          },
        ),
      ],
    );
  }
}

class ActionButtonWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ActionButtonWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
