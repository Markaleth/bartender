import 'package:bartender/core/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parseTapName', () {
    expect(StringUtils.parseTapName("https://github.com/mongodb/homebrew-brew#"), "mongodb/brew");
  });
}
