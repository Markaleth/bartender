import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/package_health_widget.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/theme/bartender_context.dart';
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
        child: Center(
          child: Text(
            inspectorPaneUnselectedTitle,
            style: context.bodyM.copyWith(color: AppColors.textSecondary),
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
              version: tap.official
                  ? headerWidgetOfficialCopy
                  : headerWidgetCommunityCopy,
              description: 'Tap from ${tap.user}/${tap.repo}',
            ),

            const HorizontalDivider(),
            const SizedBox(height: spacingM),
            
            ConfigPathsWidget(installPath: tap.path),

            const SizedBox(height: spacingL),

            Row(
              children: [
                Expanded(
                  child: _TapStatsWidget(
                    label: formulaeTitle,
                    count: tap.formulaNames.length,
                  ),
                ),
                const SizedBox(width: spacingM),
                Expanded(
                  child: _TapStatsWidget(
                    label: casksTitle,
                    count: tap.caskTokens.length,
                  ),
                ),
              ],
            ),

            const Spacer(),

            ButtonWidget.secondary(
              label: untapButtonLabel,
              iconData: Icons.delete,
              color: AppColors.error,
              onPressed: () {
                context.read<QueueViewModel>().queueOperation(
                  packageId: tap.name,
                  type: PackageType.tap,
                  operation: OperationType.uninstall,
                );
              },
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
              isDisabled: state.selectedPackageIsDisabled,
            ),
          ),
          const HorizontalDivider(),
          const SizedBox(height: spacingM),
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
            installPath: state.selectedPackageInstallPath,
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
          style: context.headM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'v$version',
          style: context.bodyL.copyWith(color: AppColors.secondary),
        ),
        const SizedBox(height: spacingM),
        Text(
          description,
          style: context.bodyM.copyWith(color: AppColors.textSecondary),
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
        Text(
          installPathLabel,
          style: context.bodyM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
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
        Text(
          dependenciesTitle,
          style: context.bodyM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
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
                    style: context.labelL.copyWith(
                      color: AppColors.textPrimary,
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
  final String installPath;

  const ManagementActionsWidget({
    super.key,
    required this.packageName,
    required this.isCask,
    required this.isOutdated,
    required this.isMissingDependencies,
    required this.installPath,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacingM,
      runSpacing: spacingM,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        if (isCask)
          SizedBox(
            width: defaultButtonWidth,
            child: ButtonWidget.secondary(
              label: launchButtonLabel,
              iconData: Icons.launch,
              color: AppColors.primary,
              onPressed: () {
                ShellUtils.openDirectory(installPath);
              },
            ),
          ),
        SizedBox(
          width: defaultButtonWidth,
          child: ButtonWidget.secondary(
            label: openDirectoryButtonLabel,
            iconData: Icons.folder_open,
            color: AppColors.secondary,
            onPressed: () {
              ShellUtils.openDirectory(installPath);
            },
          ),
        ),
        if (isOutdated)
          SizedBox(
            width: defaultButtonWidth,
            child: ButtonWidget.secondary(
              label: updateButtonLabel,
              iconData: Icons.system_update,
              color: AppColors.secondary,
              onPressed: () {
                context.read<QueueViewModel>().queueOperation(
                  packageId: packageName,
                  type: isCask ? PackageType.cask : PackageType.formula,
                  operation: OperationType.upgrade,
                );
              },
            ),
          )
        else
          SizedBox(
            width: defaultButtonWidth,
            child: ButtonWidget.secondary(
              label: pinVersionButtonLabel,
              iconData: Icons.push_pin,
              color: AppColors.primary,
              onPressed: () {
                context.read<QueueViewModel>().queueOperation(
                  packageId: packageName,
                  type: isCask ? PackageType.cask : PackageType.formula,
                  operation: OperationType.pin,
                );
              },
            ),
          ),
        SizedBox(
          width: defaultButtonWidth,
          child: ButtonWidget.secondary(
            label: reinstallButtonLabel,
            iconData: Icons.refresh,
            color: AppColors.secondary,
            onPressed: () {
              context.read<QueueViewModel>().queueOperation(
                packageId: packageName,
                type: isCask ? PackageType.cask : PackageType.formula,
                operation: OperationType.reinstall,
              );
            },
          ),
        ),
        SizedBox(
          width: defaultButtonWidth,
          child: ButtonWidget.secondary(
            label: uninstallButtonLabel,
            iconData: Icons.delete,
            color: AppColors.error,
            onPressed: () {
              context.read<QueueViewModel>().queueOperation(
                packageId: packageName,
                type: isCask ? PackageType.cask : PackageType.formula,
                operation: OperationType.uninstall,
              );
            },
          ),
        ),
        if (isCask)
          SizedBox(
            width: defaultButtonWidth,
            child: ButtonWidget.secondary(
              label: zapButtonLabel,
              iconData: Icons.bolt,
              color: AppColors.error,
              onPressed: () {
                context.read<QueueViewModel>().queueOperation(
                  packageId: packageName,
                  type: PackageType.cask,
                  operation: OperationType.zap,
                );
              },
            ),
          ),
        if (isMissingDependencies)
          SizedBox(
            width: defaultButtonWidth,
            child: ButtonWidget.secondary(
              label: fixDependencyIssuesButtonLabel,
              iconData: Icons.build,
              color: AppColors.primary,
              onPressed: () {
                context.read<QueueViewModel>().queueOperation(
                  packageId: packageName,
                  type: isCask ? PackageType.cask : PackageType.formula,
                  operation: OperationType.install,
                );
              },
            ),
          ),
      ],
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
            style: context.titleM.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: spacingXs),
          Text(
            label,
            style: context.labelL.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
