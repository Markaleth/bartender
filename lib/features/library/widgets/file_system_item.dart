import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';

class FileSystemItem extends StatelessWidget {
  final String title;
  final String version;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCask;

  const FileSystemItem({
    super.key,
    required this.title,
    required this.version,
    required this.isSelected,
    required this.onTap,
    this.isCask = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: thicknessM,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: spacingXl,
          right: spacingM,
          top: spacingXs,
          bottom: spacingXs,
        ),
        child: Row(
          spacing: spacingS,
          children: [
            Icon(
              isCask ? Icons.category : Icons.terminal,
              color: isSelected ? AppColors.primary : AppColors.iconDefault,
              size: spacingM,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  fontFamily: 'monospace',
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              version,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontFamily: 'monospace',
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
