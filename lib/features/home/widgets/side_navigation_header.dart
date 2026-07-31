import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/features/home/view_models/home_view_model.dart';

class SideNavigationHeader extends StatelessWidget {
  const SideNavigationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.only(bottom: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: spacingM),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacingS),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: IconWidget(assetName: bottleIcon, color: AppColors.onPrimary),
                ),
                const SizedBox(width: spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appName,
                        style: context.titleM,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (state.localVersion != null)
                        Text(
                          '$brewVersionPrefix${state.localVersion}',
                          style: context.labelL.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
                if (state.isCheckingForUpdates)
                  const SizedBox(
                    width: iconSizeM,
                    height: iconSizeM,
                    child: CircularProgressIndicator(strokeWidth: thicknessS),
                  )
                else
                  ButtonWidget.icon(
                    assetName: updateIcon,
                    onPressed: viewModel.checkForUpdates,
                    iconSize: iconSizeM,
                  ),
              ],
            ),
          ),
          if (state.isSyncingDatabase)
            const _BackgroundSyncWidget()
          else if (state.updateAvailable)
            _UpdateBannerWidget(onUpdatePressed: viewModel.checkForUpdates),
        ],
      ),
    );
  }
}

class _UpdateBannerWidget extends StatelessWidget {
  final void Function() onUpdatePressed;

  const _UpdateBannerWidget({required this.onUpdatePressed});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: spacingM),
    child: DecoratedBox(
      decoration: BoxDecoration(color: AppColors.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: spacingS,
          vertical: spacingS,
        ),
        child: Row(
          spacing: spacingS,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                homebrewUpdateAvailableCopy,
                style: context.labelL.copyWith(
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ButtonWidget.icon(
              assetName: systemUpdateIcon,
              onPressed: onUpdatePressed,
              iconSize: iconSizeM,
              color: AppColors.onPrimary,
            ),
          ],
        ),
      ),
    ),
  );
}

class _BackgroundSyncWidget extends StatelessWidget {
  const _BackgroundSyncWidget();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: spacingM),
    child: DecoratedBox(
      decoration: BoxDecoration(color: AppColors.surface),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: spacingS,
          vertical: spacingS,
        ),
        child: Row(
          spacing: spacingS,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: iconSizeS,
              height: iconSizeS,
              child: CircularProgressIndicator(
                strokeWidth: thicknessS,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: Text(
                syncInProgressCopy,
                style: context.labelL.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
