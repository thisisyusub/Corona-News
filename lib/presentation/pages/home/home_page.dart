/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/app_bottom_navy_bar.dart';
import '../news/news_page.dart';
import '../global/global_statistics_page.dart';
import '../country_statistics/country_statistics_page.dart';
import '../../../data/repositories/news_repository.dart';
import '../../../cubits/news_cubit/news_cubit.dart';
import '../../../data/services/api_service.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          onPageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: _pageController,
          children: <Widget>[
            CountryStatisticsPage(),
            GlobalStatisticsPage(),
            RepositoryProvider<NewsRepository>(
              create: (context) => NewsRepository(ApiService()),
              child: CubitProvider<NewsCubit>(
                create: (context) =>
                    NewsCubit(context.repository<NewsRepository>())
                      ..getAllNews(),
                child: NewsPage(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (int selectedIndex) {
          setState(() => _selectedIndex = selectedIndex);
          _pageController.jumpToPage(selectedIndex);
        },
      ),
    );
  }
}
