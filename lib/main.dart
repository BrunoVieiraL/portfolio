import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:portfolio/ui/core/view_model/app_settings_view_model.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';
import 'package:portfolio/ui/flutter_home/widgets/flutter_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FlutterHomeViewModel _homeViewModel;
  late final AppSettingsViewModel _settingsViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = FlutterHomeViewModel();
    _settingsViewModel = AppSettingsViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _settingsViewModel,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _settingsViewModel.currentTheme,
        home: FlutterHomeScreen(
          homeViewModel: _homeViewModel,
          settingsViewModel: _settingsViewModel,
        ),
        locale: _settingsViewModel.currentLocale,
        supportedLocales: _settingsViewModel.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
