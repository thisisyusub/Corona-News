/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

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
  textTheme: TextTheme(
    headline5: f24,
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
  cardColor: Colors.black12,
  textTheme: TextTheme(
    headline5: f24,
    subtitle2: f14.copyWith(color: Colors.white),
    caption: f12.copyWith(color: Colors.white),
  ),
);
