import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InspectorPaneManagementActionsWidget extends StatelessWidget {
  final String packageName;
  final bool isCask;
  final bool isOutdated;
  final bool isMissingDependencies;
  final String installPath;

  const InspectorPaneManagementActionsWidget({
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
              assetName: systemUpdateIcon,
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
          Tooltip(
            message: pinVersionTooltip,
            child: SizedBox(
              width: defaultButtonWidth,
              child: ButtonWidget.secondary(
                label: pinVersionButtonLabel,
                assetName: pinIcon,
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
          ),
        SizedBox(
          width: defaultButtonWidth,
          child: ButtonWidget.secondary(
            label: reinstallButtonLabel,
            assetName: updateIcon,
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
        Tooltip(
          message: uninstallTooltip,
          child: SizedBox(
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
        ),
        if (isCask)
          Tooltip(
            message: zapTooltip,
            child: SizedBox(
              width: defaultButtonWidth,
              child: ButtonWidget.secondary(
                label: zapButtonLabel,
                iconData: Icons.bolt,
                color: AppColors.error,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text(zapPackageDialogTitle),
                      content: Text(
                        '$zapPackageDialogContentPrefix$packageName$zapPackageDialogContentSuffix',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text(cancelButtonLabel),
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
                          child: const Text(zapButtonLabel),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
