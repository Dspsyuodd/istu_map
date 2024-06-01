import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/authentication/presentation/pages/authentication.dart';
import '../../features/map/external_map/presentation/pages/map.dart';
import '../../features/map/external_map/presentation/bloc/map_bloc.dart';
import '../../features/map/map_injection_container.dart';

import '../../features/app/ui/splash_screen.dart';

class AppRouter {
  const AppRouter();

  static Route onGenerateRoute(RouteSettings settings) {
    var route = _routes[settings.name];
    if (route != null) {
      return MaterialPageRoute(builder: (_) => route);
    }
    throw Exception('Route not found');
  }
}

final _routes = {
  '/': const SplashScreen(),
  '/map': BlocProvider<MapBloc>(create: (_) => sl(), child: const IstuMap()),
  '/auth': const Authentication(),
};
