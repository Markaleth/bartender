import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class CorruptedTapDialog extends StatelessWidget {
  final List<String> brokenPackages;

  const CorruptedTapDialog({super.key, required this.brokenPackages});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Row(
      spacing: spacingM,
      children: [
        IconWidget(assetName: warningIcon, color: AppColors.warning),
        const Text(tapCorruptedPackagesDialogTitle),
      ],
    ),
    content: SizedBox(
      width: 400,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            tapCorruptedPackagesDialogContent,
            style: context.labelL.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: spacingM),
          ...brokenPackages.map((pkg) => Text('● $pkg')),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text(closeButtonLabel),
      ),
    ],
  );
}
