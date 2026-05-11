import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

class ExplorerPane extends StatelessWidget {
  const ExplorerPane({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radiusM),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('Formulae (${state.installedFormulae.length})', style: const TextStyle(color: AppColors.textPrimary)),
            initiallyExpanded: true,
            children: state.installedFormulae.map((formula) => _PackageListItem(
              title: formula.name,
              subtitle: formula.versions.stable,
              isSelected: state.selectedPackage == formula,
              onTap: () => viewModel.selectPackage(formula),
            )).toList(),
          ),
          ExpansionTile(
            title: Text('Casks (${state.installedCasks.length})', style: const TextStyle(color: AppColors.textPrimary)),
            initiallyExpanded: true,
            children: state.installedCasks.map((cask) => _PackageListItem(
              title: cask.token,
              subtitle: cask.version,
              isSelected: state.selectedPackage == cask,
              onTap: () => viewModel.selectPackage(cask),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _PackageListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _PackageListItem({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      title: Text(title, style: const TextStyle(color: AppColors.textPrimary)),
      subtitle: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
      trailing: const Icon(Icons.check_circle, color: AppColors.secondary, size: 16),
      onTap: onTap,
    );
  }
}
