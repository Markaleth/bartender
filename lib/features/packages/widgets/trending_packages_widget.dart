import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/common_widgets/package_icon/package_icon.dart';

class TrendingPackagesWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String version;
  final String? homepage;
  final String? downloads;

  final bool isQueued;
  final bool isInProgress;
  final bool isInstalled;

  final VoidCallback? onInstall;

  const TrendingPackagesWidget({
    super.key,
    required this.title,
    this.onInstall,
    required this.description,
    required this.version,
    this.homepage,
    this.downloads,
    this.isQueued = false,
    this.isInProgress = false,
    this.isInstalled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: spacingXs),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(radiusM),
          border: Border.all(
            color: AppColors.borderNeutral,
            width: thicknessXs,
          ),
        ),
        margin: const EdgeInsets.only(bottom: spacingS),
        child: Padding(
          padding: const EdgeInsets.all(spacingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PackageIcon(
                    name: title,
                    homepage: homepage,
                    size: spacing2Xl,
                  ),
                  const SizedBox(width: spacingS),
                  Expanded(
                    child: Text(
                      title,
                      style: context.titleM,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingM),
              Text(
                description ?? '',

                style: context.labelL,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (downloads != null)
                    _DownloadsWidget(downloads: downloads!),
                  _DownloadButtonWidget(
                    isQueued: isQueued,
                    isInProgress: isInProgress,
                    isInstalled: isInstalled,
                    onInstall: onInstall,
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

class _DownloadsWidget extends StatelessWidget {
  final String downloads;
  const _DownloadsWidget({required this.downloads});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: spacingS,
    children: [
      IconWidget(assetName: downloadIcon, size: spacingM),
      Text(downloads, style: context.labelM),
    ],
  );
}

class _DownloadButtonWidget extends StatelessWidget {
  final bool isInProgress;
  final bool isQueued;
  final bool isInstalled;
  final VoidCallback? onInstall;

  const _DownloadButtonWidget({
    required this.isInProgress,
    required this.isQueued,
    required this.isInstalled,
    required this.onInstall,
  });

  String _getButtonLabel() {
    if (isQueued) return 'Queued...';
    final baseAction = isInstalled ? 'Uninstall' : 'Install';
    return isInProgress ? '${baseAction}ing...' : baseAction;
  }

  @override
  Widget build(BuildContext context) => TextButton.icon(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.only(
        left: spacingS,
        top: 0,
        bottom: 0,
        right: 0,
      ),
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
    ),
    iconAlignment: IconAlignment.end,
    onPressed: onInstall,
    icon: isInProgress
        ? const SizedBox(
            width: spacingS,
            height: spacingS,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          )
        : const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.primary,
            size: spacingM,
          ),
    label: Text(
      _getButtonLabel(),
      style: context.labelM.copyWith(
        color: (isQueued || isInProgress)
            ? AppColors.textSecondary
            : AppColors.primary,
      ),
    ),
  );
}
