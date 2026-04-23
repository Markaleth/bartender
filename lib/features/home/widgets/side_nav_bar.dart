import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/theme/bartender_layout.dart';
import '../models/home_state.dart';

class SideNavBar extends StatelessWidget {
  final HomeTab selectedTab;
  final ValueChanged<HomeTab> onTabSelected;

  const SideNavBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: BartenderColors.surface,
        border: Border(
          right: BorderSide(
            color: BartenderColors.borderNeutral,
            width: BartenderThickness.xs,
          ),
        ),
      ),
      child: Column(
        children: [
          const _TitleHeader(),
          const Divider(color: BartenderColors.borderNeutral, height: 1),
          context.vSpacingM,
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _NavItem(
                  icon: Icons.explore,
                  label: 'Browse',
                  isSelected: selectedTab == HomeTab.browse,
                  onTap: () => onTabSelected(HomeTab.browse),
                ),
                _NavItem(
                  icon: Icons.library_books,
                  label: 'Library',
                  isSelected: selectedTab == HomeTab.library,
                  onTap: () => onTabSelected(HomeTab.library),
                ),
                _NavItem(
                  icon: Icons.update,
                  label: 'Updates',
                  isSelected: selectedTab == HomeTab.updates,
                  onTap: () => onTabSelected(HomeTab.updates),
                ),
              ],
            ),
          ),
          const Divider(color: BartenderColors.borderNeutral, height: 1),
          _NavItem(
            icon: Icons.settings,
            label: 'Settings',
            isSelected: selectedTab == HomeTab.settings,
            onTap: () => onTabSelected(HomeTab.settings),
          ),
        ],
      ),
    );
  }
}

class _TitleHeader extends StatelessWidget {
  const _TitleHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BartenderLayout.m),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: BartenderColors.primary,
            child: Icon(Icons.person, color: BartenderColors.onPrimary),
          ),
          const SizedBox(width: BartenderLayout.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brewmaster',
                  style: context.tt.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'v4.2.3',
                  style: context.tt.labelLarge?.copyWith(
                    color: BartenderColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? BartenderColors.primary
        : BartenderColors.textSecondary;
    final bgColor = isSelected
        ? BartenderColors.primary.withValues(alpha: 0.1)
        : Colors.transparent;
    final ribbonColor = isSelected
        ? BartenderColors.primary
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: BartenderLayout.xs,
        horizontal: BartenderLayout.s,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: bgColor,
          child: IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  color: ribbonColor,
                  width: BartenderLayout.xs,
                  thickness: BartenderThickness.m,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: BartenderLayout.l,
                    vertical: BartenderLayout.m,
                  ),
                  child: Icon(icon, color: color, size: BartenderLayout.l),
                ),
                context.hSpacingM,
                Text(
                  label,
                  style: context.tt.bodyLarge?.copyWith(
                    color: color,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
