import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

enum _ButtonVariant { primary, secondary, tertiary, icon }

enum ButtonState { enabled, disabled, loading }

class ButtonWidget extends StatelessWidget {
  final _ButtonVariant _variant;
  final String label;
  final Color? color;
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
    this.color,
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
    this.color,
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
    this.color,
  }) : _variant = _ButtonVariant.tertiary;

  const ButtonWidget.icon({
    super.key,
    this.state,
    this.onPressed,
    this.iconData,
    this.iconSize,
    this.withTrailingIcon = false,
    this.color,
  }) : _variant = _ButtonVariant.icon,
       label = '',
       isCompact = false;

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
        return _isDisabled
            ? AppColors.background.withValues(alpha: 0.5)
            : AppColors.background;
      case _ButtonVariant.secondary:
        return _isDisabled || _isLoading
            ? AppColors.textTertiary
            : color ?? AppColors.primary;
      case _ButtonVariant.tertiary:
        return _isDisabled || _isLoading
            ? AppColors.textSecondary
            : color ?? AppColors.primary;
      case _ButtonVariant.icon:
        return _isDisabled || _isLoading
            ? AppColors.textSecondary
            : color ?? AppColors.primary;
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
      case _ButtonVariant.icon:
        return _contentColor;
    }
  }

  TextStyle? _getTextStyle(BuildContext context) {
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
      default:
        return null;
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
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusM),
          ),
          disabledBackgroundColor: (color ?? AppColors.primary).withValues(
            alpha: 0.5,
          ),
          iconAlignment: alignment,
        );
      case _ButtonVariant.secondary:
        final borderColor = _isDisabled || _isLoading
            ? AppColors.borderNeutral
            : color ?? AppColors.primary;
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
          foregroundColor: color ?? AppColors.primary,
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
      case _ButtonVariant.icon:
        return IconButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: color ?? AppColors.primary,
          minimumSize: const Size(defaultButtonHeight, defaultButtonHeight),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelWidget = label.isNotEmpty
        ? Text(
            label,
            textAlign: TextAlign.center,
            style: _getTextStyle(context),
          )
        : null;

    // Resolve icon or spinner inline
    Widget? activeIcon;
    if (_isLoading) {
      final size = iconSize ?? iconSizeS;
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

    // Ensure that we have at least an icon or a label to display.
    assert(
      !(activeIcon == null && labelWidget == null),
      'Button must have either an icon or a label.',
    );

    // Instantiate the final Flutter buttons directly in the build method
    switch (_variant) {
      case _ButtonVariant.primary:
        return ElevatedButton.icon(
          style: style,
          onPressed: _activeOnPressed,
          icon: activeIcon,
          label: labelWidget!,
        );

      case _ButtonVariant.secondary:
        return OutlinedButton.icon(
          style: style,
          onPressed: _activeOnPressed,
          icon: activeIcon,
          label: labelWidget!,
        );

      case _ButtonVariant.tertiary:
        return TextButton.icon(
          style: style,
          onPressed: _activeOnPressed,
          icon: activeIcon,
          label: labelWidget!,
        );
      case _ButtonVariant.icon:
        return IconButton(
          style: style,
          onPressed: _activeOnPressed,
          icon: activeIcon!,
        );
    }
  }
}
