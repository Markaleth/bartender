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
    this.iconSize,
    this.withTrailingIcon = false,
  }) : _variant = _ButtonVariant.primary,
       isCompact = false;

  const ButtonWidget.secondary({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize,
    this.withTrailingIcon = false,
  }) : _variant = _ButtonVariant.secondary,
       isCompact = false;

  const ButtonWidget.tertiary({
    super.key,
    required this.label,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize,
    this.withTrailingIcon = false,
    this.isCompact = false,
  }) : _variant = _ButtonVariant.tertiary;

  // --- STATE HELPERS ---

  bool get _isLoading => state == ButtonState.loading;

  bool get _isDisabled =>
      state == ButtonState.disabled || (onPressed == null && !_isLoading);

  VoidCallback? get _activeOnPressed =>
      _isDisabled ? null : (_isLoading ? () {} : onPressed);

  // --- STYLE HELPERS ---

  Color get _contentColor {
    switch (_variant) {
      case _ButtonVariant.primary:
        return _isDisabled ? AppColors.iconDefault : AppColors.background;
      case _ButtonVariant.secondary:
        return _isDisabled || _isLoading
            ? AppColors.textTertiary
            : AppColors.primary;
      case _ButtonVariant.tertiary:
        return _isDisabled || _isLoading
            ? AppColors.textSecondary
            : AppColors.primary;
    }
  }

  Color get _spinnerColor {
    switch (_variant) {
      case _ButtonVariant.primary:
        return AppColors.background;
      case _ButtonVariant.secondary:
        return AppColors.textTertiary;
      case _ButtonVariant.tertiary:
        return _contentColor;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    final color = _contentColor;
    switch (_variant) {
      case _ButtonVariant.primary:
      case _ButtonVariant.secondary:
        return context.labelL.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        );
      case _ButtonVariant.tertiary:
        return context.labelM.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        );
    }
  }

  ButtonStyle get _buttonStyle {
    final alignment = withTrailingIcon
        ? IconAlignment.end
        : IconAlignment.start;

    switch (_variant) {
      case _ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, defaultButtonHeight),
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
          iconAlignment: alignment,
        );
      case _ButtonVariant.secondary:
        final borderColor = _isDisabled || _isLoading
            ? AppColors.borderNeutral
            : AppColors.primary;
        return OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, defaultButtonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusM),
          ),
          side: BorderSide(color: borderColor),
          iconAlignment: alignment,
        );
      case _ButtonVariant.tertiary:
        return TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: isCompact
              ? const EdgeInsets.symmetric(horizontal: spacingS)
              : null,
          visualDensity: isCompact
              ? const VisualDensity(vertical: -4, horizontal: -4)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusM),
          ),
          iconAlignment: alignment,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelWidget = Text(
      label,
      textAlign: TextAlign.center,
      style: _getTextStyle(context),
    );

    // Resolve icon or spinner inline
    Widget? activeIcon;
    if (_isLoading) {
      final size = _variant == _ButtonVariant.tertiary ? iconSizeXs : iconSizeS;
      final thickness = _variant == _ButtonVariant.tertiary
          ? thicknessS
          : thicknessM;
      activeIcon = SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(_spinnerColor),
          strokeWidth: thickness,
        ),
      );
    } else if (iconData != null) {
      activeIcon = Icon(
        iconData,
        size: iconSize ?? iconSizeS,
        color: _contentColor,
      );
    }

    final style = _buttonStyle;

    // Instantiate the final Flutter buttons directly in the build method
    switch (_variant) {
      case _ButtonVariant.primary:
        return activeIcon != null
            ? ElevatedButton.icon(
                style: style,
                onPressed: _activeOnPressed,
                icon: activeIcon,
                label: labelWidget,
              )
            : ElevatedButton(
                style: style,
                onPressed: _activeOnPressed,
                child: labelWidget,
              );

      case _ButtonVariant.secondary:
        return activeIcon != null
            ? OutlinedButton.icon(
                style: style,
                onPressed: _activeOnPressed,
                icon: activeIcon,
                label: labelWidget,
              )
            : OutlinedButton(
                style: style,
                onPressed: _activeOnPressed,
                child: labelWidget,
              );

      case _ButtonVariant.tertiary:
        return activeIcon != null
            ? TextButton.icon(
                style: style,
                onPressed: _activeOnPressed,
                icon: activeIcon,
                label: labelWidget,
              )
            : TextButton(
                style: style,
                onPressed: _activeOnPressed,
                child: labelWidget,
              );
    }
  }
}
