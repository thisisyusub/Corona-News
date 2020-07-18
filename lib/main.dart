import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/localization_cubit/localization_cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final LocalizationCubit localizationCubit = LocalizationCubit(null);
  final defaultLocale = await localizationCubit.loadDefaultLocale();
  localizationCubit.close();

  runApp(
    MultiBlocProvider(
      providers: [
        CubitProvider<LocalizationCubit>(
          create: (_) => LocalizationCubit(defaultLocale),
        ),
      ],
      child: App(),
    ),
  );
}
