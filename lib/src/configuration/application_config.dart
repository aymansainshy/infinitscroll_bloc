import 'package:infinit_scroll/src/lang/app_lang.dart';
import 'package:infinit_scroll/src/models/device.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static bool debug = true;
  static String version = '1.0.0';
  static SharedPreferences preferences;
  static Device device;
  static bool isEnglish = AppLanguage.defaultLanguage.languageCode == 'en';
  static String storagePath = '';
  // static User user = User();

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
