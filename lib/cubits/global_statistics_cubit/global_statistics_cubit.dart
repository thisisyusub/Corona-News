import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../generic_state/generic_state.dart';
import '../../data/models/stat.dart';
import '../../data/contractors/impl_global_statistics_repository.dart';
import '../../utils/mixin/connection_checker.dart';

class GlobalStatisticsCubit extends Cubit<GenericState>
    with ConnectivityChecker {
  GlobalStatisticsCubit(this.globalStatisticsRepository)
      : assert(globalStatisticsRepository != null),
        super(Initial());

  final IGlobalStatisticsRepository globalStatisticsRepository;

  void fetchGlobalStatistics() async {
    try {
      if (!await isConnected()) {
        emit(Failure('There is no internet connection!'));
        return;
      }

      emit(InProgress());
      final statistics = await globalStatisticsRepository.getGlobalStatistics();
      emit(Success<Stat>(statistics));
    } on DioError catch (e) {
      emit(Failure(e.message));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
