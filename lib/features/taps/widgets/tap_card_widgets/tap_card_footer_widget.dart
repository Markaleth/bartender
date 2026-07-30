import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class TapCardFooter extends StatelessWidget {
  final String tapName;
  final bool isTrusted;
  final bool isItemSyncing;
  final bool isAnySyncing;
  final VoidCallback onViewPackages;
  final VoidCallback onUntap;
  final VoidCallback onTrust;
  const TapCardFooter({
    super.key,
    required this.isItemSyncing,
    required this.isAnySyncing,
    required this.onViewPackages,
    required this.onUntap,
    required this.onTrust,
    required this.tapName,
    required this.isTrusted,
  });

  @override
  Widget build(BuildContext context) {
    ButtonState getDisabledState() {
      if (isAnySyncing && !isItemSyncing) return ButtonState.disabled;
      return ButtonState.enabled;
    }

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
            state: getDisabledState(),
            color: AppColors.error,
            onPressed: isAnySyncing
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

          isTrusted
              ? ButtonWidget.tertiary(
                  iconData: Icons.arrow_forward,
                  label: browseButtonLabel,
                  state: getDisabledState(),
                  onPressed: isAnySyncing ? null : onViewPackages,
                )
              : ButtonWidget.tertiary(
                  assetName: trustIcon,
                  label: trustCtaLabel,
                  state: isItemSyncing
                      ? ButtonState.loading
                      : getDisabledState(),
                  onPressed: isAnySyncing
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              buttonPadding: const EdgeInsets.all(spacingM),
                              icon: const IconWidget(
                                assetName: trustAlertIcon,
                                color: AppColors.warning,
                                size: iconSize2Xl,
                              ),
                              title: Text(
                                'Trust $tapName?',
                                style: context.headM,
                              ),
                              content: Text(trustAlertDialogBodyCopy),
                              actions: [
                                SizedBox(
                                  width: defaultButtonWidth,
                                  child: ButtonWidget.secondary(
                                    assetName: untrustedIcon,
                                    iconSize: iconSizeM,
                                    label: cancelButtonLabel,
                                    onPressed: () => Navigator.of(ctx).pop(),
                                  ),
                                ),
                                SizedBox(
                                  width: defaultButtonWidth,
                                  child: ButtonWidget.primary(
                                    color: AppColors.warning,
                                    assetName: trustedIcon,
                                    iconSize: iconSizeM,
                                    label: trustCtaLabel,
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                      onTrust();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                ),
        ],
      ),
    );
  }
}
