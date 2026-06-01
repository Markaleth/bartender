import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final double? height;
  const HorizontalDivider({super.key, this.height = thicknessM});

  @override
  Widget build(BuildContext context) =>
      Divider(color: AppColors.borderNeutral, height: height);
}
