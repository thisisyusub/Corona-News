/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import 'package:fimber/fimber.dart';
import '../models/news.dart';
import '../contractors/impl_news_repository.dart';
import '../services/api_service.dart';

class NewsRepository implements INewsRepository {
  NewsRepository(this.apiService) : assert(apiService != null);

  final ApiService apiService;

  @override
  Future<List<News>> getAllNews() async {
    String endPoint = '/news';

    Fimber.i('NewsRepository: fetcing all news');
    final result = await apiService.dio.get(endPoint);

    Fimber.i('NewsRepository fetching all news response: ${result.statusCode}');

    if (result.statusCode == 200) {
      final convertedNews =
          result.data.map<News>((news) => News.fromJson(news)).toList();
      return convertedNews;
    }

    return [];
  }
}
