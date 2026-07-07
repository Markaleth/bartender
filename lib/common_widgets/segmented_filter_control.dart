import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

import 'filter_option.dart';

class SegmentedFilterControl<T> extends StatelessWidget {
  final List<FilterOption<T>> options;
  final T selectedValue;
  final ValueChanged<T> onChanged;

  const SegmentedFilterControl({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: spacingS,
          children: options.map((option) {
            final isSelected = option.value == selectedValue;
            return MouseRegion(
              cursor: isSelected
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (!isSelected) {
                    onChanged(option.value);
                  }
                },
                child: AnimatedContainer(
                  duration: defaultAnimationDuration,
                  padding: const EdgeInsets.symmetric(
                    horizontal: spacingM,
                    vertical: spacingS,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.secondary.withValues(alpha: 0.1)
                        : AppColors.background,
                    borderRadius: BorderRadius.circular(radiusXl),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.secondary
                          : AppColors.borderNeutral,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (option.assetName != null) ...[
                        IconWidget(
                          assetName: option.assetName!,
                          size: spacingL,
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: spacingXs),
                      ],
                      Text(
                        option.label,
                        style: context.bodyM.copyWith(
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.textPrimary,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
