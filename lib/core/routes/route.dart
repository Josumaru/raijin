import 'package:flutter/material.dart';
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
      case RouteName.homePage:
        return _materialPageRoute(const HomePage());
      default:
        return _materialPageRoute(const HomePage());
    }
  }

  static _materialPageRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  static void pushNamed({required String routeName}) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  static void pushNamedAndRemoveUntil({required String routeName}) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
