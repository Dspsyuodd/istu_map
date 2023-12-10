import 'package:flutter/material.dart';

import '../../app/ui/map.dart';
import '../../app/ui/splash_screen.dart';

class AppRouter {
  const AppRouter();

  static Route onGenerateRoute(RouteSettings settings) {
    var route = _routes[settings.name];
    if (route != null) {
      return route;
    }
    throw Exception('Route not found');
  }
}

final _routes = {
  '/': MaterialPageRoute(builder: (_) => const SplashScreen()),
  '/map': MaterialPageRoute(builder: (_) => const IstuMap()),
};
