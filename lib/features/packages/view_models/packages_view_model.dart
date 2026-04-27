import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/core/models/package_operations/package_operation.dart';
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

  PackagesViewModel(this._homebrewRepository, this._packageRepository)
    : super(const PackagesState());

  Future<void> fetchData() async {
    _setLoadingState();
    try {
      await _syncRemoteData();
      await _fetchLocalData();
    } catch (error) {
      _setErrorState(error.toString());
    }
  }

  void _setLoadingState() {
    emitState(
      state.copyWith(
        formulaeData: const FetchState.loading(),
        casksData: const FetchState.loading(),
        trendingData: const FetchState.loading(),
      ),
    );
  }

  void _setErrorState(String errorMessage) {
    emitState(
      state.copyWith(
        formulaeData: FetchState.error(errorMessage),
        casksData: FetchState.error(errorMessage),
        trendingData: FetchState.error(errorMessage),
      ),
    );
  }

  Future<void> _syncRemoteData() async {
    await _homebrewRepository.syncAllData();
  }

  Future<void> _fetchLocalData() async {
    final formulae = await _homebrewRepository.getAllFormulae();
    final casks = await _homebrewRepository.getAllCasks();

    final formulaTrending = await _homebrewRepository.getTrendingFormulae(
      _analyticsPeriod,
      limit: 25,
    );
    final caskTrending = await _homebrewRepository.getTrendingCasks(
      _analyticsPeriod,
      limit: 25,
    );

    // Merge and sort by installs descending across both types
    final allTrending = <dynamic>[...formulaTrending, ...caskTrending];
    allTrending.sort((a, b) {
      final aInstalls = _getInstalls(a);
      final bInstalls = _getInstalls(b);
      return bInstalls.compareTo(aInstalls);
    });

    final topTrending = allTrending.take(50).toList();

    final chunkedTrending = <List<dynamic>>[];
    for (var i = 0; i < topTrending.length; i += 5) {
      final end = (i + 5 < topTrending.length) ? i + 5 : topTrending.length;
      chunkedTrending.add(topTrending.sublist(i, end));
    }

    emitState(
      state.copyWith(
        formulaeData: FetchState.success(formulae),
        casksData: FetchState.success(casks),
        trendingData: FetchState.success(chunkedTrending),
      ),
    );
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

  void queueInstall(String packageId, PackageType type) {
    final newOperation = PackageOperation(
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
    final updatedQueue = List<PackageOperation>.from(state.operationsQueue);
    updatedQueue[index] = updatedQueue[index].copyWith(
      status: status,
      errorMessage: errorMessage,
    );
    emitState(state.copyWith(operationsQueue: updatedQueue));
  }

  Future<void> _refreshListings() async {
    final formulae = await _homebrewRepository.getAllFormulae();
    final casks = await _homebrewRepository.getAllCasks();

    emitState(
      state.copyWith(
        formulaeData: FetchState.success(formulae),
        casksData: FetchState.success(casks),
      ),
    );
  }

  void setSearchQuery(String query) {
    emitState(state.copyWith(searchQuery: query));
  }
}
