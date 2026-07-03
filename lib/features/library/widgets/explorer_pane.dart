import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

import 'package:bartender/features/library/models/library_section_states.dart';

import 'explorer_pane_header.dart';
import 'file_system_folder_header.dart';
import 'file_system_item.dart';
import 'collapsible_sliver_list.dart';

class ExplorerPane extends StatelessWidget {
  const ExplorerPane({super.key});

  @override
  Widget build(BuildContext context) {
    final tapSections = context.select<LibraryViewModel, List<TapSectionState>>(
        (vm) => vm.state.uiSections);
    final isLoading = context.select<LibraryViewModel, bool>(
        (vm) => vm.state.isLoading);
    final isEmpty = context.select<LibraryViewModel, bool>(
        (vm) => vm.state.installedFormulae.isEmpty && vm.state.installedCasks.isEmpty);
    final viewModel = context.read<LibraryViewModel>();

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
        CollapsibleSliverList<PackageItemState>(
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

    return RepaintBoundary(
      child: Container(
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
                  isLoading && isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : CustomScrollView(slivers: slivers),
            ),
          ],
        ),
      ),
    );
  }
}
