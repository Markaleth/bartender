import 'dart:io';

import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/durations.dart';

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
                      hintText: 'Search for flasks or casks...',
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
              const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.borderNeutral,
              ),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Wrap(
                  spacing: spacingXl,
                  runSpacing: spacingM,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (Platform.isMacOS)
                      _SegmentedFilterControl<PackageTypeFilter>(
                        selectedValue: state.packageType,
                        onChanged: viewModel.setPackageType,
                        options: const [
                          _FilterOption(
                            label: 'All',
                            value: PackageTypeFilter.all,
                          ),
                          _FilterOption(
                            label: 'Formulae',
                            value: PackageTypeFilter.formulae,
                            assetName: flaskIcon,
                          ),
                          _FilterOption(
                            label: 'Casks',
                            value: PackageTypeFilter.casks,
                            assetName: barrelIcon,
                          ),
                        ],
                      ),
                    Consumer<TapFilterNotifier>(
                      builder: (context, tapNotifier, child) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: spacingM,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(radiusXl),
                            border: Border.all(color: AppColors.borderNeutral),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: tapNotifier.selectedTap,
                              hint: Text(
                                'Filter by Tap',
                                style: context.bodyM.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.iconDefault,
                              ),
                              dropdownColor: AppColors.surface,
                              style: context.bodyM.copyWith(
                                color: AppColors.textPrimary,
                              ),
                              items: [
                                const DropdownMenuItem<String>(
                                  value: null,
                                  child: Text('All Taps'),
                                ),
                                ...state.taps.map((tap) {
                                  return DropdownMenuItem<String>(
                                    value: tap.name,
                                    child: Text(tap.name),
                                  );
                                }),
                              ],
                              onChanged: (String? newValue) {
                                if (newValue == null) {
                                  tapNotifier.clearFilter();
                                } else {
                                  tapNotifier.setFilter(newValue);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
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

class _FilterOption<T> {
  final String label;
  final T value;
  final String? assetName;

  const _FilterOption({
    required this.label,
    required this.value,
    this.assetName,
  });
}

class _SegmentedFilterControl<T> extends StatelessWidget {
  final List<_FilterOption<T>> options;
  final T selectedValue;
  final ValueChanged<T> onChanged;

  const _SegmentedFilterControl({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: spacingS,
          children: options.map((option) {
            final isSelected = option.value == selectedValue;
            return MouseRegion(
              cursor: isSelected
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (!isSelected) {
                    onChanged(option.value);
                  }
                },
                child: AnimatedContainer(
                  duration: defaultAnimationDuration,
                  padding: const EdgeInsets.symmetric(
                    horizontal: spacingM,
                    vertical: spacingS,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.secondary.withValues(alpha: 0.1)
                        : AppColors.background,
                    borderRadius: BorderRadius.circular(radiusXl),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.secondary
                          : AppColors.borderNeutral,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (option.assetName != null) ...[
                        IconWidget(
                          assetName: option.assetName!,
                          size: spacingL,
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: spacingXs),
                      ],
                      Text(
                        option.label,
                        style: context.bodyM.copyWith(
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.textPrimary,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
