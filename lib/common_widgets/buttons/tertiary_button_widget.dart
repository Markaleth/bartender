import 'package:bartender/common_widgets/buttons/button_state.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final ButtonState? state;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final double? iconSize;
  final bool isTrailingIcon;
  final bool isCompact;

  const TextButtonWidget({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize,
    this.isTrailingIcon = true,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = state == ButtonState.loading;
    final isDisabled =
        state == ButtonState.disabled || (onPressed == null && !isLoading);

    // Determine colors based on state
    final contentColor = isDisabled || isLoading
        ? AppColors.textSecondary
        : AppColors.primary;

    // If disabled, nullify callback. If loading, keep empty callback to consume taps.
    final activeOnPressed = isDisabled ? null : (isLoading ? () {} : onPressed);

    final textStyle = context.labelM.copyWith(
      color: contentColor,
      fontWeight: FontWeight.bold,
    );

    // Optional compact styling matching trending_packages_widget
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      padding: isCompact ? const EdgeInsets.only(left: spacingS) : null,
      visualDensity: isCompact
          ? const VisualDensity(vertical: -4, horizontal: -4)
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusM),
      ),
    );

    // Determine what to show in the icon slot (Spinner, Icon, or Nothing)
    Widget? activeIcon;
    if (isLoading) {
      activeIcon = SizedBox(
        width: iconSize ?? spacingM,
        height: iconSize ?? spacingM,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(contentColor),
        ),
      );
    } else if (iconData != null) {
      activeIcon = Icon(
        iconData,
        size: iconSize ?? spacingM,
        color: contentColor,
      );
    }

    // Render icon button if we have an icon or are loading
    if (activeIcon != null) {
      return TextButton.icon(
        style: buttonStyle,
        onPressed: activeOnPressed,
        iconAlignment: isTrailingIcon ? IconAlignment.end : IconAlignment.start,
        icon: activeIcon,
        label: Text(label, style: textStyle),
      );
    }

    // Standard text button without icon
    return TextButton(
      style: buttonStyle,
      onPressed: activeOnPressed,
      child: Text(label, style: textStyle),
    );
  }
}
