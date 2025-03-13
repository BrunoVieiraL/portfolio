import 'package:flutter/material.dart';
import '../localization/localization.dart';
import '../theme/themes.dart';

class AppSettingsViewModel extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.darkTheme;
  ThemeData get currentTheme => _currentTheme;
  set currentTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  bool get isDark => _currentTheme == AppTheme.darkTheme;
  set isDark(bool value) {
    currentTheme = value ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  final List<Locale> supportedLocales = [
    AppLocalization.br,
    AppLocalization.en,
    AppLocalization.es,
  ];

  Locale _currentLocale = AppLocalization.br;
  Locale get currentLocale => _currentLocale;
  set currentLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}
