/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import 'package:corona_news/cubits/localization_cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import '../../../utils/extensions/translator.dart';
import '../../../utils/constants/language_keys.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

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
                child: Text(LanguageKeys.az),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () =>
                    context.cubit<LocalizationCubit>().changeLocale(
                          LanguageKeys.en,
                        ),
                child: Text(LanguageKeys.en),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () =>
                    context.cubit<LocalizationCubit>().changeLocale(
                          LanguageKeys.ru,
                        ),
                child: Text(LanguageKeys.ru),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
