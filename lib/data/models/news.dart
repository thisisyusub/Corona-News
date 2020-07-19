/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

class News {
  final String title;
  final String body;
  final String id;
  final String dateTime;

  News({
    this.id,
    this.title,
    this.body,
    this.dateTime,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      dateTime: json['datetime'],
    );
  }

  @override
  String toString() => '''
  {
    id: $id,
    title: $title,
    body: $body,
    datetime: $dateTime,
  }
   ''';
}
