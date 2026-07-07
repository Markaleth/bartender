import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class GlowyPathInput extends StatefulWidget {
  final String path;
  final VoidCallback onBrowse;

  const GlowyPathInput({super.key, required this.path, required this.onBrowse});

  @override
  State<GlowyPathInput> createState() => _GlowyPathInputState();
}

class _GlowyPathInputState extends State<GlowyPathInput> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final displayPath = widget.path.isEmpty
        ? customBrewPathAutoResolved
        : widget.path;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customBrewPathTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: spacing2Xs),
          Text(
            customBrewPathSubtitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: spacingS),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(radiusM),
              border: Border.all(
                color: isFocused
                    ? AppColors.secondary
                    : AppColors.borderNeutral,
                width: thicknessXs,
              ),
              boxShadow: isFocused
                  ? [
                      BoxShadow(
                        color: AppColors.secondary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    focusNode: _focusNode,
                    onTap: widget.onBrowse,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(radiusM),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: spacingM,
                        vertical: spacingM,
                      ),
                      child: Text(
                        displayPath,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: widget.path.isEmpty
                              ? AppColors.textTertiary
                              : AppColors.textPrimary,
                          fontFamily: 'monospace',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: thicknessXs,
                  height: 24,
                  color: AppColors.borderNeutral,
                ),
                TextButton.icon(
                  onPressed: widget.onBrowse,
                  icon: const Icon(
                    Icons.folder_open,
                    size: iconSizeM,
                    color: AppColors.secondary,
                  ),
                  label: Text(
                    browseButtonLabel,
                    style: const TextStyle(color: AppColors.secondary),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: spacingM),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(radiusM),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
