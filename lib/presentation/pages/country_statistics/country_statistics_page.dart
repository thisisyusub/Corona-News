import 'package:flutter/material.dart';

import '../../../utils/constants/language_keys.dart';
import '../../../cubits/country_statistics_cubit/country_statistics_cubit.dart';
import '../../../cubits/generic_state/generic_state.dart';
import '../../pages/generic_page/generic_page.dart';

class CountryStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericPage<CountryStatisticsCubit, GenericState>(
      appbarTitle: LanguageKeys.countries,
    );
  }
}
