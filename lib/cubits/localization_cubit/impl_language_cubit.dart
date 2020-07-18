import 'package:flutter/material.dart';

abstract class ILanguageCubit {
  Future<Locale> loadDefaultLocale();

  Future<void> changeLocale(String selectedLanguageCode);
}
