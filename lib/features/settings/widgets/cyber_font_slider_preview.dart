import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class CyberFontSliderPreview extends StatelessWidget {
  final double fontSize;
  final ValueChanged<double> onChanged;

  const CyberFontSliderPreview({
    super.key,
    required this.fontSize,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            terminalFontSizeTitle,
            style: context.titleM.copyWith(
              color: AppColors.textPrimary,
              fontWeight: .bold,
            ),
          ),
          const SizedBox(height: spacing2Xs),
          Text(
            terminalFontSizeSubtitle,
            style: context.labelM.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: spacingM),
          Container(
            padding: const EdgeInsets.all(spacingM),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(radiusM),
              border: Border.all(
                color: AppColors.borderNeutral,
                width: thicknessXs,
              ),
            ),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              '$fontPreviewPrefix$fontPreviewText',
              style: context.monoM.copyWith(
                fontSize: fontSize,
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: spacingM),
          Row(
            children: [
              Text(
                '10',
                style: context.labelM.copyWith(
                  color: AppColors.textTertiary,
                  fontSize: 10,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.tertiary,
                    inactiveTrackColor: AppColors.surface,
                    thumbColor: AppColors.tertiary,
                    overlayColor: AppColors.tertiary.withValues(alpha: 0.2),
                    trackHeight: thicknessS,
                  ),
                  child: Slider(
                    value: fontSize,
                    min: 10.0,
                    max: 24.0,
                    divisions: 14,
                    label: '${fontSize.toInt()} pt',
                    onChanged: onChanged,
                  ),
                ),
              ),
              Text(
                '24',
                style: context.labelM.copyWith(color: AppColors.textTertiary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
