import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class InspectorPanePackageStatsWidget extends StatelessWidget {
  final String? tapName;
  final String formattedInstalledSize;
  final String formattedInstallDate;
  final String installPath;

  const InspectorPanePackageStatsWidget({
    super.key,
    required this.tapName,
    required this.formattedInstalledSize,
    required this.formattedInstallDate,
    required this.installPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingS),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(radiusS),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tapName?.isNotEmpty == true) ...[
            _StatRow(label: tapNameLabel, value: tapName!),
            const SizedBox(height: spacingXs),
          ],
          _StatRow(label: installedSizeStatCopy, value: formattedInstalledSize),
          const SizedBox(height: spacingXs),
          _StatRow(label: installDateStatCopy, value: formattedInstallDate),
          const SizedBox(height: spacingXs),
          FutureBuilder<DateTime?>(
            future: ShellUtils.getModifiedDate(installPath),
            builder: (context, snapshot) {
              final modifiedDate = snapshot.data;
              return _StatRow(
                label: lastModifiedStatCopy,
                value: StringUtils.formatTimeAgo(modifiedDate),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.bodyM.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: context.bodyM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
