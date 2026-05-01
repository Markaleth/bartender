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

  static PackageVariant fromTag(String tag) {
    final lowercaseTag = tag.toLowerCase();
    switch (lowercaseTag) {
      case 'alpha':
        return PackageVariant.alpha;
      case 'beta':
        return PackageVariant.beta;
      case 'app':
        return PackageVariant.app;
      case 'ptb':
        return PackageVariant.ptb;
      case 'nightly':
        return PackageVariant.nightly;
      case 'canary':
        return PackageVariant.canary;
      case 'developer-edition':
      case 'dev':
        return PackageVariant.developerEdition;
      case 'esr':
        return PackageVariant.esr;
      default:
        if (RegExp(r'^[0-9.]+$').hasMatch(tag)) {
          return PackageVariant.version;
        }
        return PackageVariant.unknown;
    }
  }
}

class PackageVariantTag extends StatelessWidget {
  final String tag;
  final PackageVariant variant;

  PackageVariantTag({super.key, required this.tag})
    : variant = PackageVariant.fromTag(tag);

  Color get _variantColor {
    switch (variant) {
      case PackageVariant.app:
        return AppColors.primary;
      case PackageVariant.alpha:
        return AppColors.error; // Red for highly unstable
      case PackageVariant.beta:
      case PackageVariant.canary:
      case PackageVariant.nightly:
        return AppColors.tertiary; // Mustard Yellow for testing/bleeding-edge
      case PackageVariant.developerEdition:
      case PackageVariant.ptb:
      case PackageVariant.esr:
        return AppColors.secondary; // Mint for specialized tracks
      case PackageVariant.version:
        return AppColors.textSecondary; // Light grey
      case PackageVariant.unknown:
        return AppColors.textTertiary; // Darker grey
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _variantColor;
    final isVersion = variant == PackageVariant.version;
    final displayText = isVersion ? 'v$tag' : tag.toUpperCase();

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
          displayText,
          style: context.labelM.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: isVersion
                ? 0
                : 0.5, // Add tracking to uppercase badges
            color: color,
          ),
        ),
      ),
    );
  }
}
