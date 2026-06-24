import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/package_health_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/library/widgets/installed_packages_list.dart';

class InspectorPane extends StatelessWidget {
  const InspectorPane({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    //TODO: i suppose this makes SOME sense but we need to break this shit up
    return state.inspectorState.map(
      empty: (_) => Container(
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
        ),
      tap: (tapModel) {
        final tap = tapModel.tap;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(radiusM),
            border: Border.all(color: AppColors.borderNeutral),
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(spacingM),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
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
                    // We need to pass original dynamic models to InstalledPackagesList or update it to use PackageItemState.
                    // Actually, InstalledPackagesList expects dynamic. For now we can pass the packages if needed or we change it.
                    // Wait, packagesByTap is a List<dynamic>. 
                    InstalledPackagesList(
                      packages: state.packagesByTap[tap.name] ?? [],
                    ),
                  ]),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(spacingM),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ButtonWidget.secondary(
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
      package: (pkg) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(radiusM),
          border: Border.all(color: AppColors.borderNeutral),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(spacingM),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  HeaderWidget(
                    name: pkg.name,
                    version: pkg.version,
                    description: pkg.description,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: spacingM),
                    child: PackageHealthWidget(
                      isDeprecated: pkg.isDeprecated,
                      isOutdated: pkg.isOutdated,
                      hasMissingDependencies: pkg.isMissingDeps,
                      isDisabled: pkg.isDisabled,
                    ),
                  ),
                  const HorizontalDivider(),
                  const SizedBox(height: spacingM),
                  ConfigPathsWidget(
                    installPath: pkg.installPath,
                  ),
                  if (pkg.isInstalled) ...[
                    const SizedBox(height: spacingM),
                    _PackageDetailsStatsWidget(
                      tapName: pkg.tapName,
                      formattedInstalledSize: pkg.formattedInstalledSize,
                      formattedInstallDate: pkg.formattedInstallDate,
                      installPath: pkg.installPath,
                    ),
                  ],
                  const SizedBox(height: spacingL),
                  if (pkg.dependencies.isNotEmpty) ...[
                    DependencyGraphWidget(
                      dependencies: pkg.dependencies,
                    ),
                    const SizedBox(height: spacingL),
                  ],
                ]),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ManagementActionsWidget(
                    packageName: pkg.name,
                    isCask: pkg.isCask,
                    isOutdated: pkg.isOutdated,
                    isMissingDependencies: pkg.isMissingDeps,
                    installPath: pkg.installPath,
                  ),
                ),
              ),
            ),
          ],
        ),
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
        Row(
          children: [
            Text(
              name,
              style: context.headM.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
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
          child: Row(
            spacing: spacingM,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  installPath,
                  style: context.monoM.copyWith(color: AppColors.textSecondary),
                ),
              ),
              ButtonWidget.icon(
                assetName: openFolderIcon,
                onPressed: () => ShellUtils.openDirectory(installPath),
                iconSize: iconSizeM,
              ),
            ],
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
            assetName: systemUpdateIcon,
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
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Zap Package?'),
                    content: Text(
                      'Are you sure you want to completely remove $packageName and all its related files? This action cannot be undone.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          context.read<QueueViewModel>().queueOperation(
                            packageId: packageName,
                            type: PackageType.cask,
                            operation: OperationType.zap,
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.error,
                        ),
                        child: const Text('Zap'),
                      ),
                    ],
                  ),
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

class _PackageDetailsStatsWidget extends StatelessWidget {
  final String? tapName;
  final String formattedInstalledSize;
  final String formattedInstallDate;
  final String installPath;

  const _PackageDetailsStatsWidget({
    required this.tapName,
    required this.formattedInstalledSize,
    required this.formattedInstallDate,
    required this.installPath,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tapName?.isNotEmpty == true) ...[
            _StatRow(label: tapNameLabel, value: tapName!),
            const SizedBox(height: spacingXs),
          ],
          _StatRow(
            label: installedSizeStatCopy,
            value: formattedInstalledSize,
          ),
          const SizedBox(height: spacingXs),
          _StatRow(
            label: installDateStatCopy,
            value: formattedInstallDate,
          ),
          const SizedBox(height: spacingXs),
          FutureBuilder<DateTime?>(
            future: ShellUtils.getModifiedDate(installPath),
            builder: (context, snapshot) {
              final modifiedDate = snapshot.data;
              return _StatRow(
                label: lastModifiedStatCopy,
                value: StringUtils.formatTimeAgo(modifiedDate),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.bodyM.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: context.bodyM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
