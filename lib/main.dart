import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubits/localization_cubit/localization_cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import './app.dart';
import './cubits/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Logic for localization initialization
  final LocalizationCubit localizationCubit = LocalizationCubit(null);
  final defaultLocale = await localizationCubit.loadDefaultLocale();
  await localizationCubit?.close();

  /// Logic for theme initialization
  final ThemeCubit themeCubit = ThemeCubit(null);
  final defaultThemeMode = await themeCubit.loadDefaultTheme();
  await themeCubit?.close();

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
