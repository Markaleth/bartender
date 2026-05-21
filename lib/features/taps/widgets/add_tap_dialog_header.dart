import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class AddTapDialogHeader extends StatelessWidget {
  const AddTapDialogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingL,
        vertical: spacingL, // previously 20
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusL), // previously 11
          topRight: Radius.circular(radiusL),
        ),
        border: Border(bottom: BorderSide(color: AppColors.borderNeutral)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add_circle,
            color: AppColors.secondary,
            size: iconSizeL, // 24
          ),
          const SizedBox(width: spacingS),
          const Expanded(
            child: Text(
              'Add New Tap',
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: fontSizeL, // 20
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radiusM),
              onTap: () => Navigator.of(context).pop(),
              hoverColor: AppColors.surface,
              child: const Padding(
                padding: EdgeInsets.all(spacingXs),
                child: Icon(
                  Icons.close,
                  color: AppColors.textSecondary,
                  size: iconSizeM, // 20
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
