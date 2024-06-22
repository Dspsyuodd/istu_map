import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_themes.dart';

import 'dart:async';

enum AppColorThemes {
  light,
  dark,
}

class AppTheme extends StatefulWidget {
  const AppTheme({
    super.key,
    required this.child,
  });

  final Widget child;

  static ThemeData of(
    BuildContext context, {
    bool listen = true,
  }) =>
      _AppThemeInheritedWidget.of(context, listen: listen).state._appTheme;

  static Future<void> changeTheme(
    BuildContext context,
    AppColorThemes newTheme,
  ) =>
      _AppThemeInheritedWidget.of(context, listen: true)
          .state
          ._changeTheme(newTheme);

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  late ThemeData _appTheme;
  late SharedPreferences prefs;

  void initTheme() async {
    prefs = await SharedPreferences.getInstance();
    var colorTheme = prefs.getInt('theme') ?? 0;
    setState(() {
      _appTheme = AppColorTheme.getTheme(AppColorThemes.values[colorTheme]);
    });
  }

  @override
  void initState() {
    _appTheme = AppColorTheme.getTheme(AppColorThemes.dark);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initTheme();
    });
  }

  Future<void> _changeTheme(AppColorThemes newTheme) async {
    setState(() {
      _appTheme = AppColorTheme.getTheme(newTheme);
    });
    prefs.setInt('theme', newTheme.index);
  }

  @override
  Widget build(BuildContext context) => _AppThemeInheritedWidget(
        state: this,
        theme: _appTheme,
        child: widget.child,
      );
}

class _AppThemeInheritedWidget extends InheritedWidget {
  const _AppThemeInheritedWidget({
    required this.state,
    required this.theme,
    required super.child,
  });

  final _AppThemeState state;
  final ThemeData theme;

  static _AppThemeInheritedWidget of(
    BuildContext context, {
    required bool listen,
  }) =>
      listen
          ? context
              .dependOnInheritedWidgetOfExactType<_AppThemeInheritedWidget>()!
          : context.getInheritedWidgetOfExactType<_AppThemeInheritedWidget>()!;

  @override
  bool updateShouldNotify(_AppThemeInheritedWidget oldWidget) =>
      theme != oldWidget.theme;
}
