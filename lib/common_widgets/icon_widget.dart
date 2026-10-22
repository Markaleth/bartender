import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double size;

  /// When false, the SVG keeps its own colours (e.g. the app logo).
  final bool tinted;

  const IconWidget({
    super.key,
    required this.assetName,
    this.color,
    this.size = iconSizeXl,
    this.tinted = true,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? IconTheme.of(context).color ?? AppColors.iconDefault;

    return SvgPicture.asset(
      assetName,
      colorFilter:
          tinted ? ColorFilter.mode(resolvedColor, BlendMode.srcIn) : null,
      height: size,
      width: size,
    );
  }
}
