import 'package:bartender/common_widgets/buttons/button_state.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final double? iconSize;
  final String label;
  final ButtonState? state;
  final VoidCallback? onPressed;

  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = state == ButtonState.loading;
    final isDisabled =
        state == ButtonState.disabled || (onPressed == null && !isLoading);

    final textStyle = context.labelL.copyWith(
      fontWeight: FontWeight.bold,
      color: AppColors.background,
    );

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, defaultButtonHeight),
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
    );

    final activeOnPressed = isDisabled ? null : (isLoading ? () {} : onPressed);

    // Loading State
    if (isLoading) {
      return ElevatedButton(
        style: buttonStyle,
        onPressed: activeOnPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: iconSizeS,
              height: iconSizeS,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.background),
                strokeWidth: thicknessM,
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

    // Icon State
    if (iconData != null) {
      return ElevatedButton.icon(
        style: buttonStyle,
        onPressed: activeOnPressed,
        icon: Icon(
          iconData,
          color: isDisabled ? AppColors.iconDefault : AppColors.background,
          size: iconSize,
        ),
        label: Text(label, textAlign: TextAlign.center, style: textStyle),
      );
    }

    // Default Text State
    return ElevatedButton(
      style: buttonStyle,
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
