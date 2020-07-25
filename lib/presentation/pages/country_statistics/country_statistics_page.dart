import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/language_keys.dart';
import '../../widgets/custom_appbar.dart';
import './country_item.dart';
import '../../../cubits/country_statistics_cubit/country_statistics_cubit.dart';

class CountryStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(LanguageKeys.countries),
          BlocBuilder<CountryStatisticsCubit, CountryStatisticsState>(
            builder: (context, countryStatisticsState) {
              if (countryStatisticsState is CountryStatisticsSuccess) {
                return SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) =>
                          CountryItem(countryStatisticsState.countries[i]),
                      childCount: countryStatisticsState.countries.length,
                    ),
                  ),
                );
              }

              if (countryStatisticsState is CountryStatisticsInProgress) {
                return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (countryStatisticsState is CountryStatisticsFailure) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      countryStatisticsState.message,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }

              return SliverToBoxAdapter(
                child: Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
