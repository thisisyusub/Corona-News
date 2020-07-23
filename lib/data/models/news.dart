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
