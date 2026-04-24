import 'package:bartender/theme/bartender_context.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final bool isActive;

  const StatusBadge({super.key, required this.label, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.secondary.withValues(alpha: 0.2)
            : Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isActive ? AppColors.secondary : Colors.grey,
        ),
      ),
      child: Text(
        label,
        style: context.bodyM?.copyWith(
          color: isActive ? AppColors.secondary : Colors.grey,
        ),
      ),
    );
  }
}
