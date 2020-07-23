import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/stat.dart';
import '../../data/contractors/impl_global_statistics_repository.dart';
import 'package:bloc/bloc.dart';

part './global_statistics_state.dart';

class GlobalStatisticsCubit extends Cubit<GlobalStatisticsState> {
  GlobalStatisticsCubit(this.globalStatisticsRepository)
      : assert(globalStatisticsRepository != null),
        super(GlobalStatisticsInitial());

  final IGlobalStatisticsRepository globalStatisticsRepository;

  void fetchGlobalStatistics() async {
    try {
      emit(GlobalStatisticsInProgress());
      final statistics = await globalStatisticsRepository.getGlobalStatistics();
      emit(GlobalStatisticsSuccess(statistics));
    } on DioError catch (e) {
      emit(GlobalStatisticsFailure(e.message));
    } catch (e) {
      emit(GlobalStatisticsFailure(e.toString()));
    }
  }
}
