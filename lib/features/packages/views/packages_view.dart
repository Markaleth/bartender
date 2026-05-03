import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/packages/models/packages_effect.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/features/packages/widgets/package_filters.dart';
import 'package:bartender/features/packages/widgets/trending_packages_carousel.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/package_list_item.dart';

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  _StickyHeaderDelegate({required this.child, required this.height});
  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;
  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) => oldDelegate.height != height || oldDelegate.child != child;
}

class PackagesView extends StatefulWidget {
  const PackagesView({super.key});

  @override
  State<PackagesView> createState() => _PackagesViewState();
}

class _PackagesViewState extends State<PackagesView> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 400 && !_showScrollToTop) {
        setState(() => _showScrollToTop = true);
      } else if (_scrollController.offset <= 400 && _showScrollToTop) {
        setState(() => _showScrollToTop = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) => BaseView<PackagesViewModel, PackagesState, PackagesEffect>(
    viewModelBuilder: (_) => PackagesViewModel(
      context.read<HomebrewRepository>(),
      context.read<PackageRepository>(),
    ),
    onModelReady: (viewModel) => viewModel.fetchData(),
    builder: (context, viewModel, state) => Scaffold(
      floatingActionButton: _showScrollToTop
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 500) {
              viewModel.loadMorePackages();
            }
            return false;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(spacingM),
                      child: Text(
                        packagesTitle,
                        style: context.headM.copyWith(color: AppColors.primary),
                      ),
                    ),
                    const HorizontalDivider(),
                    const SizedBox(height: spacingL),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: spacingXl,
                      ),
                      child: Text(popularPackagesTitle, style: context.titleM),
                    ),
                    const SizedBox(height: spacingXs),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: spacingXl,
                      ),
                      child: Text(popularPackagesSubtitle),
                    ),
                    const SizedBox(height: spacingM),
                    state.trendingData.maybeMap(
                      success: (value) => TrendingPackagesCarousel(
                        pages: value.data as List<List<dynamic>>,
                      ),
                      orElse: () => const SizedBox(
                        height: trendingPackageCarouselHeight,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    const SizedBox(height: spacingXl),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: spacingXl,
                      ),
                      child: Text('All Packages', style: context.titleM),
                    ),
                    const SizedBox(height: spacingM),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  height: 130.0,
                  child: PackageFilters(viewModel: viewModel, state: state),
                ),
              ),
              SliverList.builder(
                itemCount: state.paginatedPackages.length,
                itemBuilder: (context, index) {
                  final item = state.paginatedPackages[index];
                  final isCask = item is CaskModel;
                  final id = item is CaskModel
                      ? item.token
                      : (item as FormulaModel).name;
                  final name = item is CaskModel
                      ? item.name.first
                      : (item as FormulaModel).fullName;
                  final homepage = item.homepage;

                  final description = item is CaskModel
                      ? item.desc
                      : (item as FormulaModel).desc;
                  final version = item is CaskModel
                      ? item.version
                      : (item as FormulaModel).versions.stable;
                  final isExpanded = state.expandedPackageId == id;

                  return PackageListItem(
                    model: item,
                    id: id,
                    name: name,
                    homepage: homepage,
                    isCask: isCask,
                    isExpanded: isExpanded,
                    onExpand: () => viewModel.togglePackageExpansion(id),
                    description: description,
                    version: version,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
