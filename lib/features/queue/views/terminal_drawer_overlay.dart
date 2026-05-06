import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/queue/models/queue_state.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TerminalDrawerOverlay extends StatelessWidget {
  const TerminalDrawerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<QueueViewModel, QueueState, void>(
      viewModel: context.read<QueueViewModel>(),
      builder: (context, viewModel, state) {
        if (state.tasks.isEmpty) return const SizedBox.shrink();

        final inProgressCount = state.tasks
            .where((t) => t.status == OperationStatus.inProgress)
            .length;

        return Padding(
          padding: const EdgeInsets.only(right: spacingL, bottom: spacingL),
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedContainer(
              duration: defaultAnimationDuration,
              curve: Curves.easeInOut,
              width: 400,
              height: state.isDrawerExpanded ? 320 : 48,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(radiusL),
                border: Border.all(color: AppColors.borderNeutral),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: state.isDrawerExpanded
                  ? _buildExpanded(context, viewModel, state)
                  : _buildCollapsed(context, viewModel, inProgressCount),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCollapsed(
      BuildContext context, QueueViewModel viewModel, int inProgressCount) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: viewModel.toggleDrawer,
        borderRadius: BorderRadius.circular(radiusL),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacingM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (inProgressCount > 0)
                    const Padding(
                      padding: EdgeInsets.only(right: spacingS),
                      child: SizedBox(
                        width: 8,
                        height: 8,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                      ),
                    ),
                  Text(
                    '$inProgressCount In Progress',
                    style: context.labelM.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              const Icon(Icons.expand_less, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpanded(
      BuildContext context, QueueViewModel viewModel, QueueState state) {
    return Column(
      children: [
        _buildHeader(context, viewModel),
        _buildQueueVisualizer(context, viewModel, state),
        Expanded(child: _buildLogViewer(state)),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, QueueViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(radiusL)),
        border: Border(bottom: BorderSide(color: AppColors.borderNeutral)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.terminal, color: AppColors.secondary, size: 16),
              const SizedBox(width: spacingS),
              Text(
                'ACTIVE QUEUE',
                style: context.labelS.copyWith(
                  color: AppColors.textPrimary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.clear_all, size: 16),
                onPressed: viewModel.clearCompleted,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: spacingM),
              IconButton(
                icon: const Icon(Icons.expand_more, size: 16),
                onPressed: viewModel.toggleDrawer,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQueueVisualizer(
      BuildContext context, QueueViewModel viewModel, QueueState state) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: spacingM),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.surface)),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.tasks.length,
        separatorBuilder: (_, __) => Container(
          width: 16,
          height: 1,
          color: AppColors.borderNeutral,
          margin: const EdgeInsets.symmetric(horizontal: 4),
        ),
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          final isSelected = state.activeTaskId == task.id;
          
          Color borderColor = AppColors.borderNeutral;
          Color bgColor = AppColors.surface;
          IconData icon = Icons.inventory_2;
          
          if (task.status == OperationStatus.inProgress) {
            borderColor = AppColors.primary;
            bgColor = AppColors.primary.withValues(alpha: 0.2);
          } else if (task.status == OperationStatus.success) {
            borderColor = AppColors.secondary;
            bgColor = AppColors.secondary.withValues(alpha: 0.1);
          } else if (task.status == OperationStatus.error) {
            borderColor = AppColors.error;
            bgColor = AppColors.error.withValues(alpha: 0.1);
          }
          
          return GestureDetector(
            onTap: () => viewModel.selectTask(task.id),
            child: Center(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(radiusS),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : borderColor,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: task.status == OperationStatus.inProgress
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            blurRadius: 10,
                          )
                        ]
                      : null,
                ),
                child: Icon(icon, size: 16, color: borderColor == AppColors.borderNeutral ? AppColors.textSecondary : borderColor),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogViewer(QueueState state) {
    final activeTask = state.tasks.where((t) => t.id == state.activeTaskId).firstOrNull;
    if (activeTask == null) return const SizedBox.shrink();

    return _LogListViewer(logs: activeTask.logs);
  }
}

class _LogListViewer extends StatefulWidget {
  final List<String> logs;

  const _LogListViewer({required this.logs});

  @override
  State<_LogListViewer> createState() => _LogListViewerState();
}

class _LogListViewerState extends State<_LogListViewer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant _LogListViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logs.length > oldWidget.logs.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.all(spacingM),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.logs.length,
        itemBuilder: (context, index) {
          return Text(
            widget.logs[index],
            style: const TextStyle(
              fontFamily: 'Fira Code', // Ensure this or fallback works
              fontSize: 11,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          );
        },
      ),
    );
  }
}
