import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class DependencyGraphWidget extends StatelessWidget {
  final List<String> dependencies;

  const DependencyGraphWidget({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dependenciesTitle,
          style: context.bodyM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: spacingS),
        Wrap(
          spacing: spacingS,
          runSpacing: spacingS,
          children: dependencies
              .map(
                (dep) => Chip(
                  label: Text(
                    dep,
                    style: context.labelL.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  backgroundColor: AppColors.background,
                  side: const BorderSide(color: AppColors.borderNeutral),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
