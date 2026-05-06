import 'dart:io';

import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/enums/os_support_filter.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/packages/models/packages_effect.dart';
import 'package:bartender/features/packages/models/packages_state.dart';

class PackagesViewModel extends BaseViewModel<PackagesState, PackagesEffect> {
  final HomebrewRepository _homebrewRepository;
  final PackageRepository _packageRepository;

  static const AnalyticsPeriod _analyticsPeriod = AnalyticsPeriod.days30;

  bool _isProcessingQueue = false;

  int _currentPaginationOffset = 0;
  static const int _paginationChunkSize = 50;
  bool _isLoadingMore = false;

  PackagesViewModel(this._homebrewRepository, this._packageRepository)
    : super(
        PackagesState(
          osSupport: Platform.isMacOS
              ? OsSupportFilter.macOS
              : (Platform.isLinux
                    ? OsSupportFilter.linux
                    : OsSupportFilter.all),
        ),
      );

  // --- Initialization & Data Fetching ---

  Future<void> fetchData() async {
    emitState(state.copyWith(trendingData: const FetchState.loading()));
    try {
      final isDbEmpty = await _homebrewRepository.isDatabaseEmpty();
      if (isDbEmpty) {
        await _handleInitialColdStart();
      } else {
        await _handleWarmStart();
      }
    } catch (error) {
      emitState(
        state.copyWith(trendingData: FetchState.error(error.toString())),
      );
    }
  }

  Future<void> _handleInitialColdStart() async {
    await _syncRemoteData();
    await _fetchInitialData();
  }

  Future<void> _handleWarmStart() async {
    await _fetchInitialData();
    _startBackgroundSync();
  }

  void _startBackgroundSync() {
    emitState(state.copyWith(isSyncingBackground: true));
    _syncRemoteData()
        .then((_) async {
          await _refreshListings();
          emitState(state.copyWith(isSyncingBackground: false));
        })
        .catchError((error) {
          // Silently swallow or log network errors during background sync
          emitState(state.copyWith(isSyncingBackground: false));
        });
  }

  Future<void> _syncRemoteData() async {
    await _homebrewRepository.syncAllData();
  }

  Future<void> _fetchInitialData() async {
    _currentPaginationOffset = 0;

    final chunkedTrending = await _getTrendingData();

    final initialChunk = await _homebrewRepository.getFilteredPackages(
      query: state.searchQuery,
      type: state.packageType,
      osSupport: state.osSupport,
      limit: _paginationChunkSize,
      offset: _currentPaginationOffset,
    );

    _currentPaginationOffset += initialChunk.length;

    emitState(
      state.copyWith(
        trendingData: FetchState.success(chunkedTrending),
        paginatedPackages: initialChunk,
      ),
    );
  }

  // --- Pagination ---

  Future<void> loadMorePackages() async {
    if (_isLoadingMore) return;
    _isLoadingMore = true;

    try {
      final nextChunk = await _homebrewRepository.getFilteredPackages(
        query: state.searchQuery,
        type: state.packageType,
        osSupport: state.osSupport,
        limit: _paginationChunkSize,
        offset: _currentPaginationOffset,
      );

      if (nextChunk.isNotEmpty) {
        _currentPaginationOffset += nextChunk.length;
        emitState(
          state.copyWith(
            paginatedPackages: [...state.paginatedPackages, ...nextChunk],
          ),
        );
      }
    } finally {
      _isLoadingMore = false;
    }
  }

  void truncateForScrollToTop() {
    if (state.paginatedPackages.length <= _paginationChunkSize) return;

    final truncated = state.paginatedPackages
        .take(_paginationChunkSize)
        .toList();
    _currentPaginationOffset = _paginationChunkSize;

    emitState(state.copyWith(paginatedPackages: truncated));
  }

  // --- Trending Data ---

  Future<List<List<dynamic>>> _getTrendingData() async {
    final formulaTrending = await _homebrewRepository.getTrendingFormulae(
      _analyticsPeriod,
      limit: 20,
    );
    final caskTrending = await _homebrewRepository.getTrendingCasks(
      _analyticsPeriod,
      limit: 20,
    );

    final allTrending = _mergeAndSortTrending(formulaTrending, caskTrending);

    return _chunkTrending(allTrending);
  }

  List<dynamic> _mergeAndSortTrending(
    List<dynamic> formulaTrending,
    List<dynamic> caskTrending,
  ) {
    final allTrending = <dynamic>[...formulaTrending, ...caskTrending];
    allTrending.sort((a, b) {
      final aInstalls = _getInstalls(a);
      final bInstalls = _getInstalls(b);
      return bInstalls.compareTo(aInstalls);
    });
    return allTrending;
  }

  List<List<dynamic>> _chunkTrending(List<dynamic> topTrending) {
    final chunkSize = 4;
    final chunkedTrending = <List<dynamic>>[];
    for (var i = 0; i < topTrending.length; i += chunkSize) {
      final end = (i + chunkSize < topTrending.length)
          ? i + chunkSize
          : topTrending.length;
      chunkedTrending.add(topTrending.sublist(i, end));
    }
    return chunkedTrending;
  }

  int _getInstalls(dynamic item) {
    if (item is FormulaModel) {
      return switch (_analyticsPeriod) {
        AnalyticsPeriod.days30 => item.installs30d ?? 0,
        AnalyticsPeriod.days90 => item.installs90d ?? 0,
        AnalyticsPeriod.days365 => item.installs365d ?? 0,
      };
    }
    if (item is CaskModel) {
      return switch (_analyticsPeriod) {
        AnalyticsPeriod.days30 => item.installs30d ?? 0,
        AnalyticsPeriod.days90 => item.installs90d ?? 0,
        AnalyticsPeriod.days365 => item.installs365d ?? 0,
      };
    }
    return 0;
  }

  // --- Queue Operations ---

  void queueInstall(String packageId, PackageType type) {
    final newOperation = OperationTask(
      packageId: packageId,
      type: type,
      status: OperationStatus.queued,
    );

    emitState(
      state.copyWith(operationsQueue: [...state.operationsQueue, newOperation]),
    );

    _processQueue();
  }

  Future<void> _processQueue() async {
    if (_isProcessingQueue) return;
    _isProcessingQueue = true;

    try {
      while (_hasQueuedOperations()) {
        await _processNextOperation();
      }
    } finally {
      _isProcessingQueue = false;
    }
  }

  bool _hasQueuedOperations() =>
      state.operationsQueue.any((op) => op.status == OperationStatus.queued);

  Future<void> _processNextOperation() async {
    final queuedIndex = state.operationsQueue.indexWhere(
      (op) => op.status == OperationStatus.queued,
    );

    if (queuedIndex == -1) return;

    final operation = state.operationsQueue[queuedIndex];
    _updateOperationStatus(queuedIndex, OperationStatus.inProgress);

    try {
      await _packageRepository.install(
        operation.packageId,
        isCask: operation.type == PackageType.cask,
      );

      _updateOperationStatus(queuedIndex, OperationStatus.success);
      await _refreshListings();
    } catch (e) {
      _updateOperationStatus(
        queuedIndex,
        OperationStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void _updateOperationStatus(
    int index,
    OperationStatus status, {
    String? errorMessage,
  }) {
    final updatedQueue = List<OperationTask>.from(state.operationsQueue);
    updatedQueue[index] = updatedQueue[index].copyWith(
      status: status,
      errorMessage: errorMessage,
    );
    emitState(state.copyWith(operationsQueue: updatedQueue));
  }

  Future<void> _refreshListings({bool clearExisting = false}) async {
    _currentPaginationOffset = 0;

    if (clearExisting) {
      truncateForScrollToTop();
    }

    final initialChunk = await _homebrewRepository.getFilteredPackages(
      query: state.searchQuery,
      type: state.packageType,
      osSupport: state.osSupport,
      limit: _paginationChunkSize,
      offset: _currentPaginationOffset,
    );
    _currentPaginationOffset += initialChunk.length;

    emitState(state.copyWith(paginatedPackages: initialChunk));
  }

  // --- Filtering & Searching ---

  void setSearchQuery(String query) {
    if (state.searchQuery == query) return;
    emitState(state.copyWith(searchQuery: query));
    _refreshListings(clearExisting: true);
  }

  void setPackageType(PackageTypeFilter type) {
    if (state.packageType == type) return;
    emitState(state.copyWith(packageType: type));
    _refreshListings(clearExisting: true);
  }

  void setOsSupport(OsSupportFilter osSupport) {
    if (state.osSupport == osSupport) return;
    emitState(state.copyWith(osSupport: osSupport));
    _refreshListings(clearExisting: true);
  }

  // --- UI State & Helpers ---

  void togglePackageExpansion(String id) {
    if (state.expandedPackageId == id) {
      emitState(state.copyWith(expandedPackageId: null));
    } else {
      emitState(state.copyWith(expandedPackageId: id));
    }
  }

  List<String> getDependencies(dynamic item) {
    if (item is FormulaModel) {
      return item.dependencies;
    } else if (item is CaskModel) {
      final dependencies = <String>[];
      if (item.dependsOn != null) {
        if (item.dependsOn!['cask'] is List) {
          dependencies.addAll((item.dependsOn!['cask'] as List).cast<String>());
        }
        if (item.dependsOn!['formula'] is List) {
          dependencies.addAll(
            (item.dependsOn!['formula'] as List).cast<String>(),
          );
        }
      }
      return dependencies;
    }
    return [];
  }
}
