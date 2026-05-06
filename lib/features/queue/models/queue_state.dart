import 'package:bartender/core/models/operation_task/operation_task.dart';

class QueueState {
  final List<OperationTask> tasks;
  final String? activeTaskId;
  final bool isDrawerExpanded;

  QueueState({
    this.tasks = const [],
    this.activeTaskId,
    this.isDrawerExpanded = false,
  });

  QueueState copyWith({
    List<OperationTask>? tasks,
    String? activeTaskId,
    bool? isDrawerExpanded,
  }) {
    return QueueState(
      tasks: tasks ?? this.tasks,
      activeTaskId: activeTaskId ?? this.activeTaskId,
      isDrawerExpanded: isDrawerExpanded ?? this.isDrawerExpanded,
    );
  }
}
