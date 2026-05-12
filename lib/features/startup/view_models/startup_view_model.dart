import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/routing/app_router.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/startup/models/startup_state.dart';
import 'package:flutter/foundation.dart';

class StartupViewModel extends BaseViewModel<StartupState, ScreenEffect> {
  final HomebrewRepository _homebrewRepository;
  final PackageRepository _packageRepository;

  StartupViewModel(this._homebrewRepository, this._packageRepository)
    : super(const StartupState());

  Future<void> initialize() async {
    try {
      emitState(
        state.copyWith(isLoading: true, statusText: 'Syncing local data...'),
      );

      await Future.wait([
        _homebrewRepository.syncAllData(),
        _packageRepository.syncInstalledPackages(),
      ]);
    } catch (e) {
      // Log error but proceed gracefully
      debugPrint('Error during startup sync: $e');
    } finally {
      emitState(state.copyWith(isLoading: false, statusText: 'Ready'));
      emitEffect(const NavigateToScreenEffect(AppRoutes.home));
    }
  }
}
