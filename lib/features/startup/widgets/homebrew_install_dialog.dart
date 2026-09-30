import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class HomebrewInstallDialog extends StatelessWidget {
  final bool isInstalling;
  final VoidCallback onInstall;
  final VoidCallback onExit;
  final VoidCallback onCheckAgain;

  const HomebrewInstallDialog({
    super.key,
    required this.isInstalling,
    required this.onInstall,
    required this.onExit,
    required this.onCheckAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: homebrewInstallDialogWidth,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(radiusL),
            border: Border.all(color: AppColors.borderNeutral),
            boxShadow: [
              BoxShadow(
                color: AppColors.background.withValues(alpha: 0.5),
                blurRadius: spacingL,
                offset: const Offset(0, radiusL),
              ),
            ],
          ),
          padding: const EdgeInsets.all(spacingL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                spacing: spacingM,
                children: [
                  Container(
                    padding: const EdgeInsets.all(spacingS),
                    decoration: BoxDecoration(
                      color: isInstalling
                          ? AppColors.primary.withValues(alpha: 0.15)
                          : AppColors.warning.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(radiusM),
                    ),
                    child: IconWidget(
                      assetName: isInstalling ? downloadIcon : warningIcon,
                      color: isInstalling
                          ? AppColors.primary
                          : AppColors.warning,
                      size: iconSizeL,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      isInstalling
                          ? brewInstallingDialogTitle
                          : brewMissingDialogTitle,
                      style: context.titleM.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingL),
              Text(
                isInstalling
                    ? brewInstallingDialogContent
                    : brewMissingDialogContent,
                style: context.bodyM.copyWith(color: AppColors.textSecondary),
              ),
              if (isInstalling) ...[
                const SizedBox(height: spacingL),
                const Center(child: CircularProgressIndicator()),
              ],
              const SizedBox(height: spacingXl),
              Row(
                spacing: spacingM,
                children: [
                  Expanded(
                    child: ButtonWidget.secondary(
                      label: exitAppButtonLabel,
                      onPressed: onExit,
                    ),
                  ),
                  if (isInstalling)
                    Expanded(
                      child: ButtonWidget.primary(
                        label: checkAgainButtonLabel,
                        assetName: updateIcon,
                        onPressed: onCheckAgain,
                      ),
                    )
                  else
                    Expanded(
                      child: ButtonWidget.primary(
                        label: brewInstallButtonLabel,
                        assetName: downloadIcon,
                        onPressed: onInstall,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
