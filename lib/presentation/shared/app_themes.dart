import 'package:flutter/material.dart';
import './app_colors.dart';
import './app_text_styles.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryLightColor,
  primaryColorDark: AppColors.primaryDarkColor,
  brightness: Brightness.light,
  accentColor: Colors.redAccent,
  cardColor: Colors.white,
  highlightColor: AppColors.lightStatItemColor,
  textTheme: TextTheme(
    headline6: f20,
    subtitle1: f16,
    subtitle2: f14,
    caption: f12,
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryLightColor,
  primaryColorDark: AppColors.primaryDarkColor,
  brightness: Brightness.dark,
  buttonColor: Colors.orange,
  accentColor: Colors.redAccent,
  indicatorColor: Colors.red,
  toggleableActiveColor: Colors.red,
  cardColor: Colors.black12,
  highlightColor: AppColors.darkStatItemColor,
  textTheme: TextTheme(
    headline6: f20,
    subtitle1: f16.copyWith(color: Colors.white),
    subtitle2: f14.copyWith(color: Colors.white),
    caption: f12.copyWith(color: Colors.white),
  ),
);
