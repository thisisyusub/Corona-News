import '../models/country.dart';

abstract class ICountryStatisticsRepository {
  Future<List<Country>> fetchCountryStatistics();
}
