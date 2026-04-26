import 'dart:developer';

import 'package:bartender/common_widgets/brew_card.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/data/models/analytics/category/category_analytics_model.dart';
import 'package:flutter/material.dart';

class TrendingPackagesCarousel extends StatefulWidget {
  final List<CategoryAnalyticsItem> items;

  const TrendingPackagesCarousel({super.key, required this.items});

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

  void _goToPage(int page) {
    if (page >= 0 && page < (widget.items.length / _itemsPerPage).ceil()) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();

    final int pageCount = (widget.items.length / _itemsPerPage).ceil();

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: pageCount,
                itemBuilder: (context, pageIndex) {
                  final startIndex = pageIndex * _itemsPerPage;
                  final endIndex =
                      (startIndex + _itemsPerPage > widget.items.length)
                      ? widget.items.length
                      : startIndex + _itemsPerPage;
                  final pageItems = widget.items.sublist(startIndex, endIndex);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacingXl),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(_itemsPerPage, (index) {
                        if (index < pageItems.length) {
                          final item = pageItems[index];
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: index < _itemsPerPage - 1 ? spacingS : 0,
                              ),
                              child: BrewCard(
                                title: item.cask ?? item.formula!,
                                onInstall: () => log(
                                  'Install tapped for ${item.cask ?? item.formula!}',
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: index < _itemsPerPage - 1 ? spacingS : 0,
                              ),
                              child: const SizedBox.shrink(),
                            ),
                          );
                        }
                      }),
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () => _goToPage(_currentPage - 1),
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () => _goToPage(_currentPage + 1),
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pageCount,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? AppColors.primary
                    : AppColors.textTertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
