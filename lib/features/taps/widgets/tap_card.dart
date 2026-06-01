import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/utils/url_launcer_utils.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/common_widgets/package_icon/package_icon.dart';

class TapCard extends StatelessWidget {
  final TapModel tap;
  final bool isSyncing;
  final VoidCallback onViewPackages;
  final VoidCallback onForceSync;
  final VoidCallback onRemove;

  const TapCard({
    super.key,
    required this.tap,
    required this.isSyncing,
    required this.onViewPackages,
    required this.onForceSync,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radiusM),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TapCardHeader(tap: tap, isSyncing: isSyncing, onRemove: onRemove),
          const HorizontalDivider(),
          _TapCardBody(tap: tap),
          const HorizontalDivider(height: 0),
          _TapCardFooter(
            isSyncing: isSyncing,
            onForceSync: onForceSync,
            onViewPackages: onViewPackages,
          ),
        ],
      ),
    );
  }
}

class _TapCardHeader extends StatelessWidget {
  final TapModel tap;
  final bool isSyncing;
  final VoidCallback onRemove;

  const _TapCardHeader({
    required this.tap,
    required this.isSyncing,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingM),
      child: Row(
        children: [
          PackageIcon(name: tap.name, homepage: tap.remote, size: spacing2Xl),
          const SizedBox(width: spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tap.name,
                  style: context.titleM.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: spacingXs),
                _Badge(
                  text: tap.official
                      ? headerWidgetOfficialCopy
                      : headerWidgetCommunityCopy,
                  color: tap.official ? AppColors.primary : AppColors.secondary,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.iconDefault),
            onPressed: isSyncing
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text(removeTapDialogTitle),
                        content: Text('$removeTapDialogContent ${tap.name}?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text(cancelButtonLabel),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              onRemove();
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
        ],
      ),
    );
  }
}

class _TapCardBody extends StatelessWidget {
  final TapModel tap;

  const _TapCardBody({required this.tap});

  @override
  Widget build(BuildContext context) {
    final int totalPackages = tap.formulaNames.length + tap.caskTokens.length;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: Column(
          spacing: spacingS,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$totalPackages',
                        style: context.titleM.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        tapCardPackagesTitle,
                        style: context.labelS.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tapCardUnknownTitle,
                        style: context.titleM.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        tapCardLastSyncTitle,
                        style: context.labelS.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (tap.remote != null)
              Row(
                spacing: spacingM,
                children: [
                  IconWidget(assetName: homeIcon, size: iconSizeM),
                  Expanded(
                    child: ButtonWidget.tertiary(
                      label: tap.remote!,
                      onPressed: () {
                        UrlLauncherUtils.launch(tap.remote!);
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _TapCardFooter extends StatelessWidget {
  final bool isSyncing;
  final VoidCallback onForceSync;
  final VoidCallback onViewPackages;

  const _TapCardFooter({
    required this.isSyncing,
    required this.onForceSync,
    required this.onViewPackages,
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
          Expanded(
            child: ButtonWidget.secondary(
              onPressed: isSyncing ? null : onForceSync,
              iconData: Icons.sync,
              label: forceSyncButtonLabel,
            ),
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

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingS,
        vertical: spacing2Xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radiusL),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        text,
        style: context.labelS.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
