import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/queue/models/queue_state.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/queue/widgets/collapsed_widget.dart';
import 'package:bartender/features/queue/widgets/expanded_widget.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TerminalDrawerOverlay extends StatelessWidget {
  const TerminalDrawerOverlay({super.key});

  void _handleEffect(BuildContext context, ScreenEffect effect) {
    if (effect is ShowToastEffect) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            effect.message,
            style: context.bodyM.copyWith(
              color: AppColors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BaseView<QueueViewModel, QueueState, ScreenEffect>(
        viewModel: context.read<QueueViewModel>(),
        onEffect: _handleEffect,
        builder: (context, viewModel, state) {
          if (state.tasks.isEmpty || state.isHidden) {
            return const SizedBox.shrink();
          }

          final inProgressCount = state.tasks
              .where((t) => t.status == OperationStatus.inProgress)
              .length;

          return Padding(
            padding: const EdgeInsets.only(right: spacingL, bottom: spacingL),
            child: Align(
              alignment: Alignment.bottomRight,
              child: RepaintBoundary(
                child: AnimatedContainer(
                  duration: defaultAnimationDuration,
                  curve: Curves.easeInOut,
                  width: terminalDrawerWidth,
                  height: state.isDrawerExpanded
                      ? terminalDrawerExpandedHeight
                      : terminalDrawerCollapsedHeight,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(radiusL),
                    border: Border.all(color: AppColors.borderNeutral),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radiusL),
                    child: state.isDrawerExpanded
                        ? OverflowBox(
                            minHeight: terminalDrawerExpandedHeight,
                            maxHeight: terminalDrawerExpandedHeight,
                            alignment: Alignment.topCenter,
                            child: ExpandedWidget(
                              viewModel: viewModel,
                              state: state,
                            ),
                          )
                        : CollapsedWidget(
                            inProgressCount: inProgressCount,
                            toggleDrawer: viewModel.toggleDrawer,
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
