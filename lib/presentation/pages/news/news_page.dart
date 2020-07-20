import 'package:flutter/material.dart';
import '../../../utils/constants/language_keys.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import '../../../cubits/news_cubit/news_cubit.dart';
import '../../../utils/extensions/translator.dart';
import './news_item.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                LanguageKeys.news.translate(context),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            CubitConsumer<NewsCubit, NewsState>(
              listenWhen: (previous, current) => current is NewsFailure,
              buildWhen: (previous, current) => current is! NewsFailure,
              listener: (context, newsState) {
                if (newsState is NewsFailure) {
                  print('news error: ${newsState.message}');
                }
              },
              builder: (context, newsState) {
                if (newsState is NewsInProgress) {
                  return SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (newsState is NewsSuccess) {
                  final news = newsState.news;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => NewsItem(news[index]),
                      childCount: news.length,
                    ),
                  );
                }

                return SliverToBoxAdapter(child: Container());
              },
            ),
          ],
        ),
      ),
    );
  }
}
