import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

enum _ButtonVariant { primary, secondary, tertiary }
enum ButtonState { enabled, disabled, loading }

class ButtonWidget extends StatelessWidget {
  final _ButtonVariant _variant;
  final String label;
  final ButtonState? state;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final double? iconSize;
  final bool withTrailingIcon;
  final bool isCompact;

  const ButtonWidget.primary({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize = iconSizeS,
    this.withTrailingIcon = false,
  })  : _variant = _ButtonVariant.primary,
        isCompact = false;

  const ButtonWidget.secondary({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize = iconSizeS,
    this.withTrailingIcon = false,
  })  : _variant = _ButtonVariant.secondary,
        isCompact = false;

  const ButtonWidget.tertiary({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize = iconSizeXs,
    this.withTrailingIcon = false,
    this.isCompact = false,
  })  : _variant = _ButtonVariant.tertiary;

  @override
  Widget build(BuildContext context) {
    final isLoading = state == ButtonState.loading;
    final isDisabled = state == ButtonState.disabled || (onPressed == null && !isLoading);
    final activeOnPressed = isDisabled ? null : (isLoading ? () {} : onPressed);

    // 1. Resolve Colors & Typography based on variant
    Color contentColor;
    Color spinnerColor;
    TextStyle textStyle = context.labelL.copyWith(fontWeight: FontWeight.bold);
    String displayLabel = label;

    switch (_variant) {
      case _ButtonVariant.primary:
        contentColor = isDisabled ? AppColors.iconDefault : AppColors.background;
        spinnerColor = AppColors.background;
        textStyle = textStyle.copyWith(color: contentColor);
        break;
      case _ButtonVariant.secondary:
        contentColor = isDisabled || isLoading ? AppColors.textTertiary : AppColors.primary;
        spinnerColor = AppColors.textTertiary;
        textStyle = textStyle.copyWith(color: contentColor);
        displayLabel = label.toUpperCase(); // Secondary buttons are uppercase
        break;
      case _ButtonVariant.tertiary:
        contentColor = isDisabled || isLoading ? AppColors.textSecondary : AppColors.primary;
        spinnerColor = contentColor;
        textStyle = context.labelM.copyWith(fontWeight: FontWeight.bold, color: contentColor);
        break;
    }

    // 2. Resolve Active Icon / Spinner
    Widget? activeIcon;
    if (isLoading) {
      activeIcon = SizedBox(
        width: iconSizeXs,
        height: iconSizeXs,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
          strokeWidth: thicknessS,
        ),
      );
    } else if (iconData != null) {
      activeIcon = Icon(iconData, size: iconSize ?? iconSizeS, color: contentColor);
    }

    final labelWidget = Text(displayLabel, textAlign: TextAlign.center, style: textStyle);
    final iconAlignment = withTrailingIcon ? IconAlignment.end : IconAlignment.start;

    // 3. Build the underlying button based on variant
    switch (_variant) {
      case _ButtonVariant.primary:
        final style = ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, defaultButtonHeight),
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
          iconAlignment: iconAlignment,
        );
        return activeIcon != null
            ? ElevatedButton.icon(style: style, onPressed: activeOnPressed, icon: activeIcon, label: labelWidget)
            : ElevatedButton(style: style, onPressed: activeOnPressed, child: labelWidget);

      case _ButtonVariant.secondary:
        final borderColor = isDisabled || isLoading ? AppColors.borderNeutral : AppColors.primary;
        final style = OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, defaultButtonHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusM)),
          side: BorderSide(color: borderColor),
          iconAlignment: iconAlignment,
        );
        return activeIcon != null
            ? OutlinedButton.icon(style: style, onPressed: activeOnPressed, icon: activeIcon, label: labelWidget)
            : OutlinedButton(style: style, onPressed: activeOnPressed, child: labelWidget);

      case _ButtonVariant.tertiary:
        final style = TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: isCompact ? const EdgeInsets.symmetric(horizontal: spacingS) : null,
          visualDensity: isCompact ? const VisualDensity(vertical: -4, horizontal: -4) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusM)),
          iconAlignment: iconAlignment,
        );
        return activeIcon != null
            ? TextButton.icon(style: style, onPressed: activeOnPressed, icon: activeIcon, label: labelWidget)
            : TextButton(style: style, onPressed: activeOnPressed, child: labelWidget);
    }
  }
}