import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wizarding_world/lib.dart';

void main() {
  late ThemeData? themeData;

  setUp(() {
    themeData = theme();
  });

  tearDown(() {
    themeData = null;
  });

  group('App theme', () {
    test('scaffold background color is white', () {
      expect(
        themeData?.scaffoldBackgroundColor,
        equals(Colors.white),
      );
    });

    test('"Quicksand" font family is set', () {
      expect(
        themeData?.textTheme.bodyMedium?.fontFamily,
        equals('Quicksand'),
      );
    });
  });

  group('AppBar theme', () {
    test('AppBar theme correctly defined', () {
      final AppBarTheme? barData = themeData?.appBarTheme;

      expect(
        barData?.backgroundColor,
        equals(Colors.white),
      );

      expect(
        barData?.elevation,
        equals(0),
      );

      expect(barData?.centerTitle, isTrue);
    });
  });
}
