import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';

class SideNavigationItem extends StatelessWidget {
  final String? icon;
  final IconData? iconData;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SideNavigationItem({
    super.key,
    this.icon,
    this.iconData,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : assert(icon != null || iconData != null);

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;
    final bgColor = isSelected
        ? AppColors.primary.withValues(alpha: 0.1)
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: spacingXs,
        horizontal: spacingS,
      ),
      child: AnimatedContainer(
        duration: defaultAnimationDuration,
        curve: Curves.easeOutCubic,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radiusM),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: IntrinsicHeight(
              child: Row(
                children: [
                  _SelectionIndicator(isSelected: isSelected),
                  _AnimatedIcon(icon: icon, iconData: iconData, color: color),
                  SizedBox(height: spacingM),
                  _AnimatedLabel(
                    label: label,
                    color: color,
                    isSelected: isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectionIndicator extends StatelessWidget {
  final bool isSelected;

  const _SelectionIndicator({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spacingS,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: defaultAnimationDuration,
          curve: Curves.easeOutCubic,
          width: isSelected ? thicknessL : 0.0,
          height: double.infinity,
          decoration: const BoxDecoration(color: AppColors.primary),
        ),
      ),
    );
  }
}

class _AnimatedIcon extends StatelessWidget {
  final String? icon;
  final IconData? iconData;
  final Color color;

  const _AnimatedIcon({this.icon, this.iconData, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingL,
        vertical: spacingM,
      ),
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: color, end: color),
        duration: defaultAnimationDuration,
        curve: Curves.easeOutCubic,
        builder: (context, animatedColor, child) => iconData != null
            ? Icon(iconData, color: animatedColor!, size: spacingL)
            : IconWidget(assetName: icon!, color: animatedColor!, size: spacingL),
      ),
    );
  }
}

class _AnimatedLabel extends StatelessWidget {
  final String label;
  final Color color;
  final bool isSelected;

  const _AnimatedLabel({
    required this.label,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) => AnimatedDefaultTextStyle(
    duration: defaultAnimationDuration,
    curve: Curves.easeOutCubic,
    style: context.bodyL.copyWith(
      color: color,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    ),
    child: Text(label),
  );
}
