import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';

import '../../home/view_models/home_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import '../models/taps_state.dart';
import '../view_models/taps_view_model.dart';
import '../widgets/add_tap_dialog.dart';
import '../widgets/tap_card.dart';

class TapsView extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const TapsView({super.key, required this.homeViewModel});

  void _showAddTapDialog(BuildContext context, TapsViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) => AddTapDialog(
        onAddTap: (tapName, customUrl) =>
            viewModel.addTap(tapName, customUrl: customUrl),
      ),
    );
  }

  void _handleEffect(BuildContext context, ScreenEffect effect) {
    if (effect is ShowToastEffect) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(effect.message),
          backgroundColor: effect.isError ? AppColors.error : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TapsViewModel, TapsState, ScreenEffect>(
      viewModelBuilder: (context) => TapsViewModel(
        context.read<HomebrewRepositoryInterface>(),
        context.read<QueueViewModel>(),
        context.read<TapStatusNotifier>(),
      )..init(),
      onEffect: _handleEffect,
      builder: (context, viewModel, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: _HeaderWidget(
                  isSyncing: state.syncingTap != null,
                  onSync: viewModel.syncTaps,
                  onAddTap: () => _showAddTapDialog(context, viewModel),
                ),
              ),
              const HorizontalDivider(),
              Expanded(
                child: state.tapsState.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (msg) => Center(
                    child: Text(
                      'Error: $msg',
                      style: context.bodyM.copyWith(color: AppColors.error),
                    ),
                  ),
                  success: (taps) {
                    if (taps.isEmpty) {
                      return const Center(child: Text(noTapsFoundCopy));
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(spacingM),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: tapCardWidth,
                            crossAxisSpacing: spacingM,
                            mainAxisSpacing: spacingM,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: taps.length,
                      itemBuilder: (context, index) {
                        final tap = taps[index];
                        return TapCard(
                          tap: tap,
                          isGlobalSyncing: state.syncingTap == 'all',
                          isItemSyncing: state.syncingTap == tap.name,
                          isAnySyncing: state.syncingTap != null,
                          onViewPackages: () {
                            homeViewModel.navigateAndFilterByTap(tap.name);
                          },
                          onRemove: () => viewModel.removeTap(tap.name),
                          onTrust: () => viewModel.trustTap(tap.name),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  final bool isSyncing;
  final VoidCallback onSync;
  final VoidCallback onAddTap;
  const _HeaderWidget({
    required this.isSyncing,
    required this.onSync,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: spacingM,
    children: [
      Text(tapsTitle, style: context.headM.copyWith(color: AppColors.primary)),
      Spacer(),
      Tooltip(
        message: syncTapsTooltip,
        child: SizedBox(
          width: spacing2Xl,
          child: ButtonWidget.icon(
            assetName: systemUpdateIcon,
            onPressed: isSyncing ? null : onSync,
            iconSize: iconSizeM,
            state: isSyncing ? ButtonState.loading : ButtonState.enabled,
          ),
        ),
      ),
      SizedBox(
        width: addTapButtonWidth,
        child: ButtonWidget.primary(
          onPressed: isSyncing ? null : onAddTap,
          iconData: Icons.add,
          label: addTapButtonLabel,
          state: isSyncing ? ButtonState.loading : ButtonState.enabled,
        ),
      ),
    ],
  );
}
