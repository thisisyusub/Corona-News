import 'package:flutter/material.dart';

import '../../../cubits/global_statistics_cubit/global_statistics_cubit.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../cubits/generic_state/generic_state.dart';
import '../../pages/generic_page/generic_page.dart';


class GlobalStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericPage<GlobalStatisticsCubit, GenericState>(
      appbarTitle: LanguageKeys.statistics,
    );
  }
}
