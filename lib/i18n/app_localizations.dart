import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  ///
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get language;

  ///
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contactMe;

  ///
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer | Mobile Developer | Web Developer'**
  String get headerRole;

  ///
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMeCardTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'Hi! I’m Bruno, I\'ve been working with Flutter in the past 3 years. Flutter is one of my passions as developer and my main focus is delivery beautiful, fast and multi platforms applications with it, delivering features quick along with a clean and simple code to understand.'**
  String get aboutMeCardText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Experiences'**
  String get experienceCardTitle;

  ///
  ///
  /// In en, this message translates to:
  /// **'See on Linkedin'**
  String get experienceCardTooltip;

  ///
  ///
  /// In en, this message translates to:
  /// **'Role: '**
  String get experienceCardRoleLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Company: '**
  String get experienceCardEnterpriseLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Period: '**
  String get experienceCardDateLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get experienceCardRole;

  ///
  ///
  /// In en, this message translates to:
  /// **'Self-employed'**
  String get experienceCardEnterprise1;

  ///
  ///
  /// In en, this message translates to:
  /// **'nov 2021 - nov 2022'**
  String get experienceCardDate1;

  ///
  ///
  /// In en, this message translates to:
  /// **'One System Group'**
  String get experienceCardEnterprise2;

  ///
  ///
  /// In en, this message translates to:
  /// **'nov 2022 - fev 2025'**
  String get experienceCardDate2;

  ///
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get toolCardTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return AppLocalizationsPtBr();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
