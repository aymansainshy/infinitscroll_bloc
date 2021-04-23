import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:infinit_scroll/src/lang/app_local_dalegate.dart';

class Translate {
  final Locale locale;

  Translate(this.locale);

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  static const LocalizationsDelegate<Translate> delegate = AppLocaleDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    Future<Map<String, dynamic>> loadJson() async {
      String content = await rootBundle
          .loadString("assets/lang/${locale.languageCode}.json");
      return jsonDecode(content);
    }

    final jsonMap = await loadJson();

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}
