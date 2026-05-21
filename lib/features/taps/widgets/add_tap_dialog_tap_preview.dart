import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/string_utils.dart';

class AddTapDialogTapNamePreview extends StatelessWidget {
  final TextEditingController controller;

  const AddTapDialogTapNamePreview({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final text = value.text.trim();
        if (text.isEmpty) return const SizedBox.shrink();

        final parsedName = StringUtils.parseTapName(text);
        final isCustomUrl = text.startsWith('http') || text.startsWith('git@');

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(spacingXm),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(radiusM),
            border: Border.all(
              color: AppColors.borderNeutral.withValues(alpha: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Tap Name: ',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: fontSizeS,
                  ),
                  children: [
                    TextSpan(
                      text: parsedName,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCustomUrl) ...[
                const SizedBox(height: spacingXs),
                Text.rich(
                  TextSpan(
                    text: 'Custom URL: ',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: fontSizeS,
                    ),
                    children: [
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
