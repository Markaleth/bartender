import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class FileSystemFolderHeader extends StatelessWidget {
  final String title;
  final String installPath;
  final bool isExpanded;
  final VoidCallback onTap;

  const FileSystemFolderHeader({
    super.key,
    required this.title,
    required this.installPath,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(spacingS),
        child: Row(
          children: [
            Icon(
              isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
              color: AppColors.iconDefault,
              size: spacingM,
            ),
            const SizedBox(width: spacingXs),
            Icon(
              Icons.folder,
              color: isExpanded ? AppColors.primary : AppColors.iconDefault,
              size: spacingM,
            ),
            const SizedBox(width: spacingS),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'monospace',
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              installPath,
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
