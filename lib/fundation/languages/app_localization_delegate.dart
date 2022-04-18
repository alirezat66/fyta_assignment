import 'package:flutter/material.dart';
import 'package:fyta_assignment/fundation/languages/language_en.dart';
import 'package:fyta_assignment/fundation/languages/language_ger.dart';
import 'package:fyta_assignment/fundation/languages/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      default:
        return LanguageGer();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
