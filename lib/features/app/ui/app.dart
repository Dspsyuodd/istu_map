import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

import '../../../config/routes/app_router.dart';
import '../../../injection_container.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.uncaughtException}) : super(key: key);

  final Stream<void> uncaughtException;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    initDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: Builder(builder: (context_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.of(context_),
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}
