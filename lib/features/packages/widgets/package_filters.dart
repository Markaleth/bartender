import 'dart:io';

import 'package:bartender/common_widgets/filter_option.dart';
import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/segmented_filter_control.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/features/packages/widgets/tap_filter_menu.dart';
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
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: spacingXl,
        vertical: spacingM,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(radiusM),
            border: Border.all(color: AppColors.borderNeutral),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(radiusM),
                  ),
                  child: TextField(
                    cursorColor: AppColors.textSecondary,
                    decoration: InputDecoration(
                      hintText: searchHintText,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.iconDefault,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: context.bodyM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: spacingM,
                      ),
                    ),
                    onChanged: viewModel.setSearchQuery,
                  ),
                ),
              ),
              const HorizontalDivider(),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Wrap(
                  spacing: spacingXl,
                  runSpacing: spacingM,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (Platform.isMacOS)
                      SegmentedFilterControl<PackageTypeFilter>(
                        selectedValue: state.packageType,
                        onChanged: viewModel.setPackageType,
                        options: const [
                          FilterOption(
                            label: noFiltersCopy,
                            value: PackageTypeFilter.all,
                          ),
                          FilterOption(
                            label: formulaeTitle,
                            value: PackageTypeFilter.formulae,
                            assetName: flaskIcon,
                          ),
                          FilterOption(
                            label: casksTitle,
                            value: PackageTypeFilter.casks,
                            assetName: barrelIcon,
                          ),
                        ],
                      ),
                    if (state.uniqueTapNames.isNotEmpty)
                      TapFilterMenu(uniqueTapNames: state.uniqueTapNames),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

