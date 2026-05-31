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
          const Text(
            'Enter the shorthand owner/repo (defaults to GitHub) or a full repository URL for custom taps (GitLab, Bitbucket, etc.).',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: fontSizeM,
            ),
          ),
          const SizedBox(height: spacingL),
          const Text(
            'REPOSITORY',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: fontSizeS,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: spacingS),
          TextField(
            controller: controller,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'e.g., user/repo or https://gitlab.com/...',
              hintStyle: TextStyle(
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
