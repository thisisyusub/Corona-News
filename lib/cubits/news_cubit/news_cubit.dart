import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/news.dart';
import '../../data/contractors/impl_news_repository.dart';
import '../../data/exceptions/http_exception.dart';
import 'package:bloc/bloc.dart';

part './news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepository)
      : assert(newsRepository != null),
        super(NewsInitial());

  final INewsRepository newsRepository;

  void getAllNews() async {
    try {
      emit(NewsInProgress());
      final news = await newsRepository.getAllNews();
      emit(NewsSuccess(news ?? []));
    } on DioError catch (e) {
      emit(NewsFailure('failure: ${e.toString()}'));
    } on HttpException catch (e) {
      emit(NewsFailure(e.message));
    } catch (e) {
      emit(NewsFailure(e.toString()));
    }
  }
}
