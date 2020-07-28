import 'package:flutter/material.dart';

import '../../../cubits/news_cubit/news_cubit.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../cubits/generic_state/generic_state.dart';
import '../generic_page/generic_page.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericPage<NewsCubit, GenericState>(
      appbarTitle: LanguageKeys.news,
    );
  }
}
