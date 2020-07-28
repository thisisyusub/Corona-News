import 'package:flutter/material.dart';

import '../../../data/models/news.dart';

class NewsItem extends StatelessWidget {
  NewsItem(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                news.dateTime,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(height: 10),
              Text(
                news.title,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
