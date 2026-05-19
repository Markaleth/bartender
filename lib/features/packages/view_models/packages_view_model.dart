import 'dart:io';

import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/features/packages/models/packages_effect.dart';
import 'package:bartender/features/packages/models/packages_state.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';

class PackagesViewModel extends BaseViewModel<PackagesState, PackagesEffect> {
  final HomebrewRepository _homebrewRepository;
  final PackageStatusNotifier _statusNotifier;
  final TapFilterNotifier _tapFilterNotifier;

  static const AnalyticsPeriod _analyticsPeriod = AnalyticsPeriod.days30;

  int _currentPaginationOffset = 0;
  static const int _paginationChunkSize = 50;
  bool _isLoadingMore = false;

  PackagesViewModel(
    this._homebrewRepository,
    this._statusNotifier,
    this._tapFilterNotifier,
  ) : super(
        PackagesState(
          packageType: Platform.isLinux
              ? PackageTypeFilter.formulae
              : PackageTypeFilter.all,
        ),
      ) {
    _statusNotifier.addListener(_onStatusNotifierUpdated);
    _tapFilterNotifier.addListener(_onTapFilterUpdated);
  }

  @override
  void dispose() {
    _statusNotifier.removeListener(_onStatusNotifierUpdated);
    _tapFilterNotifier.removeListener(_onTapFilterUpdated);
    super.dispose();
  }

  void _onTapFilterUpdated() {
    // Reset and fetch data with the new filter
    _fetchInitialData();
  }

  void _onStatusNotifierUpdated() {
    final update = _statusNotifier.value;
    if (update != null) {
      _onPackageStatusChanged(
        update.itemId,
        update.isInstalled,
        update.timestamp,
      );
    }
  }

  // --- Initialization & Data Fetching ---

  Future<void> init() async {
    emitState(state.copyWith(trendingData: const FetchState.loading()));
    try {
      await _fetchInitialData();
    } catch (error) {
      emitState(
        state.copyWith(trendingData: FetchState.error(error.toString())),
      );
    }
  }

  Future<void> _fetchInitialData() async {
    _currentPaginationOffset = 0;

    final chunkedTrending = await _getTrendingData();
    final taps = await _homebrewRepository.getTaps();

    final initialChunk = await _homebrewRepository.getFilteredPackages(
      query: state.searchQuery,
      type: state.packageType,
      limit: _paginationChunkSize,
      offset: _currentPaginationOffset,
      tapFilter: _tapFilterNotifier.selectedTap,
    );

    _currentPaginationOffset += initialChunk.length;

    emitState(
      state.copyWith(
        trendingData: FetchState.success(chunkedTrending),
        paginatedPackages: initialChunk,
        taps: taps,
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
        limit: _paginationChunkSize,
        offset: _currentPaginationOffset,
        tapFilter: _tapFilterNotifier.selectedTap,
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

  Future<void> _refreshListings({bool clearExisting = false}) async {
    _currentPaginationOffset = 0;

    if (clearExisting) {
      truncateForScrollToTop();
    }

    final initialChunk = await _homebrewRepository.getFilteredPackages(
      query: state.searchQuery,
      type: state.packageType,
      limit: _paginationChunkSize,
      offset: _currentPaginationOffset,
      tapFilter: _tapFilterNotifier.selectedTap,
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

  // --- UI State & Helpers ---
  DateTime? _lastUpdateTimestamp;

  void _onPackageStatusChanged(
    String packageId,
    bool isInstalled,
    DateTime timestamp,
  ) {
    if (_lastUpdateTimestamp == timestamp) return;
    _lastUpdateTimestamp = timestamp;

    final updatedList = _updatePackageListWithStatus(
      state.paginatedPackages,
      packageId,
      isInstalled,
    );

    emitState(state.copyWith(paginatedPackages: updatedList));
  }

  List<dynamic> _updatePackageListWithStatus(
    List<dynamic> packages,
    String packageId,
    bool isInstalled,
  ) {
    return packages.map((pkg) {
      if (pkg is FormulaModel && pkg.name == packageId) {
        return pkg.copyWith(isInstalled: isInstalled);
      } else if (pkg is CaskModel && pkg.token == packageId) {
        return pkg.copyWith(isInstalled: isInstalled);
      }
      return pkg;
    }).toList();
  }

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
