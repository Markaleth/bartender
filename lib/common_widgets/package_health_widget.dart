import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class PackageHealthWidget extends StatelessWidget {
  final bool isDeprecated;
  final bool isOutdated;
  final bool hasMissingDependencies;
  final bool isDisabled;

  final EdgeInsetsGeometry? padding;
  const PackageHealthWidget({
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: spacingM,
      vertical: spacingS,
    ),
    required this.isDeprecated,
    required this.isOutdated,
    required this.hasMissingDependencies,
    required this.isDisabled,
  });

  bool get _isVisible =>
      isDeprecated || hasMissingDependencies || isOutdated || isDisabled;

  @override
  Widget build(BuildContext context) => Visibility(
    visible: _isVisible,
    child:
        !isDisabled && !isDeprecated && !hasMissingDependencies && !isOutdated
        ? const SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacingS,
            children: [
              if (isDisabled)
                _HealthBanner(
                  color: AppColors.textTertiary,
                  iconAsset: disabledIcon,
                  copy: disabledCopy,
                  padding: padding,
                ),
              if (isDeprecated)
                _HealthBanner(
                  color: AppColors.tertiary,
                  iconAsset: deprecateIcon,
                  copy: deprecationCopy,
                  padding: padding,
                ),
              if (hasMissingDependencies)
                _HealthBanner(
                  color: AppColors.error,
                  iconAsset: warningIcon,
                  copy: missingDependencyCopy,
                  padding: padding,
                ),
              if (isOutdated)
                _HealthBanner(
                  color: AppColors.secondary,
                  iconAsset: updateIcon,
                  copy: updateAvailableCopy,
                  padding: padding,
                ),
            ],
          ),
  );
}

class _HealthBanner extends StatelessWidget {
  final Color color;
  final String iconAsset;
  final String copy;
  final EdgeInsetsGeometry? padding;

  const _HealthBanner({
    required this.color,
    required this.iconAsset,
    required this.copy,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: spacingS),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(radiusM),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            IconWidget(assetName: iconAsset, color: color, size: iconSizeL),
            const SizedBox(width: spacingS),
            Expanded(
              child: Text(copy, style: TextStyle(color: color)),
            ),
          ],
        ),
      ),
    );
  }
}
