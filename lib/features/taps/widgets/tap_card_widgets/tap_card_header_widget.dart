import 'package:bartender/common_widgets/package_icon/package_icon.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/features/taps/widgets/tap_card_widgets/tap_badge_widget.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class TapCardHeader extends StatelessWidget {
  final TapModel tap;
  final bool isSyncing;

  const TapCardHeader({super.key, required this.tap, required this.isSyncing});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: spacingM,
                  children: [
                    TapBadge(
                      text: tap.official
                          ? headerWidgetOfficialCopy
                          : headerWidgetCommunityCopy,
                      color: tap.official
                          ? AppColors.primary
                          : AppColors.tertiary,
                    ),
                    TapBadge(
                      assetPath: tap.trusted ? trustedIcon : untrustedIcon,
                      text: tap.trusted
                          ? trustedBadgeLabel
                          : untrustedBadgeLabel,
                      color: tap.trusted ? AppColors.success : AppColors.error,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
