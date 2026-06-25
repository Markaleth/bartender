import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class InspectorPaneConfigPathsWidget extends StatelessWidget {
  final String installPath;

  const InspectorPaneConfigPathsWidget({super.key, required this.installPath});

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
