import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

import 'package:bartender/features/library/models/library_ui_models.dart';

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

    final tapSections = state.uiSections;

    final slivers = <Widget>[
      const SliverToBoxAdapter(child: SizedBox(height: spacingS)),
    ];

    for (final section in tapSections) {
      slivers.add(
        SliverToBoxAdapter(
          child: FileSystemFolderHeader(
            title: section.tapName,
            installPath: section.installPath,
            isExpanded: section.isExpanded,
            isSelected: section.isSelected,
            onToggleExpand: () => viewModel.toggleTapExpanded(section.tapName),
            onSelect: () => viewModel.selectPackage(section.tapModel),
          ),
        ),
      );

      slivers.add(
        CollapsibleSliverList<PackageItemUiModel>(
          items: section.packages,
          isExpanded: section.isExpanded,
          itemBuilder: (context, item, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: FileSystemItem(
                isHealthy: item.isHealthy,
                title: item.title,
                version: item.version,
                isSelected: item.isSelected,
                isCask: item.isCask,
                onTap: () => viewModel.selectPackage(item.package),
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
