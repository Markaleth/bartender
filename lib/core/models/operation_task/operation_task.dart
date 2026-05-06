import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_task.freezed.dart';

enum PackageType { cask, formula }

enum OperationStatus { queued, inProgress, success, error }

/// Represents a single package operation in the queue
@freezed
abstract class OperationTask with _$OperationTask {
  const factory OperationTask({
    required String packageId, // e.g., 'google-chrome' or 'wget'
    required PackageType type,
    @Default(OperationStatus.queued) OperationStatus status,
    String? errorMessage,
  }) = _OperationTask;
}
