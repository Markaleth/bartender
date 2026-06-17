import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/features/home/view_models/home_view_model.dart';

class SideNavigationHeader extends StatelessWidget {
  const SideNavigationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.all(spacingM),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.liquor, color: AppColors.onPrimary),
          ),
          const SizedBox(width: spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: context.titleM,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (state.localVersion != null)
                  Row(
                    children: [
                      Text(
                        'Brew ${state.localVersion}',
                        style: context.labelL.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (state.updateAvailable) ...[
                        const SizedBox(width: spacingS),
                        const Tooltip(
                          message: 'Update Available',
                          child: Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ),
                      ],
                    ],
                  ),
              ],
            ),
          ),
          if (state.isCheckingForUpdates)
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh, size: 20),
              onPressed: viewModel.checkForUpdates,
              tooltip: 'Check for Brew Updates',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }
}
