import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:taekwondo/l10n/app_localizations.dart';

class L10n {
  static AppLocalizations localizations(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static List<LocalizationsDelegate<dynamic>> localizationsDelegates() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  static List<Locale> supportedLocales() {
    return [
      Locale('en'), // English
      Locale('id'), // Bahasa
    ];
  }
}
