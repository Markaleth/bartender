import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';

class FileSystemFolder extends StatefulWidget {
  final String title;
  final String installPath;
  final List<Widget> children;

  const FileSystemFolder({
    super.key,
    required this.title,
    required this.installPath,
    required this.children,
  });

  @override
  State<FileSystemFolder> createState() => _FileSystemFolderState();
}

class _FileSystemFolderState extends State<FileSystemFolder> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(spacingS),
            child: Row(
              children: [
                Icon(
                  _isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: AppColors.iconDefault,
                  size: spacingM,
                ),
                const SizedBox(width: spacingXs),
                Icon(
                  Icons.folder,
                  color: _isExpanded
                      ? AppColors.primary
                      : AppColors.iconDefault,
                  size: spacingM,
                ),
                const SizedBox(width: spacingS),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'monospace',
                      fontSize: 13,
                    ),
                  ),
                ),
                Text(
                  widget.installPath,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontFamily: 'monospace',
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
      ],
    );
  }
}
