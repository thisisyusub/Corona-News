import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:cubit/cubit.dart';
import '../../data/services/shared_preferences_service.dart';

part './theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeMode defaultThemeMode) : super(ThemeState(defaultThemeMode));

  Future<void> changeTheme(bool value) async {
    final sharedPrefService = await SharedPreferencesService.instance;
    final isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;

    if (isDarkModeEnabled == value) return;

    await sharedPrefService.setDarkModeInfo(value);
    emit(ThemeState(value ? ThemeMode.dark : ThemeMode.light));
  }

  Future<ThemeMode> loadDefaultTheme() async {
    final sharedPrefService = await SharedPreferencesService.instance;
    final isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;

    if (isDarkModeEnabled == null) {
      await sharedPrefService.setDarkModeInfo(false);
      return ThemeMode.light;
    } else {
      ThemeMode defaultThemeMode =
          isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
      return defaultThemeMode;
    }
  }
}
