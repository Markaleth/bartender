import 'package:flutter/material.dart';

class AnsiParser {
  /// Parses a string with ANSI escape codes into a list of TextSpans.
  static List<TextSpan> parse(String text) {
    final List<TextSpan> spans = [];
    // Matches ANSI escape codes, e.g., \x1B[31m, \x1b[1;32m
    final RegExp ansiRegex = RegExp(r'\x1B\[([0-9;]*)m');
    
    int currentPos = 0;
    Color? currentColor;
    FontWeight? currentFontWeight;
    
    Color? colorFromCode(int code) => switch (code) {
      30 => Colors.black,
      31 => Colors.red,
      32 => Colors.green,
      33 => Colors.yellow,
      34 => Colors.blue,
      35 => Colors.purple, // Magenta
      36 => Colors.cyan,
      37 => Colors.white,
      // Bright colors
      90 => Colors.grey,
      91 => Colors.redAccent,
      92 => Colors.greenAccent,
      93 => Colors.yellowAccent,
      94 => Colors.blueAccent,
      95 => Colors.purpleAccent,
      96 => Colors.cyanAccent,
      97 => Colors.white,
      _ => null,
    };

    final matches = ansiRegex.allMatches(text);
    for (final match in matches) {
      if (match.start > currentPos) {
        spans.add(TextSpan(
          text: text.substring(currentPos, match.start),
          style: TextStyle(
            color: currentColor,
            fontWeight: currentFontWeight,
          ),
        ));
      }
      
      final codeString = match.group(1) ?? '';
      if (codeString.isEmpty || codeString == '0') {
        // Reset all styles
        currentColor = null;
        currentFontWeight = null;
      } else {
        final codes = codeString.split(';');
        for (final codeStr in codes) {
          final code = int.tryParse(codeStr);
          if (code == null) continue;
          
          switch (code) {
            case 1: currentFontWeight = FontWeight.bold;
            case 22: currentFontWeight = FontWeight.normal;
            case 39: currentColor = null; // Reset text color to default
            default:
              final color = colorFromCode(code);
              if (color != null) currentColor = color;
          }
        }
      }
      
      currentPos = match.end;
    }
    
    if (currentPos < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentPos),
        style: TextStyle(
          color: currentColor,
          fontWeight: currentFontWeight,
        ),
      ));
    }
    
    return spans;
  }
}
