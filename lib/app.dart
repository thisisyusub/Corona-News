import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './cubits/localization_cubit/localization_cubit.dart';
import './presentation/shared/supported_locales.dart';
import './presentation/pages/home/home_page.dart';
import './utils/responsive_helper/size_config.dart';
import './presentation/shared/app_themes.dart';
import './cubits/theme_cubit/theme_cubit.dart';
import './utils/localization_helper/app_localizations.dart';
import './presentation/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, localizationCubit) {
        Fimber.i('Building localization...');
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeCubit) {
            Fimber.i('Building theme...');
            return LayoutBuilder(
              builder: (context, constraints) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    /// Setup for responsiveness
                    Fimber.i('initializing responsiveness...');
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
                      onGenerateRoute: Router.onGenerateRoute,
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
