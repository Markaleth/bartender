import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/packages/models/packages_effect.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/features/packages/views/widgets/trending_packages_carousel.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) =>
      BaseView<PackagesViewModel, PackagesState, PackagesEffect>(
        viewModelBuilder: (_) => PackagesViewModel(
          context.read<HomebrewRepository>(),
          context.read<PackageRepository>(),
        ),
        onModelReady: (viewModel) => viewModel.fetchData(),
        builder: (context, viewModel, state) => Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(spacingM),
                  child: Text(
                    packagesTitle,
                    style: context.headM.copyWith(color: AppColors.primary),
                  ),
                ),
                HorizontalDivider(),
                SizedBox(height: spacingXl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacingXl),
                  child: Text(popularPackagesTitle, style: context.titleM),
                ),
                SizedBox(height: spacingXs),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacingXl),
                  child: Text(popularPackagesSubtitle),
                ),
                SizedBox(height: spacingM),
                state.trendingData.maybeMap(
                  success: (value) =>
                      TrendingPackagesCarousel(items: value.data),
                  orElse: () => const SizedBox(
                    height: 220,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
