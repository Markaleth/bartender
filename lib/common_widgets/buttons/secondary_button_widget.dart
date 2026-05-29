import 'package:bartender/common_widgets/buttons/button_state.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

final ButtonStyle _baseStyle = OutlinedButton.styleFrom(
  minimumSize: const Size(double.infinity, defaultButtonHeight),
  foregroundColor: AppColors.background,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusM)),
);

class SecondaryButtonWidget extends StatelessWidget {
  final Icon? icon;
  final ButtonState? state;
  final String label;
  final VoidCallback? onPressed;

  const SecondaryButtonWidget({
    super.key,
    required this.label,
    this.state,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = state == ButtonState.loading;
    final isDisabled =
        state == ButtonState.disabled || (onPressed == null && !isLoading);

    // Swap text/border color based on state
    final contentColor = isDisabled || isLoading
        ? AppColors.textTertiary
        : AppColors.primary;
    final borderColor = isDisabled || isLoading
        ? AppColors.borderNeutral
        : AppColors.primary;

    final activeStyle = _baseStyle.copyWith(
      side: WidgetStatePropertyAll(BorderSide(color: borderColor)),
    );

    // If disabled, nullify the callback. If loading, keep empty callback to consume taps.
    final activeOnPressed = isDisabled ? null : (isLoading ? () {} : onPressed);

    final textStyle = context.labelL.copyWith(
      color: contentColor,
      fontWeight: FontWeight.bold,
    );

    // 1. Loading State (takes priority over icon)
    if (isLoading) {
      return OutlinedButton(
        style: activeStyle,
        onPressed: activeOnPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: iconSizeS,
              height: iconSizeS,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.textTertiary,
                ),
                strokeWidth: 1.6,
              ),
            ),
            const SizedBox(width: spacingS),
            Text(label, textAlign: TextAlign.center, style: textStyle),
            const SizedBox(width: spacingS),
            const SizedBox(width: iconSizeS, height: iconSizeS),
          ],
        ),
      );
    }

    // 2. Icon State
    if (icon != null) {
      return OutlinedButton.icon(
        style: activeStyle,
        onPressed: activeOnPressed,
        icon: icon!,
        label: Text(label, textAlign: TextAlign.center, style: textStyle),
      );
    }

    // 3. Default Text State
    return OutlinedButton(
      style: activeStyle,
      onPressed: activeOnPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: iconSizeS, height: iconSizeS),
          const SizedBox(width: spacingS),
          Text(label, textAlign: TextAlign.center, style: textStyle),
          const SizedBox(width: spacingS),
          const SizedBox(width: iconSizeS, height: iconSizeS),
        ],
      ),
    );
  }
}
