import 'dart:async';
import 'dart:io';
import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/core/routing/app_router.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/startup/models/startup_state.dart';
import 'package:flutter/foundation.dart';

class StartupViewModel extends BaseViewModel<StartupState, ScreenEffect> {
  final HomebrewRepositoryInterface _homebrewService;
  final QueueViewModel _queueViewModel;
  final SettingsService _settingsService;
  final BrewService _brewService;
  final void Function()? _onExit;

  Timer? _pollTimer;

  StartupViewModel(
    this._homebrewService,
    this._queueViewModel,
    this._settingsService,
    this._brewService, {
    void Function()? onExit,
  })  : _onExit = onExit,
        super(const StartupState());

  Future<void> initialize() async {
    try {
      emitState(
        state.copyWith(
          isLoading: true,
          statusText: 'Checking system requirements...',
          isBrewMissing: false,
          isInstallingBrew: false,
        ),
      );

      final isInstalled = await _brewService.isInstalled();
      if (!isInstalled) {
        emitState(
          state.copyWith(
            isLoading: false,
            statusText: 'Homebrew is required to continue',
            isBrewMissing: true,
            isInstallingBrew: false,
          ),
        );
        return;
      }

      await _proceedWithInitialization();
    } catch (e) {
      debugPrint('Error during startup: $e');
      emitState(state.copyWith(isLoading: false, statusText: 'Ready'));
      emitEffect(const NavigateToScreenEffect(AppRoutes.home));
    }
  }

  void exitApp() {
    _pollTimer?.cancel();
    if (_onExit != null) {
      _onExit();
    } else {
      exit(0);
    }
  }

  Future<void> installHomebrew() async {
    emitState(
      state.copyWith(
        isInstallingBrew: true,
        statusText: 'Installing Homebrew...',
      ),
    );

    final launched = await _brewService.launchHomebrewInstaller();
    if (!launched && !BrewService.isSimulateNoBrewActive) {
      emitEffect(
        const ShowToastEffect(
          'Failed to launch terminal installer. Please install Homebrew manually.',
          isError: true,
        ),
      );
      emitState(
        state.copyWith(
          isInstallingBrew: false,
          statusText: 'Homebrew installation failed to start',
        ),
      );
      return;
    }

    _startPollingForBrewInstallation();
  }

  void _startPollingForBrewInstallation() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      await checkBrewInstalledAgain(fromTimer: true);
    });
  }

  Future<bool> checkBrewInstalledAgain({bool fromTimer = false}) async {
    final installed = await _brewService.isInstalled();
    if (installed) {
      _pollTimer?.cancel();
      _pollTimer = null;

      // Re-initialize ShellUtils to pick up the newly installed brew path
      await ShellUtils.init();

      emitEffect(const ShowToastEffect(brewInstalledSuccessMessage));
      emitState(
        state.copyWith(
          isBrewMissing: false,
          isInstallingBrew: false,
          isLoading: true,
          statusText: 'Initializing...',
        ),
      );

      await _proceedWithInitialization();
      return true;
    } else if (!fromTimer) {
      emitEffect(
        const ShowToastEffect(brewInstallFailedMessage, isWarning: true),
      );
    }
    return false;
  }

  Future<void> _proceedWithInitialization() async {
    try {
      emitState(state.copyWith(isLoading: true, statusText: 'Initializing...'));

      // Check if DB is empty to determine our scenario
      final isDbEmpty = await _homebrewService.isDatabaseEmpty();

      if (isDbEmpty) {
        // Scenario 1: DB is empty. Wait for both API and local sync.
        emitState(
          state.copyWith(statusText: 'Syncing network and local data...'),
        );
        await Future.wait([
          _homebrewService.syncAllData(),
          _homebrewService.syncInstalledPackages(),
        ]);
      } else {
        // Scenario 2: DB is populated. Fast local sync, background network sync.
        emitState(state.copyWith(statusText: 'Syncing local packages...'));

        // Only await the local sync so the user gets into the app fast
        await _homebrewService.syncInstalledPackages();

        // Fire off network sync in the background
        _homebrewService.syncAllData().catchError((e) {
          debugPrint('Background network sync error: $e');
        });
      }

      if (_settingsService.backgroundFetching) {
        _queueViewModel.queueOperation(
          packageId: 'system',
          type: PackageType.system,
          operation: OperationType.update,
        );
      }
    } catch (e) {
      // Log error but proceed gracefully
      debugPrint('Error during startup sync: $e');
    } finally {
      emitState(state.copyWith(isLoading: false, statusText: 'Ready'));
      emitEffect(const NavigateToScreenEffect(AppRoutes.home));
    }
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }
}
