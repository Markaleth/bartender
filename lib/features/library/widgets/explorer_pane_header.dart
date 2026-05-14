import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

class ExplorerPaneHeader extends StatelessWidget {
  const ExplorerPaneHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingS,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF2A2A2A),
        border: Border(bottom: BorderSide(color: AppColors.borderNeutral)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusM),
          topRight: Radius.circular(radiusM),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.folder_open, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Local Environment',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              state.isSyncing
                  ? const SizedBox(
                      width: spacingM,
                      height: spacingM,
                      child: CircularProgressIndicator(
                        strokeWidth: thicknessS,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    )
                  : IconButton(
                      icon: const Icon(Icons.refresh, size: spacingM),
                      color: AppColors.textSecondary,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => viewModel.syncData(),
                    ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacingS),
            child: SizedBox(
              height: 32,
              child: TextField(
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                ),
                decoration: InputDecoration(
                  hintText: 'Filter packages...',
                  hintStyle: const TextStyle(color: AppColors.textSecondary),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: spacingM,
                    vertical: 0,
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radiusS),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: viewModel.setFilterQuery,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
