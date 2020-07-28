import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/states/sliver_states.dart';
import '../../../cubits/generic_state/generic_state.dart';
import '../../../data/models/country.dart';
import '../../pages/country_statistics/country_item.dart';
import '../../pages/global_statistics/statistics_item.dart';
import '../../../data/models/news.dart';
import '../../../data/models/stat.dart';
import '../news/news_item.dart';
import '../../../utils/constants/language_keys.dart';

class GenericPage<C extends Cubit<S>, S> extends StatelessWidget {
  GenericPage({
    @required this.appbarTitle,
  });

  final String appbarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(appbarTitle),
          BlocConsumer<C, S>(
            listenWhen: (_, curr) => curr is Failure,
            listener: (context, cubitState) {
              if (cubitState is Failure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(cubitState.message),
                    ),
                  );
              }
            },
            builder: (context, cubitState) {
              if (cubitState is InProgress) {
                return SliverLoading();
              }

              if (cubitState is Failure) {
                return SliverFailure(cubitState.message);
              }

              if (cubitState is Success) {
                /// if data type is [List<Country>]
                if (cubitState.data is List<Country>) {
                  print('working...');
                  return SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => CountryItem(cubitState.data[i]),
                        childCount: cubitState.data.length,
                      ),
                    ),
                  );
                }

                /// if data type is [List<News>]
                if (cubitState.data is List<News>) {
                  return SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => NewsItem(cubitState.data[index]),
                        childCount: cubitState.data.length,
                      ),
                    ),
                  );
                }

                ///if data type is Stat
                if (cubitState.data is Stat) {
                  return SliverPadding(
                    padding: const EdgeInsets.all(10.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      delegate: SliverChildListDelegate.fixed(
                        [
                          StatisticsItem(
                            title: LanguageKeys.active_cases,
                            count: cubitState.data.activeCases,
                          ),
                          StatisticsItem(
                            title: LanguageKeys.critical_cases,
                            count: cubitState.data.criticalCases,
                          ),
                          StatisticsItem(
                            title: LanguageKeys.new_cases,
                            count: cubitState.data.newCases,
                          ),
                          StatisticsItem(
                            title: LanguageKeys.new_deaths,
                            count: cubitState.data.newDeaths,
                          ),
                          StatisticsItem(
                            title: LanguageKeys.total_cases,
                            count: cubitState.data.totalCases,
                          ),
                          StatisticsItem(
                            title: LanguageKeys.total_deaths,
                            count: cubitState.data.totalDeaths,
                          ),
                          StatisticsItem(
                            title: LanguageKeys.total_recovered,
                            count: cubitState.data.totalRecovered,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }

              return SliverInitial();
            },
          )
        ],
      ),
    );
  }
}
