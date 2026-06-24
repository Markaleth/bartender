import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

enum PackageVariant {
  alpha,
  beta,
  ptb,
  nightly,
  canary,
  developerEdition,
  esr,
  version,
  app,
  unknown;

  static PackageVariant fromTag(String tag) => switch (tag.toLowerCase()) {
    'alpha' => PackageVariant.alpha,
    'beta' => PackageVariant.beta,
    'app' => PackageVariant.app,
    'ptb' => PackageVariant.ptb,
    'nightly' => PackageVariant.nightly,
    'canary' => PackageVariant.canary,
    'developer-edition' || 'dev' => PackageVariant.developerEdition,
    'esr' => PackageVariant.esr,
    _ when RegExp(r'^[0-9.]+$').hasMatch(tag) => PackageVariant.version,
    _ => PackageVariant.unknown,
  };
}

extension PackageVariantUI on PackageVariant {
  Color get color => switch (this) {
    PackageVariant.app => AppColors.primary,
    PackageVariant.alpha => AppColors.error,
    PackageVariant.beta ||
    PackageVariant.canary ||
    PackageVariant.nightly => AppColors.tertiary,
    PackageVariant.developerEdition ||
    PackageVariant.ptb ||
    PackageVariant.esr => AppColors.secondary,
    PackageVariant.version => AppColors.textSecondary,
    PackageVariant.unknown => AppColors.textTertiary,
  };

  String displayText(String tag) =>
      this == PackageVariant.version ? 'v$tag' : tag.toUpperCase();

  bool get hasTracking => this != PackageVariant.version;
}

class PackageVariantTag extends StatelessWidget {
  final String tag;
  final PackageVariant variant;

  PackageVariantTag({super.key, required this.tag})
    : variant = PackageVariant.fromTag(tag);

  @override
  Widget build(BuildContext context) {
    final color = variant.color;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(
          alpha: 0.15,
        ), // Slightly lower alpha for a cleaner look
        borderRadius: BorderRadius.circular(
          radiusM,
        ), // Slightly rounder corners
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: spacingXs,
          horizontal: spacingS,
        ),
        child: Text(
          variant.displayText(tag),
          style: context.labelM.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: variant.hasTracking
                ? 0.5
                : 0, // Add tracking to uppercase badges
            color: color,
          ),
        ),
      ),
    );
  }
}

