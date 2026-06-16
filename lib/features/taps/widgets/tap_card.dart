import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/features/taps/widgets/tap_card_widgets/tap_card_body_widget.dart';
import 'package:bartender/features/taps/widgets/tap_card_widgets/tap_card_footer_widget.dart';
import 'package:bartender/features/taps/widgets/tap_card_widgets/tap_card_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/data/models/tap/tap_model.dart';

class TapCard extends StatelessWidget {
  final TapModel tap;
  final bool isSyncing;
  final VoidCallback onViewPackages;
  final VoidCallback onRemove;
  final VoidCallback onTrust;

  const TapCard({
    super.key,
    required this.tap,
    required this.isSyncing,
    required this.onViewPackages,
    required this.onRemove,
    required this.onTrust,
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
          TapCardHeader(tap: tap, isSyncing: isSyncing),
          const HorizontalDivider(),
          TapCardBody(tap: tap),
          const HorizontalDivider(height: 0),
          TapCardFooter(
            isTrusted: tap.trusted,
            tapName: tap.name,
            isSyncing: isSyncing,
            onViewPackages: onViewPackages,
            onUntap: onRemove,
            onTrust: onTrust,
          ),
        ],
      ),
    );
  }
}
