import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/app_strings.dart';
import '../../models/home_state.dart';
import 'side_navigation_header.dart';
import 'side_navigation_item.dart';

class SideNavigationBar extends StatelessWidget {
  final HomeTab selectedTab;
  final ValueChanged<HomeTab> onTabSelected;

  const SideNavigationBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sideBarWidth,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          right: BorderSide(color: AppColors.borderNeutral, width: thicknessXs),
        ),
      ),
      child: Column(
        children: [
          const SideNavigationHeader(),
          HorizontalDivider(),
          SizedBox(height: spacingM),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SideNavigationItem(
                  icon: Icons.explore,
                  label: navBrowse,
                  isSelected: selectedTab == HomeTab.browse,
                  onTap: () => onTabSelected(HomeTab.browse),
                ),
                SideNavigationItem(
                  icon: Icons.library_books,
                  label: navLibrary,
                  isSelected: selectedTab == HomeTab.library,
                  onTap: () => onTabSelected(HomeTab.library),
                ),
                SideNavigationItem(
                  icon: Icons.update,
                  label: navUpdates,
                  isSelected: selectedTab == HomeTab.updates,
                  onTap: () => onTabSelected(HomeTab.updates),
                ),
              ],
            ),
          ),
          HorizontalDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: spacingXs),
            child: SideNavigationItem(
              icon: Icons.settings,
              label: navSettings,
              isSelected: selectedTab == HomeTab.settings,
              onTap: () => onTabSelected(HomeTab.settings),
            ),
          ),
        ],
      ),
    );
  }
}
