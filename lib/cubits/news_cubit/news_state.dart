/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

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
