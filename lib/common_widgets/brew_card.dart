import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/common_widgets/package_icon/package_icon.dart';

class BrewCard extends StatelessWidget {
  final String title;
  final String? description;
  final String version;
  final String? homepage;
  final String? downloads;
  final bool isCask;

  final VoidCallback? onInstall;

  const BrewCard({
    super.key,
    required this.title,
    this.onInstall,
    required this.description,
    required this.version,
    this.homepage,
    this.isCask = false,
    this.downloads,
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
                    isCask: isCask,
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
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                        left: spacingS,
                        top: 0,
                        bottom: 0,
                        right: 0,
                      ),
                      visualDensity: VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                    ),
                    iconAlignment: IconAlignment.end,
                    onPressed: onInstall,
                    icon: Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.secondary,
                    ),
                    label: Text(
                      "Install",
                      style: context.labelM.copyWith(
                        color: AppColors.secondary,
                      ),
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

class _DownloadsWidget extends StatelessWidget {
  final String downloads;
  const _DownloadsWidget({required this.downloads});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: spacingS,
    children: [
      IconWidget(assetName: downloadIcon, height: spacingM, width: spacingM),
      Text(downloads, style: context.labelM),
    ],
  );
}
