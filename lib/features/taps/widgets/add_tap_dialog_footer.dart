import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class AddTapDialogFooter extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const AddTapDialogFooter({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingL,
        vertical: spacingM,
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radiusL),
          bottomRight: Radius.circular(radiusL),
        ),
        border: Border(top: BorderSide(color: AppColors.borderNeutral)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: spacingL, // previously 20
                vertical: spacingXm, // 12
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusM),
                side: const BorderSide(color: AppColors.borderNeutral),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: spacingXm),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              final canSubmit = value.text.trim().isNotEmpty;
              return ElevatedButton.icon(
                onPressed: canSubmit ? onSubmit : null,
                icon: const Icon(Icons.add, size: iconSizeS),
                label: const Text(
                  'Add Tap',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  disabledBackgroundColor: AppColors.surface,
                  disabledForegroundColor: AppColors.textTertiary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: spacingL, // 20
                    vertical: spacingXm, // 12
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radiusM),
                  ),
                  elevation: canSubmit ? thicknessM : 0,
                  shadowColor: AppColors.primary.withValues(alpha: 0.5),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
