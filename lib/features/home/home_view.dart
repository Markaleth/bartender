import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/debug/api_tester.dart';
import 'package:bartender/features/packages/views/packages_view.dart';
import 'package:bartender/features/library/views/library_view.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/taps/views/taps_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/core/base_view.dart';
import 'models/home_state.dart';
import 'view_models/home_view_model.dart';
import 'widgets/side_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) =>
      BaseView<HomeViewModel, HomeState, ScreenEffect>(
        viewModelBuilder: (context) => HomeViewModel(
          context.read<TapFilterNotifier>(),
          context.read<HomebrewRepositoryInterface>(),
          context.read<QueueViewModel>(),
          context.read<SystemStatusNotifier>()
        ),
        onModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, state) => Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                SideNavigationBar(
                  selectedTab: state.selectedTab,
                  onTabSelected: viewModel.setTab,
                ),
                Expanded(
                  child: IndexedStack(
                    index: state.selectedTab.index, // Enum index maps perfectly
                    children: [
                      // Index 0: Browse
                      const PackagesView(),
                      // Index 1: Library
                      const LibraryView(),
                      // Index 2: Taps
                      TapsView(homeViewModel: viewModel),
                      // Index 3: Debug
                      const Center(child: ApiTesterWidget()),
                      // Index 4: Settings (placeholder for now)
                      const Center(
                        child: Text('Settings View Placeholder'),
                      ), //TODO: you need to update this!
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
