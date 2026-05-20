import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bartender/common_widgets/package_icon/view_model/package_icon_view_model.dart';
import 'package:bartender/common_widgets/package_icon/state/package_icon_state.dart';
import 'package:bartender/services/icon_resolution/icon_resolution_service.dart';
import 'package:bartender/data/models/icon_cache/resolved_icon.dart';
import 'package:bartender/core/constants/durations.dart';

class MockIconResolutionService extends Mock implements IconResolutionService {}

void main() {
  group('PackageIconViewModel Tests', () {
    late MockIconResolutionService mockIconService;
    late PackageIconViewModel viewModel;

    late bool isDisposed;

    setUp(() {
      isDisposed = false;
      mockIconService = MockIconResolutionService();
      viewModel = PackageIconViewModel(mockIconService);
    });

    tearDown(() {
      if (!isDisposed) {
        viewModel.dispose();
        isDisposed = true;
      }
    });

    test('Initial State should be loading', () {
      expect(viewModel.state, const PackageIconState.loading());
    });

    test('Memory Cache: loadIcon should emit success state synchronously', () {
      final cachedIcon = ResolvedIcon(
        packageName: 'test',
        iconUrl: 'http://test.com/icon.png',
        isSvg: false,
        resolvedAt: DateTime.now(),
      );

      when(
        () => mockIconService.getMemoryCachedIcon('test'),
      ).thenReturn(cachedIcon);

      viewModel.loadIcon('test', 'http://test.com');

      expect(viewModel.state, PackageIconState.success(cachedIcon));
      verify(() => mockIconService.getMemoryCachedIcon('test')).called(1);
      verifyNever(() => mockIconService.getIcon(any(), any()));
    });

    test(
      'Network Debounce: loadIcon should wait before emitting success state',
      () async {
        final fetchedIcon = ResolvedIcon(
          packageName: 'test',
          iconUrl: 'http://test.com/icon.png',
          isSvg: false,
          resolvedAt: DateTime.now(),
        );

        when(
          () => mockIconService.getMemoryCachedIcon('test'),
        ).thenReturn(null);
        when(
          () => mockIconService.getIcon('test', 'http://test.com'),
        ).thenAnswer((_) async => fetchedIcon);

        viewModel.loadIcon('test', 'http://test.com');

        // Should still be loading immediately after call
        expect(viewModel.state, const PackageIconState.loading());

        // Wait for debounce duration
        await Future.delayed(
          packageIconDebounceDuration + const Duration(milliseconds: 50),
        );

        expect(viewModel.state, PackageIconState.success(fetchedIcon));
        verify(
          () => mockIconService.getIcon('test', 'http://test.com'),
        ).called(1);
      },
    );

    test(
      'Fallback: loadIcon should emit fallback state if icon resolution returns null',
      () async {
        when(
          () => mockIconService.getMemoryCachedIcon('test'),
        ).thenReturn(null);
        when(
          () => mockIconService.getIcon('test', 'http://test.com'),
        ).thenAnswer((_) async => null);

        viewModel.loadIcon('test', 'http://test.com');

        await Future.delayed(
          packageIconDebounceDuration + const Duration(milliseconds: 50),
        );

        expect(viewModel.state, const PackageIconState.fallback());
      },
    );

    test(
      'Dispose: ensure calling dispose prevents subsequent states',
      () async {
        final fetchedIcon = ResolvedIcon(
          packageName: 'test',
          iconUrl: 'http://test.com/icon.png',
          isSvg: false,
          resolvedAt: DateTime.now(),
        );

        when(
          () => mockIconService.getMemoryCachedIcon('test'),
        ).thenReturn(null);
        when(
          () => mockIconService.getIcon('test', 'http://test.com'),
        ).thenAnswer((_) async => fetchedIcon);

        viewModel.loadIcon('test', 'http://test.com');

        viewModel.dispose();
        isDisposed = true;

        // Wait for debounce duration
        await Future.delayed(
          packageIconDebounceDuration + const Duration(milliseconds: 50),
        );

        // Because it was disposed, state should remain loading
        expect(viewModel.state, const PackageIconState.loading());
        verifyNever(() => mockIconService.getIcon(any(), any()));
      },
    );
  });
}
