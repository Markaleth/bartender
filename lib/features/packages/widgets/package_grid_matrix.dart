import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class PackageGridMatrix extends StatelessWidget {
  final String version;
  final List<String> dependencies;

  const PackageGridMatrix({
    super.key,
    required this.version,
    required this.dependencies,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacingM,
      runSpacing: spacingM,
      children: [
        PackageDetailGridItem(
          icon: Icons.computer,
          title: 'OS / Compat',
          subtitle: 'macOS 12+', // Placeholder
        ),
        PackageDetailGridItem(
          icon: Icons.tag,
          title: 'Version / Arch',
          subtitle: '$version (x86_64)', // Placeholder arch
        ),
        PackageDetailGridItem(
          icon: Icons.folder,
          title: 'Install Path',
          subtitle: '/opt/homebrew/...', // Placeholder
        ),
        PackageDetailGridItem(
          icon: Icons.storage,
          title: 'Size',
          subtitle: 'Unknown', // Placeholder
        ),
        PackageDetailGridItem(
          icon: Icons.build,
          title: 'Build Status',
          subtitle: 'Pre-compiled', // Placeholder
        ),
        PackageDetailGridItem(
          icon: Icons.account_tree,
          title: 'Dependencies',
          subtitle: dependencies.isEmpty 
              ? 'None' 
              : '${dependencies.length} packages',
        ),
      ],
    );
  }
}

class PackageDetailGridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PackageDetailGridItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(spacingM),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: AppColors.borderNeutral),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              const SizedBox(width: spacingS),
              Expanded(
                child: Text(
                  title,
                  style: context.labelM.copyWith(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: spacingS),
          Text(
            subtitle,
            style: context.bodyM.copyWith(fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
