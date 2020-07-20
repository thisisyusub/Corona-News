import 'package:flutter/material.dart';
import '../../../utils/constants/language_keys.dart';
import '../../widgets/custom_appbar.dart';

class CountryStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(LanguageKeys.countries),
        ],
      ),
    );
  }
}
