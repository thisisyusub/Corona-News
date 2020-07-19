/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:cubit/cubit.dart';
import '../../data/services/shared_preferences_service.dart';
import '../../utils/constants/language_keys.dart';
import '../../presentation/shared/supported_locales.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(Locale locale)
      : super(LocalizationState(locale ?? supportedLocales[0]));

  Future<void> changeLocale(String selectedLanguageCode) async {
    final sharedPrefService = await SharedPreferencesService.instance;
    final defaultLanguageCode = sharedPrefService.languageCode;

    if (selectedLanguageCode == defaultLanguageCode) return;

    if (selectedLanguageCode == LanguageKeys.az) {
      _loadLanguage(sharedPrefService, Locale('az', 'AZ'));
    } else if (selectedLanguageCode == LanguageKeys.en) {
      _loadLanguage(sharedPrefService, Locale('en', 'US'));
    } else if (selectedLanguageCode == LanguageKeys.ru) {
      _loadLanguage(sharedPrefService, Locale('ru', 'RU'));
    }
  }

  Future<Locale> loadDefaultLocale() async {
    final sharedPrefService = await SharedPreferencesService.instance;
    final defaultLanguageCode = sharedPrefService.languageCode;

    if (defaultLanguageCode == null) {
      _loadLanguage(sharedPrefService, supportedLocales[0], false);
      return supportedLocales[0];
    } else {
      final defaultCountryCode = sharedPrefService.countryCode;

      final defaultLocale = Locale(defaultLanguageCode, defaultCountryCode);

      _loadLanguage(sharedPrefService, defaultLocale, false);
      return defaultLocale;
    }
  }

  void _loadLanguage(
      SharedPreferencesService sharedPreferencesService, Locale locale,
      [bool notifyState = true]) async {
    await sharedPreferencesService.setLanguageCode(locale.languageCode);
    await sharedPreferencesService.setCountryCode(locale.countryCode);

    if (notifyState) emit(LocalizationState(locale));
  }
}
