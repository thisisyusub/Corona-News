import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/language_keys.dart';
import '../../utils/extensions/translator.dart';

class AppBottomNavyBar extends StatefulWidget {
  AppBottomNavyBar({
    @required this.selectedIndex,
    @required this.onItemSelected,
  });

  final int selectedIndex;
  final void Function(int selectedIndex) onItemSelected;

  @override
  _AppBottomNavyBarState createState() => _AppBottomNavyBarState();
}

class _AppBottomNavyBarState extends State<AppBottomNavyBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: widget.selectedIndex,
      showElevation: true,
      onItemSelected: widget.onItemSelected,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.show_chart),
          title: Text(LanguageKeys.statistics.translate(context)),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text(LanguageKeys.global.translate(context)),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.new_releases),
          title: Text(LanguageKeys.news.translate(context)),
          activeColor: Colors.red,
        ),
      ],
    );
  }
}
