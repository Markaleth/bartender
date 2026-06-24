import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/package_health_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/features/library/widgets/inspector_pane/config_paths_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/dependency_graph_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/header_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/management_actions_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/package_details_stats_widget.dart';
import 'package:flutter/material.dart';

class PackagePaneWindget extends StatelessWidget {
  final InspectorStatePackage state;

  const PackagePaneWindget({super.key, required this.state});

  @override
  Widget build(BuildContext context) => Container(
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
                name: state.name,
                version: state.version,
                description: state.description,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacingM),
                child: PackageHealthWidget(
                  isDeprecated: state.isDeprecated,
                  isOutdated: state.isOutdated,
                  hasMissingDependencies: state.isMissingDeps,
                  isDisabled: state.isDisabled,
                ),
              ),
              const HorizontalDivider(),
              const SizedBox(height: spacingM),
              ConfigPathsWidget(installPath: state.installPath),
              if (state.isInstalled) ...[
                const SizedBox(height: spacingM),
                PackageDetailsStatsWidget(
                  tapName: state.tapName,
                  formattedInstalledSize: state.formattedInstalledSize,
                  formattedInstallDate: state.formattedInstallDate,
                  installPath: state.installPath,
                ),
              ],
              const SizedBox(height: spacingL),
              if (state.dependencies.isNotEmpty) ...[
                DependencyGraphWidget(dependencies: state.dependencies),
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
                packageName: state.name,
                isCask: state.isCask,
                isOutdated: state.isOutdated,
                isMissingDependencies: state.isMissingDeps,
                installPath: state.installPath,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
