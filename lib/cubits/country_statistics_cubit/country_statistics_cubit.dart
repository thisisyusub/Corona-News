import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/country.dart';
import '../../data/contractors/impl_country_statistics_repository.dart';

part './country_statistics_state.dart';

class CountryStatisticsCubit extends Cubit<CountryStatisticsState> {
  CountryStatisticsCubit(this.countryStatisticsRepository)
      : assert(countryStatisticsRepository != null),
        super(CountryStatisticsInitial());

  final ICountryStatisticsRepository countryStatisticsRepository;

  void fetchAllCountryStatistics() async {
    try {
      emit(CountryStatisticsInProgress());
      final countryStatistics =
          await countryStatisticsRepository.fetchCountryStatistics();
      emit(CountryStatisticsSuccess(countryStatistics));
    } on DioError catch (e) {
      emit(CountryStatisticsFailure(e.message));
    } catch (e) {
      emit(CountryStatisticsFailure(e.toString()));
    }
  }
}
