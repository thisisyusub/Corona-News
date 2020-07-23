import 'package:flutter/material.dart';
import '../../utils/extensions/translator.dart';
import '../../utils/constants/routes.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar(this.titleKey) : assert(titleKey != null);

  final String titleKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      forceElevated: true,
      title: Text(
        titleKey.translate(context),
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          color: Colors.redAccent,
          onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
        ),
      ],
    );
  }
}
