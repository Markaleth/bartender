import 'package:flutter_test/flutter_test.dart';
import 'package:bartender/features/home/models/home_state.dart';
import 'package:bartender/features/home/view_models/home_view_model.dart';

void main() {
  group('HomeViewModel Tests', () {
    late HomeViewModel viewModel;

    setUp(() {
      viewModel = HomeViewModel();
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
