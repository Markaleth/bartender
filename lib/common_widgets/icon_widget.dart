import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  final String assetName;
  final Color color;
  final double size;
  const IconWidget({
    super.key,
    required this.assetName,
    this.color = AppColors.iconDefault,
    this.size = spacingXl,
  });

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    assetName,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    height: size,
    width: size,
  );
}
