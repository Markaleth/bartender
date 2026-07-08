import 'dart:async';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class GlowyPathInput extends StatefulWidget {
  final String path;
  final ValueChanged<String> onChanged;

  const GlowyPathInput({
    super.key,
    required this.path,
    required this.onChanged,
  });

  @override
  State<GlowyPathInput> createState() => _GlowyPathInputState();
}

class _GlowyPathInputState extends State<GlowyPathInput> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  Timer? _debounce;
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController(text: widget.path);
    _isValid = _isValidPath(widget.path);
    _focusNode.addListener(() {
      setState(() {});
      if (!_focusNode.hasFocus) {
        if (_controller.text != widget.path) {
          widget.onChanged(_controller.text);
        }
      }
    });
  }

  bool _isValidPath(String path) {
    if (path.isEmpty) return true;
    return path.startsWith('/') && path.endsWith('brew');
  }

  void _onTextChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isValid = _isValidPath(value);
        });
      }
    });
  }

  @override
  void didUpdateWidget(GlowyPathInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.path != widget.path && _controller.text != widget.path) {
      _controller.text = widget.path;
      _isValid = _isValidPath(widget.path);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final hintPath = ShellUtils.resolvedBrewPath ?? customBrewPathAutoResolved;

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
            style: context.titleM.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: spacing2Xs),
          Text(
            customBrewPathSubtitle,
            style: context.labelM.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: spacingS),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(radiusM),
              border: Border.all(
                color: !_isValid
                    ? AppColors.error
                    : (isFocused
                          ? AppColors.secondary
                          : AppColors.borderNeutral),
                width: thicknessXs,
              ),
              boxShadow: isFocused || !_isValid
                  ? [
                      BoxShadow(
                        color: !_isValid
                            ? AppColors.error.withValues(alpha: 0.3)
                            : AppColors.secondary.withValues(alpha: 0.3),
                        blurRadius: radiusM,
                        spreadRadius: thicknessS,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: spacingM,
                      vertical: spacingM,
                    ),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onChanged: _onTextChanged,
                      onSubmitted: (value) {
                        if (value != widget.path) {
                          widget.onChanged(value);
                        }
                      },
                      style: context.bodyM.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: hintPath,
                        hintStyle: context.bodyM.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!_isValid)
            Padding(
              padding: const EdgeInsets.only(top: spacing2Xs),
              child: Text(
                brewPathErrorText,
                style: context.labelM.copyWith(color: AppColors.error),
              ),
            ),
        ],
      ),
    );
  }
}
