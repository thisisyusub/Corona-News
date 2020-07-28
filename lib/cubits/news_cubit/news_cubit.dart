import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../data/models/news.dart';
import '../../data/contractors/impl_news_repository.dart';
import '../../data/exceptions/http_exception.dart';
import '../generic_state/generic_state.dart';
import '../../utils/mixin/connection_checker.dart';

class NewsCubit extends Cubit<GenericState> with ConnectivityChecker {
  NewsCubit(this.newsRepository)
      : assert(newsRepository != null),
        super(Initial());

  final INewsRepository newsRepository;

  void getAllNews() async {
    try {
      if (!await isConnected()) {
        emit(Failure('There is no internet connection!'));
        return;
      }

      emit(InProgress());
      final news = await newsRepository.getAllNews();
      emit(Success<List<News>>(news ?? []));
    } on DioError catch (e) {
      emit(Failure('failure: ${e.toString()}'));
    } on HttpException catch (e) {
      emit(Failure(e.message));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
