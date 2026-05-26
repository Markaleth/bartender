import 'package:bartender/core/models/operation_task/operation_task.dart';

class QueueState {
  final List<OperationTask> tasks;
  final String? activeTaskId;
  final bool isDrawerExpanded;
  final bool isHidden;

  QueueState({
    this.tasks = const [],
    this.activeTaskId,
    this.isDrawerExpanded = false,
    this.isHidden = false,
  });

  QueueState copyWith({
    List<OperationTask>? tasks,
    String? activeTaskId,
    bool? isDrawerExpanded,
    bool? isHidden,
  }) {
    return QueueState(
      tasks: tasks ?? this.tasks,
      activeTaskId: activeTaskId ?? this.activeTaskId,
      isDrawerExpanded: isDrawerExpanded ?? this.isDrawerExpanded,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
