import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class AddTapDialogInfoBox extends StatelessWidget {
  const AddTapDialogInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingM),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(radiusM),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info, color: AppColors.secondary, size: iconSizeM),
          const SizedBox(width: spacingM),
          Expanded(
            child: Text(
              addTapInfoBoxCopy,
              style: context.labelL.copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
