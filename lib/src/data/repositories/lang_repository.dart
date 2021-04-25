import 'package:flutter/material.dart';
import 'package:infinit_scroll/src/data/shared_preferences/preferences_config.dart';
import 'package:infinit_scroll/src/data/shared_preferences/preferences_util.dart';

import 'package:infinit_scroll/src/lang/app_localazation.dart';

class LanguageRepository {
  static String translate(BuildContext context, String text) {
    return AppLocalization.of(context).translate(text);
  }

  static String getLanguage() {
    return PreferencesUtils.getString(Preferences.language);
  }
}
