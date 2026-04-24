import 'package:flutter/material.dart';

extension BartenderContext on BuildContext {
  // --- Private Theme Access ---
  ThemeData get _theme => Theme.of(this);
  TextTheme get _tt => _theme.textTheme;

  // --- Typography Shorthand ---
  TextStyle get headL => _tt.headlineLarge!;
  TextStyle get headM => _tt.headlineMedium!;
  TextStyle get titleM => _tt.titleMedium!;
  TextStyle get bodyL => _tt.bodyLarge!;
  TextStyle get bodyM => _tt.bodyMedium!;
  TextStyle get labelL => _tt.labelLarge!;
  TextStyle get labelM => _tt.labelMedium!;
  TextStyle get labelS => _tt.labelSmall!;

  // --- Layout Shorthand ---
  double get windowWidth => MediaQuery.sizeOf(this).width;
  double get windowHeight => MediaQuery.sizeOf(this).height;
}
