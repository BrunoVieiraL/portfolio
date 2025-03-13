import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/ui/core/theme/platform_handler.dart';

void main() {
  group('PlatformHandler Platform Tests', () {
    test('should correctly identify Android platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      expect(PlatformHandler.isAndroid, isTrue);
      expect(PlatformHandler.isIOS, isFalse);
      expect(PlatformHandler.isMobile, isTrue);
    });

    test('should correctly identify iOS platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      expect(PlatformHandler.isAndroid, isFalse);
      expect(PlatformHandler.isIOS, isTrue);
      expect(PlatformHandler.isMobile, isTrue);
    });

    test('should correctly identify non-mobile platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      expect(PlatformHandler.isAndroid, isFalse);
      expect(PlatformHandler.isIOS, isFalse);
      expect(PlatformHandler.isMobile, isFalse);
    });

    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
    });
  });

  group('PlatformHandler Responsive Tests', () {
    testWidgets('should correctly identify compact layout',
        (WidgetTester tester) async {
      // Configura um tamanho de tela compacto
      tester.view.physicalSize = Size(599, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      bool? isCompact;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              isCompact = PlatformHandler.compact(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(isCompact, isTrue);
    });

    testWidgets('should correctly identify non-compact layout',
        (WidgetTester tester) async {
      // Configura um tamanho de tela não compacto
      tester.view.physicalSize = Size(601, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      bool? isCompact;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              isCompact = PlatformHandler.compact(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(isCompact, isFalse);
    });

    testWidgets('should correctly identify extra large layout',
        (WidgetTester tester) async {
      // Configura um tamanho de tela extra grande
      tester.view.physicalSize = Size(1600, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      bool? isExtraLarge;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              isExtraLarge = PlatformHandler.extraLarge(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(isExtraLarge, isTrue);
    });
  });
}
