import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/pref_keys.dart';

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> setLanguageCode(String languageCode) async =>
      await _preferences.setString(SharedPrefKeys.languageCode, languageCode);

  String get languageCode =>
      _preferences.getString(SharedPrefKeys.languageCode);

  Future<void> setCountryCode(String countryCode) async =>
      await _preferences.setString(SharedPrefKeys.countryCode, countryCode);

  String get countryCode => _preferences.getString(SharedPrefKeys.countryCode);

  Future<void> setDarkModeInfo(bool isDarkModeEnabled) async =>
      await _preferences.setBool(SharedPrefKeys.theme, isDarkModeEnabled);

  bool get isDarkModeEnabled => _preferences.getBool(SharedPrefKeys.theme);
}
