import 'package:flutter/material.dart';
import 'package:raijin/core/commons/pages/main_page.dart';
import 'package:raijin/core/routes/route_name.dart';
import 'package:raijin/features/auth/presentation/pages/auth_page.dart';
import 'package:raijin/features/anime/presentation/pages/home_page.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.authPage:
        return _materialPageRoute(const AuthPage());
      case RouteName.mainPage:
        return _materialPageRoute(MainPage());
      default:
        return _materialPageRoute(MainPage());
    }
  }

  static _materialPageRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
