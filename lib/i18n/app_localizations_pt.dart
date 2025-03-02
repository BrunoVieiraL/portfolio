// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get language => 'PT';

  @override
  String get contactMe => 'Contact Me';

  @override
  String get headerRole => 'Mobile Developer | Flutter Developer';

  @override
  String get aboutMeCardTitle => 'About Me';

  @override
  String get aboutMeCardText => 'Hi! I’m Bruno, I\'ve been working with Flutter in the past 3 years. Flutter is one of my passions as developer and my main focus is delivery beautiful, fast and multi platforms applications with it, delivering features quick along with a clean and simple code to understand.';

  @override
  String get experienceCardTitle => 'Experiences';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get language => 'BR';

  @override
  String get contactMe => 'Contate-me';

  @override
  String get headerRole => 'Desenvolvedor Mobile | Desenvolvedor Flutter';

  @override
  String get aboutMeCardTitle => 'Sobre Mim';

  @override
  String get aboutMeCardText => 'Olá! Eu sou o Bruno, trabalho com Flutter há 3 anos. Flutter é uma das minhas paixões como desenvolvedor e meu foco principal é entregar aplicativos bonitos, rápidos e multiplataforma com ele, entregando recursos rapidamente junto com um código limpo e simples de entender.';

  @override
  String get experienceCardTitle => 'Experiências';
}
