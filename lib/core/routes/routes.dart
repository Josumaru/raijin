import 'package:flutter/material.dart';
import 'package:raijin/features/auth/presentation/pages/auth_page/auth_page.dart';
import 'package:raijin/features/detail/presentation/pages/detail_page.dart';
import 'package:raijin/features/anime/presentation/pages/main_page.dart';
import 'package:raijin/features/auth/presentation/pages/welcome_page/welcome_page.dart';
import 'package:raijin/features/auth/presentation/pages/splash_page/splash_page.dart';
import 'package:raijin/features/video/presentation/pages/video_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _materiaPagelRoute(const SplashPage());
      case '/welcome':
        return _materiaPagelRoute(WelcomePage());
      case '/main':
        return _materiaPagelRoute(MainPage());
      case '/detail':
        return _materiaPagelRoute(const DetailPage());
      case '/video':
        return _materiaPagelRoute(const VideoPage());
      case '/auth':
        return _materiaPagelRoute(const AuthPage());
      default:
        return _materiaPagelRoute(MainPage());
    }
  }

  static _materiaPagelRoute(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
