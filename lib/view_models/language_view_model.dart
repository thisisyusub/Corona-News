import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/services/shared_preferences_service.dart';
import '../utils/constants/language_keys.dart';
import '../presentation/shared/supported_locales.dart';

class LanguageViewModel with ChangeNotifier {
  Locale _appLocale;

  Locale get appLocale => _appLocale;

  Future<void> fetchLocale() async {
    final sharedPrefService = await SharedPreferencesService.instance;
    final currentLanguageCode = sharedPrefService.languageCode;

    if (currentLanguageCode == null) {
      _loadLocale(sharedPrefService, supportedLocales[1], false);
    } else {
      final currentCountryCode = sharedPrefService.countryCode;
      _appLocale = Locale(currentLanguageCode, currentCountryCode);
    }
  }

  void changeLanguage(String selectedLanguage) async {
    final sharedPrefService = await SharedPreferencesService.instance;

    if (_appLocale.languageCode == selectedLanguage) return;

    if (selectedLanguage == LanguageKeys.az) {
      _loadLocale(sharedPrefService, supportedLocales[0]);
    } else if (selectedLanguage == LanguageKeys.en) {
      _loadLocale(sharedPrefService, supportedLocales[1]);
    }
  }

  Future<void> _loadLocale(
      SharedPreferencesService sharedPrefService, Locale locale,
      [bool notify = true]) async {
    _appLocale = locale;
    await sharedPrefService.setLanguageCode(_appLocale.languageCode);
    await sharedPrefService.setCountryCode(_appLocale.countryCode);

    if (notify) notifyListeners();
  }
}
