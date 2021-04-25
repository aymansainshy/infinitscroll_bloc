import 'package:flutter/material.dart';
import 'package:infinit_scroll/src/lang/app_lang.dart';
import 'package:infinit_scroll/src/lang/app_localazation.dart';

class AppLocaleDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLanguage.supportLanguage.contains(locale);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localizations = AppLocalization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocaleDelegate old) => false;
}
