import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class TapCardFooter extends StatelessWidget {
  final String tapName;
  final bool isSyncing;
  final VoidCallback onViewPackages;
  final VoidCallback onUntap;

  const TapCardFooter({
    super.key,
    required this.isSyncing,
    required this.onViewPackages,
    required this.onUntap,
    required this.tapName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onSurface.withValues(alpha: 0.02),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(radiusM),
          bottomRight: Radius.circular(radiusM),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: spacingS,
        vertical: spacingS,
      ),
      child: Row(
        spacing: spacingM,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget.tertiary(
            iconData: Icons.delete,
            label: untapButtonLabel,
            color: AppColors.error,
            onPressed: isSyncing
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text(removeTapDialogTitle),
                        content: Text('$removeTapDialogContent $tapName?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text(cancelButtonLabel),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              onUntap();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.error,
                            ),
                            child: const Text(removeButtonLabel),
                          ),
                        ],
                      ),
                    );
                  },
          ),
          ButtonWidget.tertiary(
            iconData: Icons.arrow_forward,
            label: browseButtonLabel,
            onPressed: onViewPackages,
          ),
        ],
      ),
    );
  }
}
