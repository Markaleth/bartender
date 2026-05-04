import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/enums/os_support_filter.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class PackageFilters extends StatelessWidget {
  final PackagesViewModel viewModel;
  final PackagesState state;

  const PackageFilters({
    super.key,
    required this.viewModel,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacingXl),
              child: TextField(
                cursorColor: AppColors.textSecondary,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search for flasks or casks...',
                  prefixIcon: Icon(Icons.search, color: AppColors.iconDefault),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderNeutral),
                    borderRadius: BorderRadius.circular(radiusM),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.surface),
                    borderRadius: BorderRadius.circular(radiusM),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.secondary,
                      width: thicknessS,
                    ),
                    borderRadius: BorderRadius.circular(radiusM),
                  ),
                  hintStyle: context.bodyM.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  fillColor: AppColors.surface,
                ),
                onChanged: viewModel.setSearchQuery,
              ),
            ),
            const SizedBox(height: spacingM),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: spacingXl),
              child: Row(
                children: [
                  _FilterPill(
                    label: 'All',
                    isSelected: state.packageType == PackageTypeFilter.all,
                    onTap: () =>
                        viewModel.setPackageType(PackageTypeFilter.all),
                  ),
                  const SizedBox(width: spacingS),
                  _FilterPill(
                    label: 'Formulae',
                    isSelected: state.packageType == PackageTypeFilter.formulae,
                    onTap: () =>
                        viewModel.setPackageType(PackageTypeFilter.formulae),
                  ),
                  const SizedBox(width: spacingS),
                  _FilterPill(
                    label: 'Casks',
                    isSelected: state.packageType == PackageTypeFilter.casks,
                    onTap: () =>
                        viewModel.setPackageType(PackageTypeFilter.casks),
                  ),
                  const SizedBox(width: spacingM),
                  _FilterPill(
                    label: 'Any OS',
                    isSelected: state.osSupport == OsSupportFilter.all,
                    onTap: () => viewModel.setOsSupport(OsSupportFilter.all),
                  ),
                  const SizedBox(width: spacingS),
                  _FilterPill(
                    label: 'macOS',
                    isSelected: state.osSupport == OsSupportFilter.macOS,
                    onTap: () => viewModel.setOsSupport(OsSupportFilter.macOS),
                  ),
                  const SizedBox(width: spacingS),
                  _FilterPill(
                    label: 'Linux',
                    isSelected: state.osSupport == OsSupportFilter.linux,
                    onTap: () => viewModel.setOsSupport(OsSupportFilter.linux),
                  ),
                  const SizedBox(width: spacingM),
                  _FilterPill(
                    label: 'Installed Only',
                    isSelected: state.showInstalledOnly,
                    onTap: () =>
                        viewModel.toggleInstalledOnly(!state.showInstalledOnly),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: isSelected
                ? null
                : Border.all(color: AppColors.borderNeutral),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.secondary.withValues(alpha: 0.3),
                      blurRadius: 15,
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: context.bodyM.copyWith(
              color: isSelected
                  ? AppColors.onSecondary
                  : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
