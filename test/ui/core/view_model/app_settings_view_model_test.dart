import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/ui/core/localization/localization.dart';
import 'package:portfolio/ui/core/theme/themes.dart';
import 'package:portfolio/ui/core/view_model/app_settings_view_model.dart';

void main() {
  late AppSettingsViewModel settingsViewModel;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    settingsViewModel = AppSettingsViewModel();
  });

  group('AppSettingsViewModel Theme Tests', () {
    test('should start with dark theme', () {
      expect(settingsViewModel.currentTheme, equals(AppTheme.darkTheme));
      expect(settingsViewModel.isDark, isTrue);
    });

    test('should change theme correctly', () {
      settingsViewModel.isDark = false;
      expect(settingsViewModel.currentTheme, equals(AppTheme.lightTheme));
      expect(settingsViewModel.isDark, isFalse);
    });

    test('should notify listeners when theme changes', () {
      var notified = false;
      settingsViewModel.addListener(() => notified = true);

      settingsViewModel.isDark = false;

      expect(notified, isTrue);
    });
  });

  group('AppSettingsViewModel Locale Tests', () {
    test('should start with PT-BR locale', () {
      expect(settingsViewModel.currentLocale, equals(AppLocalization.br));
    });

    test('should change locale correctly', () {
      settingsViewModel.currentLocale = AppLocalization.en;
      expect(settingsViewModel.currentLocale, equals(AppLocalization.en));

      settingsViewModel.currentLocale = AppLocalization.es;
      expect(settingsViewModel.currentLocale, equals(AppLocalization.es));
    });

    test('should notify listeners when locale changes', () {
      var notified = false;
      settingsViewModel.addListener(() => notified = true);

      settingsViewModel.currentLocale = AppLocalization.en;

      expect(notified, isTrue);
    });

    test('should have all supported locales', () {
      expect(settingsViewModel.supportedLocales, contains(AppLocalization.br));
      expect(settingsViewModel.supportedLocales, contains(AppLocalization.en));
      expect(settingsViewModel.supportedLocales, contains(AppLocalization.es));
    });
  });
}
