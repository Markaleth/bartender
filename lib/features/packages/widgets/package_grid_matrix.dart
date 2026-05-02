import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/core/extensions/package_extensions.dart';

class PackageGridMatrix extends StatelessWidget {
  final dynamic model;

  const PackageGridMatrix({
    super.key,
    required this.model,
  });

  String _formatNumber(int? count) {
    if (count == null) return 'N/A';
    return count.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  @override
  Widget build(BuildContext context) {
    final bool isCask = model is CaskModel;
    
    List<CompatibilityInfo> compat = isCask 
        ? (model as CaskModel).compatibility 
        : (model as FormulaModel).compatibility;
    
    String archText = compat
        .where((c) => c != CompatibilityInfo.precompiled)
        .map((c) => c.label)
        .join(', ');
    if (archText.isEmpty) archText = 'Unknown';

    final String version = isCask 
        ? (model as CaskModel).version 
        : (model as FormulaModel).versions.stable;

    final String tap = isCask 
        ? ((model as CaskModel).tap ?? 'homebrew/cask') 
        : (model as FormulaModel).tap;
        
    final String typeAndTap = isCask 
        ? 'Cask • $tap' 
        : 'Formula • $tap';

    final String fullTag = isCask 
        ? ((model as CaskModel).fullToken ?? (model as CaskModel).token)
        : (model as FormulaModel).fullName;

    final int? installs30d = isCask 
        ? (model as CaskModel).installs30d 
        : (model as FormulaModel).installs30d;

    final List<Widget> items = [
      PackageDetailGridItem(
        icon: Icons.computer,
        title: 'Architecture',
        subtitle: archText,
      ),
      PackageDetailGridItem(
        icon: Icons.tag,
        title: 'Version',
        subtitle: version,
      ),
      PackageDetailGridItem(
        icon: Icons.category,
        title: 'Type & Tap',
        subtitle: typeAndTap,
      ),
      PackageDetailGridItem(
        icon: Icons.label,
        title: 'Full Tag',
        subtitle: fullTag,
      ),
      PackageDetailGridItem(
        icon: Icons.trending_up,
        title: 'Popularity',
        subtitle: installs30d != null ? '${_formatNumber(installs30d)} installs' : 'N/A',
      ),
    ];

    if (isCask) {
      final cask = model as CaskModel;
      items.addAll([
        PackageDetailGridItem(
          icon: Icons.update,
          title: 'Auto-Updates',
          subtitle: cask.autoUpdates == true ? 'Managed by App' : 'Managed by Brew',
        ),
        PackageDetailGridItem(
          icon: Icons.inventory_2,
          title: 'Artifact Type',
          subtitle: cask.primaryArtifactType,
        ),
      ]);
    } else {
      final formula = model as FormulaModel;
      items.addAll([
        PackageDetailGridItem(
          icon: Icons.verified,
          title: 'License',
          subtitle: formula.license ?? 'Unknown',
        ),
        PackageDetailGridItem(
          icon: Icons.build,
          title: 'Has Bottle',
          subtitle: formula.versions.bottle ? 'Precompiled (Bottle)' : 'Build from Source',
        ),
      ]);
    }

    return Wrap(
      spacing: spacingM,
      runSpacing: spacingM,
      children: items,
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
