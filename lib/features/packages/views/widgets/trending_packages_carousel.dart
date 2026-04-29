import 'dart:developer';

import 'package:bartender/common_widgets/brew_card.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:flutter/material.dart';

class TrendingPackagesCarousel extends StatefulWidget {
  final List<List<dynamic>> pages;

  const TrendingPackagesCarousel({super.key, required this.pages});

  @override
  State<TrendingPackagesCarousel> createState() =>
      _TrendingPackagesCarouselState();
}

class _TrendingPackagesCarouselState extends State<TrendingPackagesCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _itemsPerPage = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page, int pageCount) {
    if (page >= 0 && page < pageCount) {
      _pageController.animateToPage(
        page,
        duration: defaultAnimationDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pages.isEmpty) return const SizedBox.shrink();

    final int pageCount = widget.pages.length;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: trendingPackageCarouselHeight,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: pageCount,
                itemBuilder: (context, pageIndex) {
                  return _CarouselPage(
                    items: widget.pages[pageIndex],
                    itemsPerPage: _itemsPerPage,
                  );
                },
              ),
            ),
            if (_currentPage > 0)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => _goToPage(_currentPage - 1, pageCount),
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            if (_currentPage < pageCount - 1)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () => _goToPage(_currentPage + 1, pageCount),
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: spacingM),
        _PageIndicators(pageCount: pageCount, currentPage: _currentPage),
      ],
    );
  }
}

class _CarouselPage extends StatelessWidget {
  final List<dynamic> items;
  final int itemsPerPage;

  const _CarouselPage({required this.items, required this.itemsPerPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingXl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(itemsPerPage, (index) {
          final isLastItem = index == itemsPerPage - 1;
          final item = index < items.length ? items[index] : null;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: isLastItem ? 0 : spacingS),
              child: item != null
                  ? BrewCard(
                      title: item is FormulaModel
                          ? item.name
                          : (item as CaskModel).token,
                      description: item is FormulaModel
                          ? item.desc
                          : (item as CaskModel).desc,
                      version: item is FormulaModel
                          ? item.versions.stable
                          : (item as CaskModel).version,
                      homepage: item is FormulaModel
                          ? item.homepage
                          : (item as CaskModel).homepage,
                      isCask: item is CaskModel,
                      downloads: item is FormulaModel
                          ? StringUtils.formatDownloads(item.installs30d)
                          : StringUtils.formatDownloads(
                              (item as CaskModel).installs30d,
                            ),
                      onInstall: () => log(
                        'Install tapped for ${item is FormulaModel ? item.name : item.token}',
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        }),
      ),
    );
  }
}

class _PageIndicators extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const _PageIndicators({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    if (pageCount <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: spacingXs),
          width: spacingS,
          height: spacingS,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? AppColors.primary
                : AppColors.textTertiary,
          ),
        ),
      ),
    );
  }
}
