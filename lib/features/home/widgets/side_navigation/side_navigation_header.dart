import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/theme/bartender_layout.dart';
import 'package:bartender/core/constants/app_strings.dart';

class SideNavigationHeader extends StatelessWidget {
  const SideNavigationHeader({super.key});

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
                  appName,
                  style: context.tt.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  appVersion,
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
