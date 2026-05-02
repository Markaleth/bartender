import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/core/utils/url_launcer_utils.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/core/extensions/package_extensions.dart';

class PackageGridMatrix extends StatelessWidget {
  final dynamic model;

  const PackageGridMatrix({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return switch (model) {
      CaskModel cask => CaskGridMatrix(cask: cask),
      FormulaModel formula => FormulaGridMatrix(formula: formula),
      _ => const SizedBox.shrink(),
    };
  }
}

class CaskGridMatrix extends StatelessWidget {
  final CaskModel cask;

  const CaskGridMatrix({super.key, required this.cask});

  @override
  Widget build(BuildContext context) {
    final archs = cask.compatibility
        .where((info) => info != CompatibilityInfo.precompiled)
        .map((info) => info.label)
        .join(', ');

    return Wrap(
      spacing: spacingM,
      runSpacing: spacingM,
      children: [
        PackageDetailGridItem(
          icon: homeIcon,
          title: 'Homepage',
          subtitle: cask.homepage != null
              ? (Uri.tryParse(cask.homepage!)?.host.isNotEmpty == true
                    ? Uri.tryParse(cask.homepage!)!.host
                    : cask.homepage!)
              : 'Unknown',
          onTap: cask.homepage != null
              ? () => UrlLauncherUtils.launch(cask.homepage!)
              : null,
        ),
        PackageDetailGridItem(
          icon: cpuIcon,
          title: 'Architecture',
          subtitle: archs.isEmpty ? 'Unknown' : archs,
        ),
        PackageDetailGridItem(
          icon: hashIcon,
          title: 'Version',
          subtitle: cask.version,
        ),
        PackageDetailGridItem(
          icon: packagesIcon,
          title: 'Type & Tap',
          subtitle: 'Cask • ${cask.tap ?? 'homebrew/cask'}',
        ),
        PackageDetailGridItem(
          icon: tagIcon,
          title: 'Full Tag',
          subtitle: cask.fullToken ?? cask.token,
        ),
        PackageDetailGridItem(
          icon: trendingIcon,
          title: 'Popularity',
          subtitle: cask.installs30d != null
              ? '${StringUtils.formatWithCommas(cask.installs30d)} installs'
              : 'N/A',
        ),
        PackageDetailGridItem(
          icon: updateIcon,
          title: 'Auto-Updates',
          subtitle: cask.autoUpdates == true
              ? 'Managed by App'
              : 'Managed by Brew',
        ),
        PackageDetailGridItem(
          icon: unpackIcon,
          title: 'Artifact Type',
          subtitle: cask.primaryArtifactType,
        ),
      ],
    );
  }
}

class FormulaGridMatrix extends StatelessWidget {
  final FormulaModel formula;

  const FormulaGridMatrix({super.key, required this.formula});

  @override
  Widget build(BuildContext context) {
    final archs = formula.compatibility
        .where((info) => info != CompatibilityInfo.precompiled)
        .map((info) => info.label)
        .join(', ');

    return Wrap(
      spacing: spacingM,
      runSpacing: spacingM,
      children: [
        PackageDetailGridItem(
          icon: homeIcon,
          title: 'Homepage',
          subtitle: formula.homepage != null
              ? (Uri.tryParse(formula.homepage!)?.host.isNotEmpty == true
                    ? Uri.tryParse(formula.homepage!)!.host
                    : formula.homepage!)
              : 'Unknown',
          onTap: formula.homepage != null
              ? () => UrlLauncherUtils.launch(formula.homepage!)
              : null,
        ),
        PackageDetailGridItem(
          icon: cpuIcon,
          title: 'Architecture',
          subtitle: archs.isEmpty ? 'Unknown' : archs,
        ),
        PackageDetailGridItem(
          icon: hashIcon,
          title: 'Version',
          subtitle: formula.versions.stable,
        ),
        PackageDetailGridItem(
          icon: packagesIcon,
          title: 'Type & Tap',
          subtitle: 'Formula • ${formula.tap}',
        ),
        PackageDetailGridItem(
          icon: tagIcon,
          title: 'Full Tag',
          subtitle: formula.fullName,
        ),
        PackageDetailGridItem(
          icon: trendingIcon,
          title: 'Popularity',
          subtitle: formula.installs30d != null
              ? '${StringUtils.formatWithCommas(formula.installs30d)} installs'
              : 'N/A',
        ),
        PackageDetailGridItem(
          icon: badgeIcon,
          title: 'License',
          subtitle: formula.license ?? 'Unknown',
        ),
        PackageDetailGridItem(
          icon: bottleIcon,
          title: 'Has Bottle',
          subtitle: formula.versions.bottle
              ? 'Precompiled (Bottle)'
              : 'Build from Source',
        ),
      ],
    );
  }
}

class PackageDetailGridItem extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final String title;
  final String subtitle;

  const PackageDetailGridItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
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
          onTap != null
              ? _ClickableHomepageWidget(onTap: onTap, subtitle: subtitle)
              : Text(
                  subtitle,
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
