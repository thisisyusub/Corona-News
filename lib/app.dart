import 'package:corona_news/utils/localization_helper/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './cubits/localization_cubit/localization_cubit.dart';
import './presentation/shared/supported_locales.dart';
import './presentation/pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CubitBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, localizationCubit) {
        return MaterialApp(
          title: 'Corona news',
          locale: localizationCubit.locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: kDebugMode,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
