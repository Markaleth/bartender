import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) =>
      const Divider(color: AppColors.borderNeutral, height: thicknessM);
}
