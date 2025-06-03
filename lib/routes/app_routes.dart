import 'package:flutter/material.dart';
import 'package:riverpod_template/ui/home_screen.dart';

import '../ui/auth/login/login_page.dart';
import '../ui/auth/splash/splash_page.dart';

final class AppRoutes {
  static const String base = '/';
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    base: (_) => SplashPage(),
    login: (_) => LoginPage(),
    home: (_) => const HomeScreen(),
  };
}
