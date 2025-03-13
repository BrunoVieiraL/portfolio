import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';

// Stub para o TickerProvider necessário para o TabController
class TickerProviderStub extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

void main() {
  late FlutterHomeViewModel homeViewModel;
  late TickerProviderStub tickerProvider;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    tickerProvider = TickerProviderStub();
    homeViewModel = FlutterHomeViewModel();
    homeViewModel.initControllers(tickerProvider);
  });

  tearDown(() {
    homeViewModel.tabController.dispose();
    homeViewModel.pageController.dispose();
  });

  group('FlutterHomeViewModel Navigation Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: PageView(
          controller: homeViewModel.pageController,
          children: const [
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      );
    }

    testWidgets('should update page index correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      homeViewModel.updateCurrentPageIndex(1);
      await tester.pumpAndSettle();

      expect(homeViewModel.tabController.index, equals(1));
      expect(homeViewModel.pageController.page, equals(1.0));
    });

    testWidgets('should notify listeners when page changes',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      var notified = false;
      homeViewModel.addListener(() => notified = true);

      homeViewModel.updateCurrentPageIndex(1);
      await tester.pumpAndSettle();

      expect(notified, isTrue);
    });

    testWidgets('should handle circular navigation',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Indo para última página
      homeViewModel.updateCurrentPageIndex(2);
      await tester.pumpAndSettle();
      expect(homeViewModel.tabController.index, equals(2));
      expect(homeViewModel.pageController.page, equals(2.0));

      // Indo para primeira página
      homeViewModel.updateCurrentPageIndex(0);
      await tester.pumpAndSettle();
      expect(homeViewModel.tabController.index, equals(0));
      expect(homeViewModel.pageController.page, equals(0.0));
    });
  });
}
