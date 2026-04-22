import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bartender/utils/ansi_parser.dart';

void main() {
  test('Parses plain text', () {
    final spans = AnsiParser.parse('hello world');
    expect(spans.length, 1);
    expect(spans[0].text, 'hello world');
    expect(spans[0].style?.color, null);
  });

  test('Parses color code', () {
    final spans = AnsiParser.parse('\x1B[31mhello');
    expect(spans.length, 1);
    expect(spans[0].text, 'hello');
    expect(spans[0].style?.color, Colors.red);
  });

  test('Parses multiple styles', () {
    final spans = AnsiParser.parse('\x1B[1;32msuccess\x1B[0m done');
    expect(spans.length, 2);
    expect(spans[0].text, 'success');
    expect(spans[0].style?.color, Colors.green);
    expect(spans[0].style?.fontWeight, FontWeight.bold);
    
    expect(spans[1].text, ' done');
    expect(spans[1].style?.color, null);
    expect(spans[1].style?.fontWeight, null);
  });
}
