import 'package:flutter/material.dart';
import '../../../utils/constants/language_keys.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import '../../../cubits/news_cubit/news_cubit.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.news),
      ),
      body: CubitConsumer<NewsCubit, NewsState>(
        listenWhen: (previous, current) => current is NewsFailure,
        buildWhen: (previous, current) => current is! NewsFailure,
        listener: (context, newsState) {
          if (newsState is NewsFailure) {
            print('news error: ${newsState.message}');
          }
        },
        builder: (context, newsState) {
          if (newsState is NewsInProgress) {
            return Center(child: CircularProgressIndicator());
          }

          if (newsState is NewsSuccess) {
            final news = newsState.news;

            return ListView.builder(
              itemBuilder: (context, i) => ListTile(
                title: Text(news[i].title),
              ),
              itemCount: news.length,
            );
          }

          return Container();
        },
      ),
    );
  }
}
