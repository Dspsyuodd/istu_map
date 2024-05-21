import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/app/ui/map.dart';
import 'package:istu_map/features/authentication/presentation/pages/authentication.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import 'package:istu_map/features/map/map_injection_container.dart';

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
  '/map': MaterialPageRoute(
      builder: (_) =>
          BlocProvider<MapBloc>(create: (_) => sl(), child: const IstuMap())),
  '/authentication': MaterialPageRoute(builder: (_) => const Authentication()),
};
