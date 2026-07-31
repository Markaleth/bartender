import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class FileSystemFolderHeader extends StatelessWidget {
  final String title;
  final String installPath;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback onToggleExpand;
  final VoidCallback onSelect;

  const FileSystemFolderHeader({
    super.key,
    required this.title,
    required this.installPath,
    required this.isExpanded,
    required this.isSelected,
    required this.onToggleExpand,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: spacingS,
          horizontal: spacingXs,
        ),
        child: Row(
          spacing: spacingXs,
          children: [
            GestureDetector(
              onTap: onToggleExpand,
              child: Icon(
                isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                color: AppColors.iconDefault,
                size: spacingM,
              ),
            ),

            IconWidget(assetName: openFolderIcon,
              color: isExpanded ? AppColors.primary : AppColors.iconDefault,
              size: spacingM,
            ),

            Text(
              title,
              style: context.bodyM.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(width: spacingXs),

            Expanded(
              child: Text(
                installPath,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.monoS.copyWith(color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
