import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_task.freezed.dart';

enum PackageType { cask, formula, tap, system }

enum OperationStatus { queued, inProgress, success, error }

enum OperationType {
  install,
  uninstall,
  zap,
  reinstall,
  update,
  pin,
  autoremove,
  upgrade,
  cleanup,
}

/// Represents a single package operation in the queue
@freezed
abstract class OperationTask with _$OperationTask {
  const factory OperationTask({
    required String id,
    required String packageId, // e.g., 'google-chrome' or 'wget'
    required PackageType type,
    required OperationType operation,
    @Default(OperationStatus.queued) OperationStatus status,
    @Default(false) bool isArchived,
    String? errorMessage,
    String? customUrl,
  }) = _OperationTask;
}
