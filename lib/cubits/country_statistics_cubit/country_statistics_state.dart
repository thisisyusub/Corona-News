part of './country_statistics_cubit.dart';

abstract class CountryStatisticsState extends Equatable {
  const CountryStatisticsState();

  @override
  List<Object> get props => [];
}

class CountryStatisticsInitial extends CountryStatisticsState {}

class CountryStatisticsInProgress extends CountryStatisticsState {}

class CountryStatisticsFailure extends CountryStatisticsState {
  CountryStatisticsFailure(this.message) : assert(message != null);

  final String message;

  @override
  List<Object> get props => [message];
}

class CountryStatisticsSuccess extends CountryStatisticsState {
  CountryStatisticsSuccess(this.countries) : assert(countries != null);

  final List<Country> countries;

  @override
  List<Object> get props => [...countries];
}
