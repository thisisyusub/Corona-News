import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import '../../../cubits/news_cubit/news_cubit.dart';
import './news_item.dart';
import '../../widgets/custom_appbar.dart';
import '../../../utils/constants/language_keys.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(LanguageKeys.news),
          CubitConsumer<NewsCubit, NewsState>(
            listenWhen: (previous, current) => current is NewsFailure,
            listener: (context, newsState) {
              if (newsState is NewsFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('There is a problem with server!'),
                    ),
                  );
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

              if (newsState is NewsFailure) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'There is problem with server :(',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }

              return SliverToBoxAdapter(child: Container());
            },
          ),
        ],
      ),
    );
  }
}
