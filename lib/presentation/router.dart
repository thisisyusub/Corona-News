import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import '../utils/constants/routes.dart';
import '../presentation/pages/settings/settings_page.dart';

class Router {
  Router._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'The ${routeSettings.name} page is not available!',
              ),
            ),
          ),
        );
    }
  }
}
