import 'package:flutter/material.dart';
import '../localization_helper/app_localizations.dart';

extension StringTranslator on String {
  String translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
