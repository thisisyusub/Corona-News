part of './news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsInProgress extends NewsState {}

class NewsFailure extends NewsState {
  NewsFailure(this.message) : assert(message != null);

  final String message;

  @override
  List<Object> get props => [message];
}

class NewsSuccess extends NewsState {
  NewsSuccess(this.news) : assert(news != null);

  final List<News> news;

  @override
  List<Object> get props => [...news];
}
