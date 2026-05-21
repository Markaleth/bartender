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
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info, color: AppColors.secondary, size: iconSizeM),
          SizedBox(width: spacingXm),
          Expanded(
            child: Text(
              'Adding a tap will immediately fetch its formula definitions. This may take a few moments depending on network speed.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: fontSizeS,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
