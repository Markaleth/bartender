import 'dart:async';

import 'package:bartender/core/constants/durations.dart';

import '../../../core/base_view_model.dart';
import '../../../services/icon_resolution/icon_resolution_service.dart';
import '../state/package_icon_state.dart';

class PackageIconViewModel
    extends BaseViewModel<PackageIconState, PackageIconEffect> {
  final IconResolutionService _iconService;
  Timer? _debounceTimer;
  bool _isDisposed = false;

  PackageIconViewModel(this._iconService)
    : super(const PackageIconState.loading());

  Future<void> loadIcon(String name, String? homepage) async {
    _debounceTimer?.cancel();
    emitState(const PackageIconState.loading());

    if (_tryLoadFromMemory(name)) return;

    _debounceTimer = Timer(packageIconDebounceDuration, () {
      if (!_isDisposed) {
        _fetchAndLoadIcon(name, homepage);
      }
    });
  }

  bool _tryLoadFromMemory(String name) {
    final memoryIcon = _iconService.getMemoryCachedIcon(name);
    if (memoryIcon != null) {
      _emitIconResult(memoryIcon);
      return true;
    }
    return false;
  }

  Future<void> _fetchAndLoadIcon(String name, String? homepage) async {
    final fetchedIcon = await _iconService.getIcon(name, homepage);
    if (!_isDisposed) {
      _emitIconResult(fetchedIcon);
    }
  }

  void _emitIconResult(dynamic icon) {
    if (icon != null && icon.iconUrl != null) {
      emitState(PackageIconState.success(icon));
    } else {
      emitState(const PackageIconState.fallback());
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _debounceTimer?.cancel();
    super.dispose();
  }
}
