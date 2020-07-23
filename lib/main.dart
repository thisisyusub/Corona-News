import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubits/localization_cubit/localization_cubit.dart';
import './app.dart';
import './cubits/theme_cubit/theme_cubit.dart';
import './utils/constants/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Config.kHttpLogging) {
    Fimber.plantTree(DebugTree(useColors: true));
  }

  final defaultLocale = await _doLocalizationLogic();
  final defaultThemeMode = await _doThemeLogic();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (_) => LocalizationCubit(defaultLocale),
        ),
        BlocProvider<ThemeCubit>(
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
