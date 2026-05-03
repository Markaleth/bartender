import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/enums/os_support_filter.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
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
                decoration: const InputDecoration(
                  hintText: 'Search packages...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
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
                  SegmentedButton<PackageTypeFilter>(
                    segments: const [
                      ButtonSegment(
                        value: PackageTypeFilter.all,
                        label: Text('All'),
                      ),
                      ButtonSegment(
                        value: PackageTypeFilter.formulae,
                        label: Text('Formulae'),
                      ),
                      ButtonSegment(
                        value: PackageTypeFilter.casks,
                        label: Text('Casks'),
                      ),
                    ],
                    selected: {state.packageType},
                    onSelectionChanged: (Set<PackageTypeFilter> newSelection) {
                      viewModel.setPackageType(newSelection.first);
                    },
                  ),
                  const SizedBox(width: spacingM),
                  SegmentedButton<OsSupportFilter>(
                    segments: const [
                      ButtonSegment(
                        value: OsSupportFilter.all,
                        label: Text('Any OS'),
                      ),
                      ButtonSegment(
                        value: OsSupportFilter.macOS,
                        label: Text('macOS'),
                      ),
                      ButtonSegment(
                        value: OsSupportFilter.linux,
                        label: Text('Linux'),
                      ),
                    ],
                    selected: {state.osSupport},
                    onSelectionChanged: (Set<OsSupportFilter> newSelection) {
                      viewModel.setOsSupport(newSelection.first);
                    },
                  ),
                  const SizedBox(width: spacingM),
                  FilterChip(
                    label: const Text('Installed Only'),
                    selected: state.showInstalledOnly,
                    onSelected: viewModel.toggleInstalledOnly,
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
