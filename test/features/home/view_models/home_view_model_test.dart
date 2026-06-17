import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bartender/features/home/models/home_state.dart';
import 'package:bartender/features/home/view_models/home_view_model.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';

class MockHomebrewRepository extends Mock implements HomebrewRepository {}

void main() {
  group('HomeViewModel Tests', () {
    late HomeViewModel viewModel;
    late TapFilterNotifier notifier;
    late MockHomebrewRepository mockRepository;

    setUp(() {
      notifier = TapFilterNotifier();
      mockRepository = MockHomebrewRepository();
      viewModel = HomeViewModel(notifier, mockRepository);
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
