import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bartender/features/home/models/home_state.dart';
import 'package:bartender/features/home/view_models/home_view_model.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/domain/services/homebrew_service.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';

class MockHomebrewService extends Mock implements HomebrewService {}

class MockQueueViewModel extends Mock implements QueueViewModel {}

class MockSystemStatusNotifier extends Mock implements SystemStatusNotifier {}

void main() {
  group('HomeViewModel Tests', () {
    late HomeViewModel viewModel;
    late TapFilterNotifier notifier;
    late MockHomebrewService mockService;
    late MockQueueViewModel mockQueueViewModel;
    late MockSystemStatusNotifier mockSystemStatusNotifier;

    setUp(() {
      notifier = TapFilterNotifier();
      mockService = MockHomebrewService();
      mockQueueViewModel = MockQueueViewModel();
      mockSystemStatusNotifier = MockSystemStatusNotifier();

      when(() => mockSystemStatusNotifier.value).thenReturn(null);

      viewModel = HomeViewModel(
        notifier,
        mockService,
        mockQueueViewModel,
        mockSystemStatusNotifier,
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
