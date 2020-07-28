import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../generic_state/generic_state.dart';
import '../../data/models/country.dart';
import '../../data/contractors/impl_country_statistics_repository.dart';
import '../../utils/mixin/connection_checker.dart';

class CountryStatisticsCubit extends Cubit<GenericState>
    with ConnectivityChecker {
  CountryStatisticsCubit(this.countryStatisticsRepository)
      : assert(countryStatisticsRepository != null),
        super(Initial());

  final ICountryStatisticsRepository countryStatisticsRepository;

  void fetchAllCountryStatistics() async {
    try {
      if (!await isConnected()) {
        emit(Failure());
        return;
      }

      emit(InProgress());
      final countryStatistics =
          await countryStatisticsRepository.fetchCountryStatistics();
      emit(Success<List<Country>>(countryStatistics));
    } on DioError catch (e) {
      emit(Failure(e.message));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
