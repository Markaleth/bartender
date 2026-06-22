import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';

class FileSystemItem extends StatefulWidget {
  final String title;
  final String version;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isHealthy;
  final bool isCask;

  const FileSystemItem({
    super.key,
    required this.title,
    required this.version,
    required this.isSelected,
    required this.onTap,
    this.isCask = false,
    required this.isHealthy,
  });

  @override
  State<FileSystemItem> createState() => _FileSystemItemState();
}

class _FileSystemItemState extends State<FileSystemItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.isSelected ? 1.0 : 0.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(FileSystemItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !oldWidget.isSelected) {
      _controller.forward();
    } else if (!widget.isSelected && oldWidget.isSelected) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingS),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(radiusM),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: _SelectionBackgroundPainter(
                progress: _animation.value,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                borderColor: widget.isSelected
                    ? AppColors.primary
                    : Colors.transparent,
                borderWidth: thicknessM,
                radius: radiusM,
              ),
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: spacingXl,
              right: spacingM,
              top: spacingXs,
              bottom: spacingXs,
            ),
            child: Row(
              spacing: spacingS,
              children: [
                Icon(
                  widget.isCask ? Icons.category : Icons.terminal,
                  color: widget.isSelected
                      ? AppColors.primary
                      : AppColors.iconDefault,
                  size: spacingM,
                ),
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.isSelected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                      fontFamily: 'monospace',
                      fontSize: 13,
                    ),
                  ),
                ),
                Row(
                  children: [
                    if (widget.isHealthy)
                      Padding(
                        padding: const EdgeInsets.only(right: spacingXs),
                        child: IconWidget(
                          assetName: warningIcon,
                          color: AppColors.warning,
                          size: iconSizeS,
                        ),
                      ),
                    Text(
                      widget.version,
                      style: TextStyle(
                        color: widget.isSelected
                            ? AppColors.primary
                            : AppColors.textSecondary,
                        fontFamily: 'monospace',
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectionBackgroundPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double radius;

  _SelectionBackgroundPainter({
    required this.progress,
    required this.backgroundColor,
    required this.borderColor,
    this.borderWidth = 0.0,
    this.radius = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background animation from left to right
    if (progress > 0) {
      final bgPaint = Paint()
        ..color = backgroundColor
        ..style = PaintingStyle.fill;

      final rect = Rect.fromLTWH(0, 0, size.width * progress, size.height);
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(radius)),
        bgPaint,
      );
    }

    // Draw solid left border
    if (borderColor != Colors.transparent && borderWidth > 0) {
      final borderPaint = Paint()
        ..color = borderColor
        ..style = PaintingStyle.fill;

      final borderRRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, borderWidth, size.height),
        topLeft: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
      );
      canvas.drawRRect(borderRRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SelectionBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.radius != radius;
  }
}
