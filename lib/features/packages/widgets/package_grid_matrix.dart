import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/extensions/string_extensions.dart';
import 'package:bartender/core/utils/url_launcer_utils.dart';
import 'package:bartender/features/packages/models/package_states.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class PackageGridMatrix extends StatelessWidget {
  final PackageGridMatrixState model;

  const PackageGridMatrix({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return model.map(
      cask: (cask) => _BasePackageGridMatrix(
        homepage: cask.homepage,
        archs: cask.archs,
        version: cask.version,
        typeAndTap: cask.typeAndTap,
        fullTag: cask.fullTag,
        formattedInstalls: cask.formattedInstalls,
        extraItems: [
          PackageDetailGridItem(
            icon: updateIcon,
            title: 'Auto-Updates',
            subtitle: cask.autoUpdates ? 'Managed by App' : 'Managed by Brew',
          ),
          PackageDetailGridItem(
            icon: unpackIcon,
            title: 'Artifact Type',
            subtitle: cask.artifactType,
          ),
        ],
      ),
      formula: (formula) => _BasePackageGridMatrix(
        homepage: formula.homepage,
        archs: formula.archs,
        version: formula.version,
        typeAndTap: formula.typeAndTap,
        fullTag: formula.fullTag,
        formattedInstalls: formula.formattedInstalls,
        extraItems: [
          PackageDetailGridItem(
            icon: badgeIcon,
            title: 'License',
            subtitle: formula.license,
          ),
          PackageDetailGridItem(
            icon: bottleIcon,
            title: formula.isBottle ? 'Precompiled (Bottle)' : 'Build from Source',
          ),
        ],
      ),
    );
  }
}

class _BasePackageGridMatrix extends StatelessWidget {
  final String? homepage;
  final String archs;
  final String version;
  final String typeAndTap;
  final String fullTag;
  final String formattedInstalls;
  final List<Widget> extraItems;

  const _BasePackageGridMatrix({
    required this.homepage,
    required this.archs,
    required this.version,
    required this.typeAndTap,
    required this.fullTag,
    required this.formattedInstalls,
    required this.extraItems,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - (spacingM * 3)) / 4;

        // Floor to avoid sub-pixel overflow (wrapping to next line prematurely)
        final safeWidth = itemWidth.floorToDouble();

        final children = [
          PackageDetailGridItem(
            icon: homeIcon,
            title: homepageCopy,
            subtitle: homepage != null
                ? (Uri.tryParse(homepage!)?.host.isNotEmpty == true
                      ? Uri.tryParse(homepage!)!.host
                      : homepage!)
                : unknownCopy,
            onTap: homepage != null
                ? () => UrlLauncherUtils.launch(homepage!)
                : null,
          ),
          PackageDetailGridItem(
            icon: cpuIcon,
            title: architectureCopy,
            subtitle: archs.isEmpty ? unknownCopy : archs,
          ),
          PackageDetailGridItem(
            icon: hashIcon,
            title: versionCopy,
            subtitle: version,
          ),
          PackageDetailGridItem(
            icon: packagesIcon,
            title: typeAndTapCopy,
            subtitle: typeAndTap,
          ),
          PackageDetailGridItem(
            icon: tagIcon,
            title: fullTagCopy,
            subtitle: fullTag,
          ),
          PackageDetailGridItem(
            icon: trendingIcon,
            title: popularityCopy,
            subtitle: formattedInstalls,
          ),
          ...extraItems,
        ];

        return Wrap(
          spacing: spacingM,
          runSpacing: spacingM,
          children: children
              .map((child) => SizedBox(width: safeWidth, child: child))
              .toList(),
        );
      },
    );
  }
}

class PackageDetailGridItem extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final String title;
  final String? subtitle;

  const PackageDetailGridItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingM),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: AppColors.borderNeutral),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: spacingM,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconWidget(
                assetName: icon,
                color: AppColors.iconDefault,
                size: spacingL,
              ),
              const SizedBox(width: spacingS),
              Expanded(
                child: Text(
                  title,
                  style: context.labelM.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (subtitle case final text? when !text.isNullOrEmpty)
            if (onTap != null)
              _ClickableHomepageWidget(onTap: onTap, subtitle: text)
            else
              Text(
                text,
                style: context.bodyM.copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
        ],
      ),
    );
  }
}

class _ClickableHomepageWidget extends StatelessWidget {
  const _ClickableHomepageWidget({required this.onTap, required this.subtitle});

  final void Function()? onTap;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          subtitle,
          style: context.bodyM.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.secondary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
