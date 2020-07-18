/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

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
