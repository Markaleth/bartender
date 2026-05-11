import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';

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
            children: state.installedFormulae.map((f) => _buildFormulaItem(context, f, viewModel)).toList(),
          ),
          ExpansionTile(
            title: Text('Casks (${state.installedCasks.length})', style: const TextStyle(color: AppColors.textPrimary)),
            initiallyExpanded: true,
            children: state.installedCasks.map((c) => _buildCaskItem(context, c, viewModel)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFormulaItem(BuildContext context, FormulaModel formula, LibraryViewModel viewModel) {
    final isSelected = viewModel.state.selectedPackage == formula;
    return ListTile(
      selected: isSelected,
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      title: Text(formula.name, style: const TextStyle(color: AppColors.textPrimary)),
      subtitle: Text(formula.versions.stable, style: const TextStyle(color: AppColors.textSecondary)),
      trailing: const Icon(Icons.check_circle, color: AppColors.secondary, size: 16),
      onTap: () => viewModel.selectPackage(formula),
    );
  }

  Widget _buildCaskItem(BuildContext context, CaskModel cask, LibraryViewModel viewModel) {
    final isSelected = viewModel.state.selectedPackage == cask;
    return ListTile(
      selected: isSelected,
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      title: Text(cask.token, style: const TextStyle(color: AppColors.textPrimary)),
      subtitle: Text(cask.version, style: const TextStyle(color: AppColors.textSecondary)),
      trailing: const Icon(Icons.check_circle, color: AppColors.secondary, size: 16),
      onTap: () => viewModel.selectPackage(cask),
    );
  }
}
