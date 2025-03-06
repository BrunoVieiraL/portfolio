import 'package:flutter/material.dart';
import 'package:portfolio/config/assets.dart';
import '../../core/localization/localization.dart';
import '../../core/theme/themes.dart';

class FlutterHomeViewModel extends ChangeNotifier {
  late TabController tabController;

  late PageController pageController;

  ThemeData _currentTheme = AppTheme.darkTheme;
  ThemeData get currentTheme => _currentTheme;
  set changeCurrentTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  bool isDark = true;

  final List<Locale> supportedLocales = [
    AppLocalization.br,
    AppLocalization.en,
    AppLocalization.es,
  ];

  Locale _currentLocale = AppLocalization.br;
  Locale get currentLocale => _currentLocale;
  set changeCurrentLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }

  void updateCurrentPageIndex(int index) {
    tabController.index = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  List<String> toolsIcons = [
    Assets.flutter,
    Assets.dart,
    Assets.git,
    Assets.github,
    Assets.postman,
    Assets.codemagic,
    Assets.figma,
    Assets.gcp,
  ];
}
