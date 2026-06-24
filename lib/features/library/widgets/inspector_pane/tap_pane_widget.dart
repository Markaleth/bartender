import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/features/library/widgets/inspector_pane/config_paths_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/header_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/tap_stats_widget.dart';
import 'package:bartender/features/library/widgets/installed_packages_list.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapPaneWidget extends StatelessWidget {
  final InspectorStateTap state;
  final Map<String, List<dynamic>> packagesByTap;
  const TapPaneWidget({
    super.key,
    required this.state,
    required this.packagesByTap,
  });

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
                name: state.tap.name,
                version: state.tap.official
                    ? headerWidgetOfficialCopy
                    : headerWidgetCommunityCopy,
                description: 'Tap from ${state.tap.user}/${state.tap.repo}',
              ),
              const HorizontalDivider(),
              const SizedBox(height: spacingM),
              ConfigPathsWidget(installPath: state.tap.path),
              const SizedBox(height: spacingL),
              Row(
                children: [
                  Expanded(
                    child: TapStatsWidget(
                      label: formulaeTitle,
                      count: state.tap.formulaNames.length,
                    ),
                  ),
                  const SizedBox(width: spacingM),
                  Expanded(
                    child: TapStatsWidget(
                      label: casksTitle,
                      count: state.tap.caskTokens.length,
                    ),
                  ),
                ],
              ),
              InstalledPackagesList(
                packages: packagesByTap[state.tap.name] ?? [],
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
                    packageId: state.tap.name,
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
}
