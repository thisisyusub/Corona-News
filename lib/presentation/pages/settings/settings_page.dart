import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/theme_cubit/theme_cubit.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';
import '../../dialogs/language_dialog.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.settings.translate(context)),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              LanguageKeys.change_language.translate(context),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => LanguageDialog(),
            ),
          ),
          Divider(),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) => SwitchListTile(
              onChanged: (bool enabled) =>
                  context.bloc<ThemeCubit>().changeTheme(
                        themeState.themeMode != ThemeMode.dark,
                      ),
              value: themeState.themeMode == ThemeMode.dark,
              title: Text(
                LanguageKeys.dark_mode.translate(context),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
