import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class TapBadge extends StatelessWidget {
  final String? assetPath;
  final String text;
  final Color color;

  const TapBadge({
    super.key,
    this.assetPath,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingS,
        vertical: spacing2Xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radiusL),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        spacing: spacingXs,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetPath != null)
            IconWidget(assetName: assetPath!, size: iconSizeS, color: color),
          Text(
            text,
            style: context.labelS.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
