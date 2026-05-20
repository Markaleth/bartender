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
      emitState(state.copyWith(isLoading: true, statusText: 'Initializing...'));

      // Check if DB is empty to determine our scenario
      final isDbEmpty = await _homebrewRepository.isDatabaseEmpty();

      if (isDbEmpty) {
        // Scenario 1: DB is empty. Wait for both API and local sync.
        emitState(
          state.copyWith(statusText: 'Syncing network and local data...'),
        );
        await Future.wait([
          _homebrewRepository.syncAllData(),
          _packageRepository.syncInstalledPackages(),
        ]);
      } else {
        // Scenario 2: DB is populated. Fast local sync, background network sync.
        emitState(state.copyWith(statusText: 'Syncing local packages...'));

        // Only await the local sync so the user gets into the app fast
        await _packageRepository.syncInstalledPackages();

        // Fire off network sync in the background
        _homebrewRepository.syncAllData().catchError((e) {
          debugPrint('Background network sync error: $e');
        });
      }
    } catch (e) {
      // Log error but proceed gracefully
      debugPrint('Error during startup sync: $e');
    } finally {
      emitState(state.copyWith(isLoading: false, statusText: 'Ready'));
      emitEffect(const NavigateToScreenEffect(AppRoutes.home));
    }
  }
}
