import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/domain/services/homebrew_service.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/features/packages/widgets/package_filters.dart';
import 'package:bartender/features/packages/widgets/trending_packages_carousel.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';

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
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => child;
  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) =>
      oldDelegate.height != height || oldDelegate.child != child;
}

class PackagesView extends StatefulWidget {
  const PackagesView({super.key});

  @override
  State<PackagesView> createState() => _PackagesViewState();
}

class _PackagesViewState extends State<PackagesView> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _showScrollToTop = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > scrollToTopDisplayThreashold &&
          !_showScrollToTop.value) {
        _showScrollToTop.value = true;
      } else if (_scrollController.offset <= scrollToTopDisplayThreashold &&
          _showScrollToTop.value) {
        _showScrollToTop.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _showScrollToTop.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) => BaseView<PackagesViewModel, PackagesState, ScreenEffect>(
    viewModelBuilder: (context) => PackagesViewModel(
      context.read<HomebrewService>(),
      context.read<PackageStatusNotifier>(),
      context.read<TapFilterNotifier>(),
      context.read<TapStatusNotifier>(),
    )..init(),
    builder: (context, viewModel, state) => Scaffold(
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _showScrollToTop,
        builder: (context, show, child) => !show
            ? const SizedBox.shrink()
            : FloatingActionButton(
                onPressed: () {
                  viewModel.truncateForScrollToTop();
                  _scrollController.jumpTo(0);
                },
                child: const Icon(Icons.arrow_upward),
              ),
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels > 0 &&
                scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent -
                        maxScrollExtentOffset) {
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
                      padding: EdgeInsets.symmetric(horizontal: spacingXl),
                      child: Text(popularPackagesSubtitle),
                    ),
                    const SizedBox(height: spacingM),
                    state.trendingData.maybeMap(
                      success: (value) => TrendingPackagesCarousel(
                        pages: value.data,
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
                      child: Text(allPackagesTitle, style: context.titleM),
                    ),
                    const SizedBox(height: spacingM),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  height: searchBarHeight,
                  child: PackageFilters(viewModel: viewModel, state: state),
                ),
              ),
              //TODO: we need to extract this to a more prominent widget.
              if (state.isSyncingBackground)
                const SliverToBoxAdapter(
                  child: LinearProgressIndicator(minHeight: 2),
                ),
              SliverList.builder(
                itemCount: state.paginatedPackages.length,
                itemBuilder: (context, index) {
                  final item = state.paginatedPackages[index];
                  final isExpanded = state.expandedPackageId == item.id;

                  return PackageListItem(
                    model: item,
                    id: item.id,
                    name: item.name,
                    homepage: item.homepage,
                    isCask: item.isCask,
                    isExpanded: isExpanded,
                    onExpand: () => viewModel.togglePackageExpansion(item.id),
                    description: item.description,
                    version: item.version,
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
