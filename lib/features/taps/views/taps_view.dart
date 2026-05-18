import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        onAddTap: (tapName) => viewModel.addTap(tapName),
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
      )..init(),
      onEffect: _handleEffect,
      builder: (context, viewModel, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taps',
                      style: context.headM.copyWith(color: AppColors.primary),
                    ),
                    Row(
                      children: [
                        if (state.isSyncing)
                          const Padding(
                            padding: EdgeInsets.only(right: spacingM),
                            child: SizedBox(
                              width: spacingM,
                              height: spacingM,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: state.isSyncing
                              ? null
                              : viewModel.syncTaps,
                          tooltip: 'Sync Taps',
                        ),
                        ElevatedButton.icon(
                          onPressed: state.isSyncing
                              ? null
                              : () => _showAddTapDialog(context, viewModel),
                          icon: const Icon(Icons.add),
                          label: const Text('Add Tap'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderNeutral),
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
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: spacingM,
                            mainAxisSpacing: spacingM,
                            childAspectRatio: 1.2,
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
