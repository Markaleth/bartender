import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/core/models/package_operations/package_operation.dart';
import 'package:bartender/data/models/analytics/category/category_analytics_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/packages/models/packages_effect.dart';
import 'package:bartender/features/packages/models/packages_state.dart';

class PackagesViewModel extends BaseViewModel<PackagesState, PackagesEffect> {
  final HomebrewRepository _homebrewRepository;
  final PackageRepository _packageRepository;

  static const String _formulaeAnalyticsCategory = 'install-on-request';
  static const String _analyticsPeriod = '30d';

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
    await Future.wait([
      _homebrewRepository.syncFormulae(),
      _homebrewRepository.syncCasks(),
      _homebrewRepository.syncFormulaeAnalytics(
        _formulaeAnalyticsCategory,
        _analyticsPeriod,
      ),
      _homebrewRepository.syncCasksAnalytics(_analyticsPeriod),
      _homebrewRepository.syncCategoryAnalytics(
        _formulaeAnalyticsCategory,
        _analyticsPeriod,
      ),
    ]);
  }

  Future<void> _fetchLocalData() async {
    final futures = await Future.wait([
      _homebrewRepository.getAllFormulae(),
      _homebrewRepository.getAllCasks(),
      _homebrewRepository.getCategoryAnalytics(
        _formulaeAnalyticsCategory,
        _analyticsPeriod,
      ),
    ]);

    final formulae = futures[0] as List<FormulaModel>;
    final casks = futures[1] as List<CaskModel>;
    final trending = futures[2] as List<CategoryAnalyticsItem>;

    emitState(
      state.copyWith(
        formulaeData: FetchState.success(formulae),
        casksData: FetchState.success(casks),
        trendingData: FetchState.success(trending),
      ),
    );
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
