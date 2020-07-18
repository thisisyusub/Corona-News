import 'package:flutter/material.dart';
import './app_colors.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryLightColor,
  primaryColorDark: AppColors.primaryDarkColor,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryLightColor,
  primaryColorDark: AppColors.primaryDarkColor,
  brightness: Brightness.dark,
);
