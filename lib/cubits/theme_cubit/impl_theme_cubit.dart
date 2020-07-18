import 'package:flutter/material.dart';

abstract class IThemeCubit {
  Future<ThemeMode> loadDefaultTheme();

  Future<void> changeTheme(bool value);
}
