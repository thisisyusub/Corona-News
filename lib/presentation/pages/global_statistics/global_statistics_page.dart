import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../../cubits/global_statistics_cubit/global_statistics_cubit.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(LanguageKeys.statistics),
          BlocConsumer<GlobalStatisticsCubit, GlobalStatisticsState>(
            listenWhen: (_, current) => current is GlobalStatisticsFailure,
            listener: (context, globalStatisticsState) {
              if (globalStatisticsState is GlobalStatisticsFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('There is a problem with server!'),
                    ),
                  );
              }
            },
            builder: (context, globalStatisticsState) {
              if (globalStatisticsState is GlobalStatisticsSuccess) {
                return _buildSuccessStatistics(context, globalStatisticsState);
              }

              if (globalStatisticsState is GlobalStatisticsInProgress) {
                return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (globalStatisticsState is GlobalStatisticsFailure) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'There is problem with server :(',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessStatistics(
      BuildContext context, GlobalStatisticsSuccess globalStatisticsSuccess) {
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
            _statisticsItem(context, LanguageKeys.active_cases,
                globalStatisticsSuccess.statistics.activeCases),
            _statisticsItem(context, LanguageKeys.critical_cases,
                globalStatisticsSuccess.statistics.criticalCases),
            _statisticsItem(context, LanguageKeys.new_cases,
                globalStatisticsSuccess.statistics.newCases),
            _statisticsItem(context, LanguageKeys.new_deaths,
                globalStatisticsSuccess.statistics.newDeaths),
            _statisticsItem(context, LanguageKeys.total_cases,
                globalStatisticsSuccess.statistics.totalCases),
            _statisticsItem(context, LanguageKeys.total_deaths,
                globalStatisticsSuccess.statistics.totalDeaths),
            _statisticsItem(context, LanguageKeys.total_recovered,
                globalStatisticsSuccess.statistics.totalRecovered),
          ],
        ),
      ),
    );
  }

  Widget _statisticsItem(BuildContext context, String title, String count) {
    return Container(
      color: Theme.of(context).highlightColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: 10),
          Text(
            title.translate(context),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
