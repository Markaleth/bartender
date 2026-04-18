import 'package:bartender/theme/bartender_layout.dart';
import 'package:flutter/material.dart';

class BartenderTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: BartenderColors.primary,
      scaffoldBackgroundColor: BartenderColors.background,
      
      colorScheme: const ColorScheme.dark(
        primary: BartenderColors.primary,
        secondary: BartenderColors.secondary,
        surface: BartenderColors.surface,
        error: BartenderColors.error,
        onPrimary: BartenderColors.onPrimary,
        onSecondary: BartenderColors.onSecondary,
        onSurface: BartenderColors.onSurface,
      ),
      textTheme: _textTheme(ThemeData.dark().textTheme),
      cardTheme: CardThemeData(
        color: BartenderColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: BartenderColors.primary,
          foregroundColor: BartenderColors.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }

  static TextTheme _textTheme(TextTheme base) =>  const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: BartenderColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: BartenderColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: BartenderColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: BartenderColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: BartenderColors.textSecondary,
        ),
          labelLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: BartenderColors.textSecondary,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: BartenderColors.textTertiary,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: BartenderColors.textTertiary,
        ),
      );
}


