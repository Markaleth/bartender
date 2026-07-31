import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/theme/bartender_context.dart';
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
        color: AppColors.surface,
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
              const IconWidget(
                assetName: openFolderIcon,
                color: AppColors.primary,
                size: iconSizeM,
              ),
              const SizedBox(width: spacingS),
              Expanded(
                child: Text(
                  explorerPaneHeaderCopy,
                  style: context.bodyM.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
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
                  : SizedBox(
                      width: spacingXl,
                      height: spacingXl,
                      child: Tooltip(
                        message: explorerPaneHeaderSyncTooltip,
                        child: ButtonWidget.icon(
                          assetName: updateIcon,
                          iconSize: iconSizeM,
                          color: AppColors.primary,
                          onPressed: () => viewModel.syncData(),
                        ),
                      ),
                    ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacingS),
            child: SizedBox(
              height: spacingXl,
              child: TextField(
                style: context.labelL.copyWith(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: filterPackagesHintText,
                  hintStyle: context.bodyM.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: spacingM,
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
