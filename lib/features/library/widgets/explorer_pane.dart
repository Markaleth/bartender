import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

import 'explorer_pane_header.dart';
import 'file_system_folder.dart';
import 'file_system_item.dart';

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
                : ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    children: [
                      FileSystemFolder(
                        title: 'Formulae (${state.filteredFormulae.length})',
                        installPath: '${state.brewPrefix}/Cellar',
                        children: state.filteredFormulae
                            .map(
                              (formula) => FileSystemItem(
                                title: formula.name,
                                version: formula.versions.stable,
                                isSelected: state.selectedPackage == formula,
                                isCask: false,
                                onTap: () => viewModel.selectPackage(formula),
                              ),
                            )
                            .toList(),
                      ),
                      if (!Platform.isLinux)
                        FileSystemFolder(
                          title: 'Casks (${state.filteredCasks.length})',
                          installPath: '${state.brewPrefix}/Caskroom',
                          children: state.filteredCasks
                              .map(
                                (cask) => FileSystemItem(
                                  title: cask.token,
                                  version: cask.version,
                                  isSelected: state.selectedPackage == cask,
                                  isCask: true,
                                  onTap: () => viewModel.selectPackage(cask),
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
