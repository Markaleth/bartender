import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class InspectorPaneHeaderWidget extends StatelessWidget {
  final String name;
  final String version;
  final String description;

  const InspectorPaneHeaderWidget({
    super.key,
    required this.name,
    required this.version,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: context.headM.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Text(
          '$versionPrefix$version',
          style: context.bodyL.copyWith(color: AppColors.secondary),
        ),
        const SizedBox(height: spacingM),
        Text(
          description,
          style: context.bodyM.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
