import '../models/news.dart';

abstract class INewsRepository {
  Future<List<News>> getAllNews();
}
