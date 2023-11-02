import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.uncaughtException}) : super(key: key);

  final Stream<void> uncaughtException;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
