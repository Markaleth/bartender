import 'package:bartender/common_widgets/package_health_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

import 'package:bartender/data/models/tap/tap_model.dart';

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

    if (state.isSelectedPackageTap) {
      final tap = state.selectedPackage as TapModel;
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
              name: tap.name,
              version: tap.official ? 'Official' : 'Custom',
              description: 'Tap from ${tap.user}/${tap.repo}',
            ),

            const Divider(height: spacingL * 2, color: AppColors.borderNeutral),

            ConfigPathsWidget(installPath: tap.path),

            const SizedBox(height: spacingL),

            Row(
              children: [
                Expanded(
                  child: _TapStatsWidget(
                    label: 'Formulae',
                    count: tap.formulaNames.length,
                  ),
                ),
                const SizedBox(width: spacingM),
                Expanded(
                  child: _TapStatsWidget(
                    label: 'Casks',
                    count: tap.caskTokens.length,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonWidget(
                  label: 'Untap',
                  icon: Icons.delete,
                  color: AppColors.error,
                  onTap: () {
                    context.read<QueueViewModel>().queueOperation(
                      packageId: tap.name,
                      type: PackageType.tap,
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
          Padding(
            padding: const EdgeInsets.only(top: spacingM),
            child: PackageHealthWidget(
              isDeprecated: state.selectedPackageIsDeprecated,
              isOutdated: state.selectedPackageIsOutdated,
              hasMissingDependencies: state.selectedPackageIsMissingDeps,
              isDisabled: state.selectedPackageIsMissingDeps,
            ),
          ),
          const Divider(height: spacingL * 2, color: AppColors.borderNeutral),

          ConfigPathsWidget(installPath: state.selectedPackageInstallPath),

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
            isOutdated: state.selectedPackageIsOutdated,
            isMissingDependencies: state.selectedPackageIsMissingDeps,
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
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'v$version',
          style: const TextStyle(color: AppColors.secondary, fontSize: 16),
        ),
        const SizedBox(height: spacingM),
        Text(
          description,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class ConfigPathsWidget extends StatelessWidget {
  final String installPath;

  const ConfigPathsWidget({super.key, required this.installPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Install Path',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
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
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }
}

class DependencyGraphWidget extends StatelessWidget {
  final List<String> dependencies;

  const DependencyGraphWidget({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dependencies',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: spacingS),
        Wrap(
          spacing: spacingS,
          runSpacing: spacingS,
          children: dependencies
              .map(
                (dep) => Chip(
                  label: Text(
                    dep,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: AppColors.background,
                  side: const BorderSide(color: AppColors.borderNeutral),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class ManagementActionsWidget extends StatelessWidget {
  final String packageName;
  final bool isCask;
  final bool isOutdated;
  final bool isMissingDependencies;
  const ManagementActionsWidget({
    super.key,
    required this.packageName,
    required this.isCask,
    required this.isOutdated,
    required this.isMissingDependencies,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacingM,
      runSpacing: spacingM,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        if (isOutdated)
          ActionButtonWidget(
            label: 'Update',
            icon: Icons.system_update,
            color: AppColors.secondary,
            onTap: () {
              context.read<QueueViewModel>().queueOperation(
                packageId: packageName,
                type: isCask ? PackageType.cask : PackageType.formula,
                operation: OperationType.upgrade,
              );
            },
          )
        else
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
        if (isCask)
          ActionButtonWidget(
            label: 'Zap',
            icon: Icons.bolt,
            color: AppColors.error,
            onTap: () {
              // Note: Zap might need a specific OperationType if supported, falling back to uninstall here.
              context.read<QueueViewModel>().queueOperation(
                packageId: packageName,
                type: PackageType.cask,
                operation: OperationType.uninstall,
              );
            },
          ),
        if (isMissingDependencies)
          ActionButtonWidget(
            label: 'Fix Dependencies',
            icon: Icons.build,
            color: AppColors.primary,
            onTap: () {
              context.read<QueueViewModel>().queueOperation(
                packageId: packageName,
                type: isCask ? PackageType.cask : PackageType.formula,
                operation: OperationType.install,
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
        padding: const EdgeInsets.symmetric(
          horizontal: spacingM,
          vertical: spacingS,
        ),
      ),
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

class _TapStatsWidget extends StatelessWidget {
  final String label;
  final int count;

  const _TapStatsWidget({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingS),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(radiusS),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: spacingXs),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
