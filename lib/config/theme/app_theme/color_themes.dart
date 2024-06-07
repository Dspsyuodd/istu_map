import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class AppColorTheme {
  static ThemeData getTheme(AppColorThemes theme) =>
      (_colorThemes[theme] ?? _light);
}

final _colorThemes = {
  AppColorThemes.light: _light,
  AppColorThemes.dark: _dark,
};

final _dark = ThemeData(
  fontFamily: 'Cuprum',
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 226, 228, 238),
      fontSize: 20,
    ),
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 226, 228, 238),
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 226, 228, 238),
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      color: Colors.grey,
      fontSize: 14,
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
    surface: Color.fromRGBO(10, 10, 15, 1),
    onSurface: Color.fromRGBO(10, 10, 15, 1),
  ),
);

final _light = ThemeData(
  fontFamily: 'Cuprum',
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(12, 59, 139, 1),
    onPrimary: Color.fromRGBO(124, 134, 182, 1),
    secondary: Color.fromRGBO(119, 20, 69, 1),
    onSecondary: Color.fromRGBO(130, 142, 196, 1),
    error: Colors.red,
    onError: Colors.red,
    surface: Color.fromRGBO(240, 240, 245, 1),
    onSurface: Color.fromRGBO(240, 240, 245, 1),
  ),
);
