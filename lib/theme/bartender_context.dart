import 'package:bartender/theme/bartender_layout.dart';
import 'package:flutter/material.dart';

extension BartenderContext on BuildContext {
  // --- Theme Access ---
  ThemeData get theme => Theme.of(this);
  TextTheme get tt => theme.textTheme;
  ColorScheme get cs => theme.colorScheme;

  // --- Typography Shorthand ---
  TextStyle? get headL => tt.headlineLarge;
  TextStyle? get headM => tt.headlineMedium;
  TextStyle? get bodyL  => tt.bodyLarge;
  TextStyle? get bodyM  => tt.bodyMedium;
  TextStyle? get labelS => tt.labelSmall;

  // --- Color Shorthand ---
  Color get primary   => cs.primary;
  Color get secondary => cs.secondary;
  Color get surface   => cs.surface;
  Color get error     => cs.error;

  // --- Spacing / Gaps ---
  // Vertical Gaps
  Widget get vSpacingS  => const SizedBox(height: BartenderLayout.s);
  Widget get vSpacingM  => const SizedBox(height: BartenderLayout.m);
  Widget get vSpacingL  => const SizedBox(height: BartenderLayout.l);

  // Horizontal Gaps
  Widget get hSpacingS  => const SizedBox(width: BartenderLayout.s);
  Widget get hSpacingM  => const SizedBox(width: BartenderLayout.m);

  // --- Padding & Radius ---
  EdgeInsets get paddingM => const EdgeInsets.all(BartenderLayout.m);
  BorderRadius get radiusL => BorderRadius.circular(BartenderRadius.l);
}