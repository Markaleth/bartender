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
    
    Color? colorFromCode(int code) {
      switch (code) {
        case 30: return Colors.black;
        case 31: return Colors.red;
        case 32: return Colors.green;
        case 33: return Colors.yellow;
        case 34: return Colors.blue;
        case 35: return Colors.purple; // Magenta
        case 36: return Colors.cyan;
        case 37: return Colors.white;
        // Bright colors
        case 90: return Colors.grey;
        case 91: return Colors.redAccent;
        case 92: return Colors.greenAccent;
        case 93: return Colors.yellowAccent;
        case 94: return Colors.blueAccent;
        case 95: return Colors.purpleAccent;
        case 96: return Colors.cyanAccent;
        case 97: return Colors.white;
        default: return null;
      }
    }

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
          
          if (code == 1) {
            currentFontWeight = FontWeight.bold;
          } else if (code == 22) {
            currentFontWeight = FontWeight.normal;
          } else if ((code >= 30 && code <= 37) || (code >= 90 && code <= 97)) {
            currentColor = colorFromCode(code);
          } else if (code == 39) {
            currentColor = null; // Reset text color to default
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
