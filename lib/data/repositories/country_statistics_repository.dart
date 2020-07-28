import 'package:fimber/fimber.dart';

import '../contractors/impl_country_statistics_repository.dart';
import '../models/country.dart';
import '../services/api_service.dart';

class CountryStatisticsRepository extends ICountryStatisticsRepository {
  CountryStatisticsRepository(this.apiService) : assert(apiService != null);

  final ApiService apiService;

  @override
  Future<List<Country>> fetchCountryStatistics() async {
    final endPoint = '/';

    Fimber.i('fetching country statistics');
    final result = await apiService.dio.get(endPoint);

    if (result.statusCode == 200) {
      final convertedCountryStatistics = result.data
          .map<Country>((country) => Country.fromJson(country))
          .toList();

      return convertedCountryStatistics;
    }

    return null;
  }
}
