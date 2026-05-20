import 'dart:io';

abstract class DeviceEnvironment {
  bool get isHandheld;
  Future<void> init();
}

class LinuxHardwareEnvironment implements DeviceEnvironment {
  bool _isHandheld = false;

  @override
  bool get isHandheld => _isHandheld;

  @override
  Future<void> init() async {
    if (!Platform.isLinux) {
      _isHandheld = false;
      return;
    }

    try {
      final vendorFile = File('/sys/class/dmi/id/sys_vendor');
      final productFile = File('/sys/class/dmi/id/product_name');

      String vendor = '';
      String product = '';

      if (await vendorFile.exists()) {
        vendor = (await vendorFile.readAsString()).toLowerCase().trim();
      }

      if (await productFile.exists()) {
        product = (await productFile.readAsString()).toLowerCase().trim();
      }

      // Check for known handheld strings
      final handheldStrings = [
        'valve',
        'jupiter',
        'galileo',
        'rog ally',
        '83e1',
      ];

      _isHandheld = handheldStrings.any(
        (s) => vendor.contains(s) || product.contains(s),
      );
    } catch (e) {
      // If we can't read the files (e.g., permissions, not existing), default to false
      _isHandheld = false;
    }
  }
}
