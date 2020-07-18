/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './cubits/localization_cubit/localization_cubit.dart';
import './presentation/shared/supported_locales.dart';
import './presentation/pages/home/home_page.dart';
import './utils/responsive_helper/size_config.dart';
import './presentation/shared/app_themes.dart';
import './cubits/theme_cubit/theme_cubit.dart';
import './utils/localization_helper/app_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CubitBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, localizationCubit) {
        return CubitBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeCubit) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    /// Setup for responsiveness
                    SizeConfig().init(constraints, orientation);
                    return MaterialApp(
                      title: 'Corona news',
                      locale: localizationCubit.locale,
                      supportedLocales: supportedLocales,
                      darkTheme: darkTheme,
                      theme: lightTheme,
                      themeMode: themeCubit.themeMode,
                      localizationsDelegates: [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        AppLocalizations.delegate,
                      ],
                      debugShowCheckedModeBanner: kDebugMode,
                      home: HomePage(),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
