import 'package:flutter/material.dart';
import '../../../utils/extensions/translator.dart';

class StatisticsItem extends StatelessWidget {
  StatisticsItem({
    @required this.title,
    @required this.count,
  });

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).highlightColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: 10),
          Text(
            title.translate(context),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
