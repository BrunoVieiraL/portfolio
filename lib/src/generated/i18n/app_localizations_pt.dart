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
