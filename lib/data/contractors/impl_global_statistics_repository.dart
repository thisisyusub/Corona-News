import '../models/stat.dart';

abstract class IGlobalStatisticsRepository {
  Future<Stat> getGlobalStatistics();
}
