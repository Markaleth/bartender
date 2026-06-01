import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
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
        context.read<HomebrewRepository>(),
        context.read<QueueViewModel>(),
        context.read<TapStatusNotifier>(),
      )..init(),
      onEffect: _handleEffect,
      builder: (context, viewModel, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: _HeaderWidget(
                  isSyncing: state.isSyncing,
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
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ),
                  success: (taps) {
                    if (taps.isEmpty) {
                      return const Center(child: Text('No taps found.'));
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(spacingM),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: tapCardWidth,
                            crossAxisSpacing: spacingM,
                            mainAxisSpacing: spacingM,
                            childAspectRatio: tapCardAspectRatio,
                          ),
                      itemCount: taps.length,
                      itemBuilder: (context, index) {
                        final tap = taps[index];
                        return TapCard(
                          tap: tap,
                          isSyncing: state.isSyncing,
                          onViewPackages: () {
                            homeViewModel.navigateAndFilterByTap(tap.name);
                          },
                          onForceSync: () => viewModel.syncTap(tap.name),
                          onRemove: () => viewModel.removeTap(tap.name),
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
      Text('Taps', style: context.headM.copyWith(color: AppColors.primary)),
      Spacer(),
      Tooltip(
        message: 'Sync Taps',
        child: SizedBox(
          width: spacing2Xl,
          child: ButtonWidget.icon(
            iconData: Icons.refresh,
            onPressed: isSyncing ? null : onSync,
            iconSize: iconSizeM,
            state: isSyncing ? ButtonState.loading : ButtonState.enabled,
            // Make the button more compact when only showing the icon
          ),
        ),
      ),
      SizedBox(
        width: 125,
        child: ButtonWidget.primary(
          onPressed: isSyncing ? null : onAddTap,
          iconData: Icons.add,
          label: 'Add Tap',
          state: isSyncing ? ButtonState.loading : ButtonState.enabled,
        ),
      ),
    ],
  );
}
