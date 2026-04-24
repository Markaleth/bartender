import 'package:flutter/material.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_strings.dart';
import '../models/home_effect.dart';
import '../models/home_state.dart';
import '../view_models/home_view_model.dart';
import '../widgets/side_navigation/side_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel, HomeState, HomeEffect>(
      viewModelBuilder: (_) => HomeViewModel(),
      builder: (context, viewModel, state) {
        return Scaffold(
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
                      Center(child: Text(placeholderBrowse)),
                      // Index 1: Library
                      Center(child: Text(placeholderLibrary)),
                      // Index 2: Updates
                      Center(child: Text(placeholderUpdates)),
                      // Index 3: Settings
                      Center(child: Text(placeholderSettings)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
