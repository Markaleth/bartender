import 'dart:async';
import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/data/shell/streaming_shell_command.dart';
import 'package:bartender/features/queue/models/queue_state.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';

class QueueViewModel extends BaseViewModel<QueueState, ScreenEffect> {
  final BrewService _brewService;
  final DatabaseInterface _database;
  final PackageStatusNotifier _packageNotifier;
  final TapStatusNotifier _tapNotifier;
  bool _isProcessing = false;

  QueueViewModel(
    this._brewService,
    this._database,
    this._packageNotifier,
    this._tapNotifier,
  ) : super(QueueState());

  void enqueue(OperationTask task) {
    final updatedTasks = List<OperationTask>.from(state.tasks)..add(task);

    // Automatically open drawer on first task
    final isDrawerExpanded = state.tasks.isEmpty
        ? true
        : state.isDrawerExpanded;
    final activeTaskId = state.activeTaskId ?? task.id;

    emitState(
      state.copyWith(
        tasks: updatedTasks,
        isDrawerExpanded: isDrawerExpanded,
        activeTaskId: activeTaskId,
        isHidden: false,
      ),
    );

    _processQueue();
  }

  void queueOperation({
    required String packageId,
    required PackageType type,
    required OperationType operation,
    String? customUrl,
  }) {
    final task = OperationTask(
      id: '${packageId}_${DateTime.now().millisecondsSinceEpoch}',
      packageId: packageId,
      type: type,
      operation: operation,
      customUrl: customUrl,
    );
    enqueue(task);
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;

    final pendingTaskIndex = state.tasks.indexWhere(
      (t) => t.status == OperationStatus.queued,
    );

    if (pendingTaskIndex == -1) return;

    _isProcessing = true;

    final task = state.tasks[pendingTaskIndex];
    _updateTask(task.copyWith(status: OperationStatus.inProgress));

    try {
      final command = await _startShellCommand(task);
      _listenToCommandOutput(command, task.id);
      await _handleCommandCompletion(command, task.id);
    } catch (e) {
      _handleCommandError(task.id, e.toString());
    }

    _isProcessing = false;
    _processQueue(); // process next
  }

  Future<StreamingShellCommand> _startShellCommand(OperationTask task) async {
    final isCask = task.type == PackageType.cask;

    if (task.type == PackageType.tap) {
      if (task.operation == OperationType.install) {
        final args = ['tap', task.packageId];
        if (task.customUrl != null) args.add(task.customUrl!);
        return _brewService.runCustomStream(args);
      } else if (task.operation == OperationType.uninstall) {
        return _brewService.runCustomStream(['untap', task.packageId]);
      }
    }

    switch (task.operation) {
      case OperationType.install:
        return _brewService.installWithStream(task.packageId, isCask: isCask);
      case OperationType.uninstall:
        return _brewService.uninstallWithStream(task.packageId, isCask: isCask);
      case OperationType.update:
        return _brewService.upgrade(package: task.packageId, isCask: isCask);
      case OperationType.pin:
        return _brewService.runCustomStream(['pin', task.packageId]);
      case OperationType.autoremove:
        return _brewService.runCustomStream(['autoremove']);
      case OperationType.upgrade:
        return _brewService.runCustomStream(['upgrade']);
      case OperationType.cleanup:
        return _brewService.runCustomStream(['cleanup']);
    }
  }

  void _listenToCommandOutput(StreamingShellCommand command, String taskId) {
    command.mergedOutput.listen((chunk) {
      final lines = chunk.split('\n');

      final currentTaskIndex = state.tasks.indexWhere((t) => t.id == taskId);
      if (currentTaskIndex == -1) return;

      final currentTask = state.tasks[currentTaskIndex];
      final updatedLogs = List<String>.from(currentTask.logs)..addAll(lines);

      _updateTask(currentTask.copyWith(logs: updatedLogs));
    });
  }

  Future<void> _handleCommandCompletion(
    StreamingShellCommand command,
    String taskId,
  ) async {
    final exitCode = await command.exitCode;

    final currentTaskIndex = state.tasks.indexWhere(
      (task) => task.id == taskId,
    );
    if (currentTaskIndex == -1) return;

    final currentTask = state.tasks[currentTaskIndex];

    await _syncInstallationStatus(
      currentTask,
    ); // Update DB based on operation result

    _updateTask(
      currentTask.copyWith(
        status: exitCode == 0 ? OperationStatus.success : OperationStatus.error,
        errorMessage: exitCode == 0 ? null : 'Exited with code $exitCode',
      ),
    );
  }

  Future<void> _syncInstallationStatus(OperationTask task) async {
    final isInstall =
        task.operation == OperationType.install ||
        task.operation == OperationType.update;
    final isUninstall = task.operation == OperationType.uninstall;

    if (!isInstall && !isUninstall) return;

    final isCask = task.type == PackageType.cask;

    if (task.type == PackageType.tap) {
      _tapNotifier.markUpdated(task.packageId, isInstall);
      return;
    }

    if (isCask) {
      await _database.updateCaskInstallationStatus(task.packageId, isInstall);
    } else if (task.type == PackageType.formula) {
      await _database.updateFormulaInstallationStatus(
        task.packageId,
        isInstall,
      );
    }

    // Trigger UI updates
    _packageNotifier.markUpdated(task.packageId, task.type, isInstall);
  }

  void _handleCommandError(String taskId, String error) {
    final currentTaskIndex = state.tasks.indexWhere((t) => t.id == taskId);
    if (currentTaskIndex == -1) return;

    final currentTask = state.tasks[currentTaskIndex];
    _updateTask(
      currentTask.copyWith(status: OperationStatus.error, errorMessage: error),
    );
  }

  void _updateTask(OperationTask updatedTask) {
    final updatedTasks = state.tasks.map((t) {
      if (t.id == updatedTask.id) return updatedTask;
      return t;
    }).toList();

    emitState(state.copyWith(tasks: updatedTasks));
  }

  void toggleDrawer() {
    emitState(state.copyWith(isDrawerExpanded: !state.isDrawerExpanded));
  }

  void closeDrawer() {
    final hasActiveTasks = state.tasks.any(
      (t) =>
          t.status == OperationStatus.queued ||
          t.status == OperationStatus.inProgress,
    );
    if (hasActiveTasks) {
      emitEffect(
        const ShowToastEffect(
          'Terminal hidden. Operations running in background.',
        ),
      );
    }
    emitState(state.copyWith(isHidden: true));
  }

  void selectTask(String id) {
    emitState(state.copyWith(activeTaskId: id));
  }

  void clearCompleted() {
    final remainingTasks = state.tasks.where((t) {
      return t.status == OperationStatus.queued ||
          t.status == OperationStatus.inProgress;
    }).toList();

    String? newActiveId = state.activeTaskId;
    if (remainingTasks.where((t) => t.id == state.activeTaskId).isEmpty) {
      newActiveId = remainingTasks.isNotEmpty ? remainingTasks.last.id : null;
    }
    emitEffect(const ShowToastEffect('Completed tasks cleared.'));
    emitState(
      state.copyWith(
        tasks: remainingTasks,
        activeTaskId: newActiveId,
        isDrawerExpanded: remainingTasks.isEmpty
            ? false
            : state.isDrawerExpanded,
      ),
    );
  }
}
