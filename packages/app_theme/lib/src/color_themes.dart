import 'package:flutter/material.dart';

import '../app_theme.dart';

class AppColorTheme {
  static ThemeData getTheme(AppColorThemes theme) =>
      (_colorThemes[theme] ?? _light);
}

final _colorThemes = {
  AppColorThemes.light: _light,
  AppColorThemes.dark: _dark,
};

final _dark = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 226, 228, 238),
      fontSize: 20,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromRGBO(73, 83, 131, 1),
    onPrimary: Color.fromRGBO(73, 83, 131, 1),
    secondary: Color.fromRGBO(59, 71, 126, 1),
    onSecondary: Color.fromRGBO(59, 71, 126, 1),
    error: Colors.red,
    onError: Colors.red,
    background: Color.fromRGBO(10, 10, 15, 1),
    onBackground: Color.fromRGBO(10, 10, 15, 1),
    surface: Colors.white,
    onSurface: Colors.white,
  ),
);

final _light = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 17, 19, 29),
      fontSize: 20,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(124, 134, 182, 1),
    onPrimary: Color.fromRGBO(124, 134, 182, 1),
    secondary: Color.fromRGBO(130, 142, 196, 1),
    onSecondary: Color.fromRGBO(130, 142, 196, 1),
    error: Colors.red,
    onError: Colors.red,
    background: Color.fromRGBO(240, 240, 245, 1),
    onBackground: Color.fromRGBO(240, 240, 245, 1),
    surface: Colors.white,
    onSurface: Colors.white,
  ),
);
