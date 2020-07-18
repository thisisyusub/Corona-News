/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubits/localization_cubit/localization_cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import './app.dart';
import './cubits/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Fimber.plantTree(DebugTree(useColors: true));
  final defaultLocale = await _doLocalizationLogic();
  final defaultThemeMode = await _doThemeLogic();

  runApp(
    MultiBlocProvider(
      providers: [
        CubitProvider<LocalizationCubit>(
          create: (_) => LocalizationCubit(defaultLocale),
        ),
        CubitProvider<ThemeCubit>(
          create: (_) => ThemeCubit(defaultThemeMode),
        ),
      ],
      child: App(),
    ),
  );
}

/// Logic for localization initialization
Future<Locale> _doLocalizationLogic() async {
  final LocalizationCubit localizationCubit = LocalizationCubit(null);
  final defaultLocale = await localizationCubit.loadDefaultLocale();
  await localizationCubit?.close();

  return defaultLocale;
}

/// Logic for theme initialization
Future<ThemeMode> _doThemeLogic() async {
  final ThemeCubit themeCubit = ThemeCubit(null);
  final defaultThemeMode = await themeCubit.loadDefaultTheme();
  await themeCubit?.close();

  return defaultThemeMode;
}
