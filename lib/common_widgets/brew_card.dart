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
      child: Card(
        margin: const EdgeInsets.only(bottom: spacingM),
        child: Padding(
          padding: const EdgeInsets.all(spacingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PackageIcon(
                    name: title,
                    homepage: homepage,
                    isCask: isCask,
                    size: defaultBrewCardIconSize,
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
                  const SizedBox(width: spacingM),
                  IconButton(
                    onPressed: onInstall,
                    padding: EdgeInsets.all(spacingS),
                    constraints: const BoxConstraints(),
                    icon: const IconWidget(
                      color: AppColors.primary,
                      assetName: downloadIcon,
                      height: spacingL,
                      width: spacingL,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingM),
              Text(
                description ?? '',
                style: context.labelL,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                spacing: spacingM,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (downloads != null)
                    _DownloadsWidget(downloads: downloads!),

                  Flexible(
                    child: Text(
                      'Version: $version',
                      style: context.labelM,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
      IconWidget(assetName: starIcon, height: spacingM, width: spacingM),
      Text(downloads, style: context.labelM),
    ],
  );
}
