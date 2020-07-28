import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/localization_cubit/localization_cubit.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LanguageKeys.choose_language.translate(context)),
      content: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, localizationState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _languageItem(
                context: context,
                title: LanguageKeys.az,
                locale: localizationState.locale,
              ),
              _languageItem(
                context: context,
                title: LanguageKeys.en,
                locale: localizationState.locale,
              ),
              _languageItem(
                context: context,
                title: LanguageKeys.ru,
                locale: localizationState.locale,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _languageItem({
    BuildContext context,
    String title,
    Locale locale,
  }) {
    final isSelected = locale.languageCode == title.toLowerCase();

    return RadioListTile(
      groupValue: 0,
      selected: isSelected,
      title: Text(title.translate(context)),
      onChanged: (_) =>
          context.bloc<LocalizationCubit>().changeLocale(title.toLowerCase()),
      value: isSelected ? 0 : 1,
    );
  }
}
