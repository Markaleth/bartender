import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/taps/widgets/add_tap_dialog_info_box.dart';
import 'package:bartender/features/taps/widgets/add_tap_dialog_tap_preview.dart';

class AddTapDialogBody extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const AddTapDialogBody({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addCustomTapHint,
            style: context.bodyM.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: spacingL),
          Text(
            repositoryLabel,
            style: context.labelL.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: spacingS),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: addCustomTapInputHint,
              hintStyle: context.bodyM.copyWith(
                color: AppColors.textTertiary.withValues(alpha: 0.5),
              ),
              prefixIcon: const Icon(
                Icons.link,
                color: AppColors.textSecondary,
                size: iconSizeM,
              ),
              filled: true,
              fillColor: AppColors.background,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusM),
                borderSide: const BorderSide(color: AppColors.borderNeutral),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusM),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: spacingM,
                vertical: spacingM,
              ),
            ),
            autofocus: true,
            onSubmitted: (_) => onSubmit(),
          ),
          const SizedBox(height: spacingM),
          AddTapDialogTapNamePreview(controller: controller),
          const SizedBox(height: spacingL),
          const AddTapDialogInfoBox(),
        ],
      ),
    );
  }
}
