import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class SettingsBentoCard extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final Color accentColor;
  final Widget child;

  const SettingsBentoCard({
    super.key,
    required this.title,
    this.leadingIcon,
    required this.accentColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.borderNeutral, width: thicknessXs),
        borderRadius: BorderRadius.circular(radiusL),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: accentColor, width: thicknessM),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Row(
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, color: accentColor, size: iconSizeM),
                    const SizedBox(width: spacingS),
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.borderNeutral,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spacingS),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
