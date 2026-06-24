import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bartender/features/home/models/home_state.dart';
import 'package:bartender/features/home/view_models/home_view_model.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';

class MockHomebrewRepository extends Mock implements HomebrewRepository {}
class MockQueueViewModel extends Mock implements QueueViewModel {}
class MockSystemStatusNotifier extends Mock implements SystemStatusNotifier {}
class MockPackageRepository extends Mock implements PackageRepository {}

void main() {
  group('HomeViewModel Tests', () {
    late HomeViewModel viewModel;
    late TapFilterNotifier notifier;
    late MockHomebrewRepository mockRepository;
    late MockQueueViewModel mockQueueViewModel;
    late MockSystemStatusNotifier mockSystemStatusNotifier;
    late MockPackageRepository mockPackageRepository;

    setUp(() {
      notifier = TapFilterNotifier();
      mockRepository = MockHomebrewRepository();
      mockQueueViewModel = MockQueueViewModel();
      mockSystemStatusNotifier = MockSystemStatusNotifier();
      mockPackageRepository = MockPackageRepository();
      
      when(() => mockSystemStatusNotifier.value).thenReturn(null);

      viewModel = HomeViewModel(
        notifier,
        mockRepository,
        mockQueueViewModel,
        mockSystemStatusNotifier,
        mockPackageRepository,
      );
    });

    test('Initial State should be HomeTab.browse', () {
      expect(viewModel.state.selectedTab, HomeTab.browse);
    });

    test('setTab(HomeTab.library) correctly updates the state', () {
      viewModel.setTab(HomeTab.library);
      expect(viewModel.state.selectedTab, HomeTab.library);
    });
  });
}

