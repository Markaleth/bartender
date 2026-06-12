import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class AddTapDialogFooter extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const AddTapDialogFooter({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingL,
        vertical: spacingM,
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radiusL),
          bottomRight: Radius.circular(radiusL),
        ),
        border: Border(top: BorderSide(color: AppColors.borderNeutral)),
      ),
      child: Row(
        spacing: spacingM,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ButtonWidget.secondary(
              onPressed: () => Navigator.of(context).pop(),
              label: cancelButtonLabel,
            ),
          ),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              final canSubmit = value.text.trim().isNotEmpty;
              return Expanded(
                child: ButtonWidget.primary(
                  onPressed: canSubmit ? onSubmit : null,
                  label: addTapButtonLabel,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
