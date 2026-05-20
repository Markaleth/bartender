import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';

import 'explorer_pane_header.dart';
import 'file_system_folder_header.dart';
import 'file_system_item.dart';
import 'collapsible_sliver_list.dart';

class ExplorerPane extends StatelessWidget {
  const ExplorerPane({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    final tapEntries = state.packagesByTap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    final slivers = <Widget>[
      const SliverToBoxAdapter(child: SizedBox(height: spacingS)),
    ];

    for (final entry in tapEntries) {
      final tapName = entry.key;
      final packages = entry.value;

      final tapModel = state.installedTaps.firstWhere(
        (t) => t.name == tapName,
        orElse: () => TapModel(
          name: tapName,
          user: tapName.split('/').firstOrNull ?? '',
          repo: tapName.split('/').skip(1).firstOrNull ?? '',
          path: '${state.brewPrefix}/Library/Taps/$tapName',
        ),
      );

      final isExpanded = state.expandedTaps.contains(tapName);
      final isSelected =
          state.selectedPackage is TapModel &&
          (state.selectedPackage as TapModel).name == tapName;

      slivers.add(
        SliverToBoxAdapter(
          child: FileSystemFolderHeader(
            title: tapName,
            installPath: tapModel.path,
            isExpanded: isExpanded,
            isSelected: isSelected,
            onToggleExpand: () => viewModel.toggleTapExpanded(tapName),
            onSelect: () => viewModel.selectPackage(tapModel),
          ),
        ),
      );

      slivers.add(
        CollapsibleSliverList<dynamic>(
          items: packages,
          isExpanded: isExpanded,
          itemBuilder: (context, package, animation) {
            String title = '';
            String version = '';
            bool isCask = false;

            if (package is FormulaModel) {
              title = package.name;
              version = package.versions.stable;
              isCask = false;
            } else if (package is CaskModel) {
              title = package.token;
              version = package.version;
              isCask = true;
            }

            return SizeTransition(
              sizeFactor: animation,
              child: FileSystemItem(
                title: title,
                version: version,
                isSelected: state.selectedPackage == package,
                isCask: isCask,
                onTap: () => viewModel.selectPackage(package),
              ),
            );
          },
        ),
      );
    }

    slivers.add(const SliverToBoxAdapter(child: SizedBox(height: spacingS)));

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radiusM),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: Column(
        children: [
          const ExplorerPaneHeader(),

          // Body Section
          Expanded(
            child:
                state.isLoading &&
                    state.installedFormulae.isEmpty &&
                    state.installedCasks.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(slivers: slivers),
          ),
        ],
      ),
    );
  }
}
