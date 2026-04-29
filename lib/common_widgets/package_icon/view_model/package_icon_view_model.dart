import '../../../core/base_view_model.dart';
import '../../../services/icon_resolution/icon_resolution_service.dart';
import '../state/package_icon_state.dart';

class PackageIconViewModel extends BaseViewModel<PackageIconState, PackageIconEffect> {
  final IconResolutionService _iconService;

  PackageIconViewModel(this._iconService) : super(const PackageIconState.loading());

  Future<void> loadIcon(String name, String? homepage, bool isCask) async {
    emitState(const PackageIconState.loading());

    if (_tryLoadFromMemory(name)) return;
    
    await _fetchAndLoadIcon(name, homepage, isCask);
  }

  bool _tryLoadFromMemory(String name) {
    final memoryIcon = _iconService.getMemoryCachedIcon(name);
    if (memoryIcon != null) {
      _emitIconResult(memoryIcon);
      return true;
    }
    return false;
  }

  Future<void> _fetchAndLoadIcon(String name, String? homepage, bool isCask) async {
    final fetchedIcon = await _iconService.getIcon(name, homepage, isCask);
    _emitIconResult(fetchedIcon);
  }

  void _emitIconResult(dynamic icon) {
    if (icon != null && icon.iconUrl != null) {
      emitState(PackageIconState.success(icon));
    } else {
      emitState(const PackageIconState.fallback());
    }
  }
}
