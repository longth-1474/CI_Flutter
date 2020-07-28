import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<String, dynamic> language;

class Language {
  final Locale _locale;

  Language(this._locale);

  static Language of(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  String getText(String key) => language[key] ?? "$key not found";

  String get currentLanguage => _locale.languageCode;
}

class LanguageDelegate extends LocalizationsDelegate<Language> {
  const LanguageDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<Language> load(Locale locale) async {
    String string = await rootBundle.loadString("assets/strings/${locale.languageCode}.json");
    language = json.decode(string);
    return SynchronousFuture<Language>(Language(locale));
  }

  @override
  bool shouldReload(LanguageDelegate old) => false;
}
