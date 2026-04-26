import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_operation.freezed.dart';

enum PackageType { cask, formula }

enum OperationStatus { queued, inProgress, success, error }

/// Represents a single package operation in the queue
@freezed
abstract class PackageOperation with _$PackageOperation {
  const factory PackageOperation({
    required String packageId, // e.g., 'google-chrome' or 'wget'
    required PackageType type,
    @Default(OperationStatus.queued) OperationStatus status,
    String? errorMessage,
  }) = _PackageOperation;
}
