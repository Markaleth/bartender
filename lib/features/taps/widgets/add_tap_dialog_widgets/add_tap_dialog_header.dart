import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/theme/bartender_context.dart';
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
          Expanded(
            child: Text(
              addNewTapDialogHeaderTitle,
              style: context.headM.copyWith(
                color: AppColors.onSurface,
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
                child: IconWidget(
                  assetName: clearIcon,
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
