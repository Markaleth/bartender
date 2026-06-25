import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class InspectorPaneTapStatsWidget extends StatelessWidget {
  final String label;
  final int count;

  const InspectorPaneTapStatsWidget({
    super.key,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingS),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(radiusS),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: context.titleM.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: spacingXs),
          Text(
            label,
            style: context.labelL.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
