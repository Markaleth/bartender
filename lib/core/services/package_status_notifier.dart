import 'package:flutter/foundation.dart';

class PackageStatusUpdate {
  final String packageId;
  final bool isInstalled;
  final DateTime timestamp;

  PackageStatusUpdate({
    required this.packageId,
    required this.isInstalled,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class PackageStatusNotifier extends ValueNotifier<PackageStatusUpdate?> {
  PackageStatusNotifier() : super(null);

  void markUpdated(String packageId, bool isInstalled) {
    value = PackageStatusUpdate(
      packageId: packageId,
      isInstalled: isInstalled,
    );
  }
}
