import 'dart:io';
import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/features/library/models/library_effect.dart';
import 'package:bartender/features/library/models/library_state.dart';

class LibraryViewModel extends BaseViewModel<LibraryState, LibraryEffect> {
  final DatabaseInterface _db;
  final BrewService _brewService;

  LibraryViewModel({
    required DatabaseInterface db,
    required BrewService brewService,
  })  : _db = db,
        _brewService = brewService,
        super(const LibraryState());

  Future<void> init() async {
    emitState(state.copyWith(isLoading: true));

    try {
      final formulae = await _db.getInstalledFormulae();
      final casks = await _db.getInstalledCasks();

      emitState(state.copyWith(
        installedFormulae: formulae,
        installedCasks: casks,
        isLoading: false,
      ));

      await fetchSystemHealth();
    } catch (e) {
      emitState(state.copyWith(isLoading: false));
      emitEffect(LibraryEffect.error('Failed to load library: $e'));
    }
  }

  Future<void> fetchSystemHealth() async {
    try {
      final brewPrefix = await _fetchBrewPrefix();
      emitState(state.copyWith(brewPrefix: brewPrefix));

      final storageUsed = await _fetchSystemStorage(brewPrefix);
      if (storageUsed != null) {
        emitState(state.copyWith(systemStorageUsed: storageUsed));
      }

      final orphans = await _fetchOrphanCount();
      emitState(state.copyWith(orphanedDependenciesCount: orphans));

      final health = _calculateHealthScore(orphans);
      emitState(state.copyWith(globalHealthScore: health));
    } catch (e) {
      emitEffect(LibraryEffect.error('Failed to fetch system health: $e'));
    }
  }

  Future<String> _fetchBrewPrefix() async {
    final prefixResult = await _brewService.runCustom(['--prefix']);
    if (prefixResult.exitCode == 0) {
      return prefixResult.stdout.trim();
    }
    return '/opt/homebrew';
  }

  Future<String?> _fetchSystemStorage(String brewPrefix) async {
    final duResult = await Process.run('du', ['-sh', brewPrefix]);
    if (duResult.exitCode == 0) {
      final storageLine = duResult.stdout.toString().trim();
      final sizeMatch = RegExp(r'^(\S+)').firstMatch(storageLine);
      return sizeMatch?.group(1);
    }
    return null;
  }

  Future<int> _fetchOrphanCount() async {
    final autoremoveResult = await _brewService.runCustom(['autoremove', '--dry-run']);
    if (autoremoveResult.exitCode == 0) {
      final lines = autoremoveResult.stdout.trim().split('\n');
      // ignore empty lines or specific header lines
      final orphanLines = lines.where((line) => 
          line.trim().isNotEmpty && !line.startsWith('Would remove:')).toList();
      return orphanLines.length;
    }
    return 0;
  }

  int _calculateHealthScore(int orphans) {
    int health = 100 - (orphans * 2);
    return health < 0 ? 0 : health;
  }

  void selectPackage(dynamic package) {
    emitState(state.copyWith(selectedPackage: package));
  }
}
