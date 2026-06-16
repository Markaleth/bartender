import 'package:flutter/foundation.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

class PackageStatusUpdate {
  final String itemId;
  final PackageType type;
  final bool isInstalled;
  final DateTime timestamp;

  PackageStatusUpdate({
    required this.itemId,
    required this.type,
    required this.isInstalled,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class TapStatusUpdate {
  final String tapName;
  final bool isInstalled;
  final DateTime timestamp;
  final bool isTrusted;

  TapStatusUpdate({
    required this.tapName,
    required this.isInstalled,
    DateTime? timestamp,
    required this.isTrusted,
  }) : timestamp = timestamp ?? DateTime.now();
}

class SystemStatusUpdate {
  final OperationType operation;
  final DateTime timestamp;

  SystemStatusUpdate({required this.operation, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();
}

class PackageStatusNotifier extends ValueNotifier<PackageStatusUpdate?> {
  PackageStatusNotifier() : super(null);

  void markUpdated(String itemId, PackageType type, bool isInstalled) {
    assert(type == PackageType.formula || type == PackageType.cask);
    value = PackageStatusUpdate(
      itemId: itemId,
      type: type,
      isInstalled: isInstalled,
    );
  }
}

class TapStatusNotifier extends ValueNotifier<TapStatusUpdate?> {
  TapStatusNotifier() : super(null);

  void markUpdated(String tapName, bool isInstalled, bool isTrusted) {
    value = TapStatusUpdate(tapName: tapName, isInstalled: isInstalled, isTrusted: isTrusted);
  }
}

class SystemStatusNotifier extends ValueNotifier<SystemStatusUpdate?> {
  SystemStatusNotifier() : super(null);

  void markUpdated(OperationType operation) {
    value = SystemStatusUpdate(operation: operation);
  }
}
