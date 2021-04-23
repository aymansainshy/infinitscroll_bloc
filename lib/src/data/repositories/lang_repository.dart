import 'package:flutter/material.dart';

import '../shared_prefrences/preferences_config.dart';
import '../shared_prefrences/preferences_util.dart';
import 'package:infinit_scroll/src/lang/translate.dart';

class LanguageRepository {
  static String translate(BuildContext context, String text) {
    return Translate.of(context).translate(text);
  }

  static String getLanguage() {
    return PreferencesUtils.getString(Preferences.language);
  }
}
