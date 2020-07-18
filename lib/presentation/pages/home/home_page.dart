/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import '../../../cubits/localization_cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import '../../../utils/extensions/translator.dart';
import '../../../utils/constants/language_keys.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import '../../shared/app_text_styles.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            LanguageKeys.hello.translate(context),
            style: f30,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () =>
                    context.cubit<LocalizationCubit>().changeLocale(
                          LanguageKeys.az,
                        ),
                child: Text(
                  LanguageKeys.az,
                  style: f15,
                ),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () =>
                    context.cubit<LocalizationCubit>().changeLocale(
                          LanguageKeys.en,
                        ),
                child: Text(
                  LanguageKeys.en,
                  style: f15,
                ),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () =>
                    context.cubit<LocalizationCubit>().changeLocale(
                          LanguageKeys.ru,
                        ),
                child: Text(
                  LanguageKeys.ru,
                  style: f15,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          CubitBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeCubit) => Switch.adaptive(
              value: themeCubit.themeMode == ThemeMode.dark,
              onChanged: (bool enabled) =>
                  context.cubit<ThemeCubit>().changeTheme(enabled),
            ),
          ),
        ],
      )),
    );
  }
}
