import '../../data/models/stat.dart';
import 'package:fimber/fimber.dart';
import '../contractors/impl_global_statistics_repository.dart';
import '../services/api_service.dart';

class GlobalStatisticsRepository implements IGlobalStatisticsRepository {
  GlobalStatisticsRepository(this.apiService) : assert(apiService != null);

  final ApiService apiService;

  @override
  Future<Stat> getGlobalStatistics() async {
    final endPoint = '/stats';

    Fimber.i('fetcing all news');
    final result = await apiService.dio.get(endPoint);

    if (result.statusCode == 200) {
      final convertedStatistics = Stat.fromJson(result.data);
      return convertedStatistics;
    }

    return null;
  }
}
