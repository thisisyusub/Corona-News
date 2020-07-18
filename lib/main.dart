import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './presentation/pages/home/home_page.dart';
import './utils/localization_helper/app_localizations.dart';
import './presentation/shared/supported_locales.dart';
import './view_models/language_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final LanguageViewModel languageViewModel = LanguageViewModel();
  await languageViewModel.fetchLocale();
  runApp(MyApp(languageViewModel));
}

class MyApp extends StatelessWidget {
  MyApp(this.languageViewModel) : assert(languageViewModel != null);

  final LanguageViewModel languageViewModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageViewModel>(
      create: (_) => languageViewModel,
      child: Consumer<LanguageViewModel>(
          builder: (context, languageViewModel, child) {
        return MaterialApp(
          title: 'Corona news',
          locale: languageViewModel.appLocale,
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
      }),
    );
  }
}
