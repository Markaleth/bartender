import 'package:bartender/debug/api_tester.dart';
import 'package:bartender/features/packages/views/packages_view.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'models/home_effect.dart';
import 'models/home_state.dart';
import 'view_models/home_view_model.dart';
import 'widgets/side_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) =>
      BaseView<HomeViewModel, HomeState, HomeEffect>(
        viewModelBuilder: (_) => HomeViewModel(),
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
                    children: const [
                      // Index 0: Browse
                      PackagesView(),
                      // Index 1: Library
                      Center(child: Text(placeholderLibrary)),
                      // Index 2: Updates
                      Center(child: Text(placeholderUpdates)),
                      // Index 3: Settings
                      Center(child: Text(placeholderSettings)),
                      // Index 4: Debug
                      Center(child: ApiTesterWidget()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
