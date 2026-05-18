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

class TapsView extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const TapsView({super.key, required this.homeViewModel});

  void _showAddTapDialog(BuildContext context, TapsViewModel viewModel) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Tap'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'user/repo or URL',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                viewModel.addTap(controller.text);
              }
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
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
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radiusM),
                            side: const BorderSide(
                              color: AppColors.borderNeutral,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(spacingM),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_tree_outlined,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(width: spacingXs),
                                    Expanded(
                                      child: Text(
                                        tap.name,
                                        style: context.titleM.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: spacingXs),
                                if (tap.remote != null)
                                  Text(
                                    tap.remote!,
                                    style: context.bodyM.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        homeViewModel.navigateAndFilterByTap(
                                          tap.name,
                                        );
                                      },
                                      child: const Text('View Packages'),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: AppColors.error,
                                      ),
                                      onPressed: state.isSyncing
                                          ? null
                                          : () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: const Text(
                                                    'Remove Tap',
                                                  ),
                                                  content: Text(
                                                    'Are you sure you want to untap ${tap.name}?',
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.of(
                                                            ctx,
                                                          ).pop(),
                                                      child: const Text(
                                                        'Cancel',
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(ctx).pop();
                                                        viewModel.removeTap(
                                                          tap.name,
                                                        );
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                            foregroundColor:
                                                                AppColors.error,
                                                          ),
                                                      child: const Text(
                                                        'Remove',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
