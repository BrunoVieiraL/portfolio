import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/i18n/app_localizations.dart';
import 'package:portfolio/ui/flutter_home/view_model/flutter_home_view_model.dart';
import 'package:portfolio/ui/flutter_home/widgets/flutter_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    FlutterHomeViewModel viewModel = FlutterHomeViewModel();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: viewModel.currentTheme,
        home: FlutterHome(viewModel: viewModel),
        locale: viewModel.currentLocale,
        supportedLocales: viewModel.supportedLocales,
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
