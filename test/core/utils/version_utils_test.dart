import 'package:flutter_test/flutter_test.dart';
import 'package:bartender/core/utils/version_utils.dart';

void main() {
  group('VersionUtils', () {
    test('isRemoteNewer returns true when remote is strictly newer', () {
      expect(VersionUtils.isRemoteNewer('4.2.0', '4.3.0'), isTrue);
      expect(VersionUtils.isRemoteNewer('v4.2.0', '4.3.0'), isTrue);
      expect(VersionUtils.isRemoteNewer('4.2', '4.3.0'), isTrue);
      expect(VersionUtils.isRemoteNewer('4.3.0', '5.0.0'), isTrue);
    });

    test('isRemoteNewer returns false when remote is older or equal', () {
      expect(VersionUtils.isRemoteNewer('4.3.0', '4.2.0'), isFalse);
      expect(VersionUtils.isRemoteNewer('4.3.0', '4.3.0'), isFalse);
      expect(VersionUtils.isRemoteNewer('v4.3.0', 'v4.3.0'), isFalse);
      expect(VersionUtils.isRemoteNewer('4.3.1', '4.3'), isFalse);
    });

    test('isRemoteNewer handles empty strings gracefully', () {
      expect(VersionUtils.isRemoteNewer('', '4.3.0'), isFalse);
      expect(VersionUtils.isRemoteNewer('4.2.0', ''), isFalse);
      expect(VersionUtils.isRemoteNewer('', ''), isFalse);
    });
  });
}
