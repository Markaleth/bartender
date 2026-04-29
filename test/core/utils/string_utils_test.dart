import 'package:bartender/core/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringUtils', () {
    test('formatDownloads formats thousands correctly', () {
      expect(StringUtils.formatDownloads(242095), '242k');
      expect(StringUtils.formatDownloads(1000), '1k');
      expect(StringUtils.formatDownloads(999999), '999k');
    });

    test('formatDownloads formats millions correctly', () {
      expect(StringUtils.formatDownloads(1000000), '1m');
      expect(StringUtils.formatDownloads(1500000), '1.5m');
      expect(StringUtils.formatDownloads(1550000), '1.6m');
    });

    test('formatDownloads handles numbers under 1000', () {
      expect(StringUtils.formatDownloads(999), '999');
      expect(StringUtils.formatDownloads(0), '0');
      expect(StringUtils.formatDownloads(42), '42');
    });

    test('formatDownloads handles null gracefully', () {
      expect(StringUtils.formatDownloads(null), null);
    });
  });
}
