import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

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
                  : CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(height: spacingS),
                      ),
                      SliverToBoxAdapter(
                        child: FileSystemFolderHeader(
                          title: 'Formulae (${state.filteredFormulae.length})',
                          installPath: '${state.brewPrefix}/Cellar',
                          isExpanded: state.formulaeExpanded,
                          onTap: () => viewModel.toggleFormulaeExpanded(),
                        ),
                      ),
                      CollapsibleSliverList<dynamic>(
                        items: state.filteredFormulae,
                        isExpanded: state.formulaeExpanded,
                        itemBuilder: (context, formula, animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            child: FileSystemItem(
                              title: formula.name,
                              version: formula.versions.stable,
                              isSelected: state.selectedPackage == formula,
                              isCask: false,
                              onTap: () => viewModel.selectPackage(formula),
                            ),
                          );
                        },
                      ),
                      if (!Platform.isLinux)
                        SliverToBoxAdapter(
                          child: FileSystemFolderHeader(
                            title: 'Casks (${state.filteredCasks.length})',
                            installPath: '${state.brewPrefix}/Caskroom',
                            isExpanded: state.casksExpanded,
                            onTap: () => viewModel.toggleCasksExpanded(),
                          ),
                        ),
                      if (!Platform.isLinux)
                        CollapsibleSliverList<dynamic>(
                          items: state.filteredCasks,
                          isExpanded: state.casksExpanded,
                          itemBuilder: (context, cask, animation) {
                            return SizeTransition(
                              sizeFactor: animation,
                              child: FileSystemItem(
                                title: cask.token,
                                version: cask.version,
                                isSelected: state.selectedPackage == cask,
                                isCask: true,
                                onTap: () => viewModel.selectPackage(cask),
                              ),
                            );
                          },
                        ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: spacingS),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
