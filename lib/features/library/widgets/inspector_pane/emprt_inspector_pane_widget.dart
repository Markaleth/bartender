import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class EmptyInspectorPaneWidget extends StatelessWidget {
  const EmptyInspectorPaneWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(radiusM),
      border: Border.all(color: AppColors.borderNeutral),
    ),
    child: Center(
      child: Text(
        inspectorPaneUnselectedTitle,
        style: context.bodyM.copyWith(color: AppColors.textSecondary),
      ),
    ),
  );
}
