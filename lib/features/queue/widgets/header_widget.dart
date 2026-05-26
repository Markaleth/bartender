import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final void Function() toggleDrawer;
  final void Function() clearCompleted;

  const HeaderWidget({
    super.key,
    required this.toggleDrawer,
    required this.clearCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingS,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(radiusL)),
        border: Border(bottom: BorderSide(color: AppColors.borderNeutral)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.terminal,
                color: AppColors.secondary,
                size: spacingM,
              ),
              const SizedBox(width: spacingS),
              Text(
                'ACTIVE QUEUE',
                style: context.labelS.copyWith(
                  color: AppColors.textPrimary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, size: spacingM),
                onPressed: clearCompleted,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: spacingM),
              IconButton(
                icon: const Icon(Icons.expand_more, size: spacingM),
                onPressed: toggleDrawer,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
