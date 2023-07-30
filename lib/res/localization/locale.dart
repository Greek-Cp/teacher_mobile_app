import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static List<Locale> getSupportedLocales() {
    return [
      Locale('ar', ''), // Arabic
      Locale('en', ''), // English
    ];
  }

  static Future<void> load(Locale locale) async {
    final String localeName = Intl.canonicalizedLocale(locale.toString());

    Intl.defaultLocale = localeName;
  }

  static String getLocaleName(Locale locale) {
    return Intl.canonicalizedLocale(locale.toString());
  }

  static String? getGreeting() {
    return Intl.message(
      'greeting',
      name: 'getGreeting',
      desc: 'Greeting text',
    );
  }

  static String? getTitle() {
    return Intl.message(
      'title',
      name: 'getTitle',
      desc: 'App title',
    );
  }

  static String? getChangeLanguage() {
    return Intl.message(
      'changeLanguage',
      name: 'getChangeLanguage',
      desc: 'Change language text',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.getSupportedLocales().contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    await AppLocalizations.load(locale);
    return AppLocalizations();
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
