import 'package:flutter/material.dart';

extension BartenderContext on BuildContext {
  // --- Theme Access ---
  ThemeData get theme => Theme.of(this);
  TextTheme get tt => theme.textTheme;
  ColorScheme get cs => theme.colorScheme;

  // --- Typography Shorthand ---
  TextStyle? get headL => tt.headlineLarge;
  TextStyle? get headM => tt.headlineMedium;
  TextStyle? get bodyL => tt.bodyLarge;
  TextStyle? get bodyM => tt.bodyMedium;
  TextStyle? get labelS => tt.labelSmall;
}
