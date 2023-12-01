import 'package:flutter/material.dart';

import '../color_themes.dart';

import 'dart:async';

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
    ColorTheme newTheme,
  ) =>
      _AppThemeInheritedWidget.of(context, listen: true)
          .state
          ._changeTheme(newTheme);

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  late ThemeData _appTheme;

  @override
  void initState() {
    super.initState();
    _appTheme = AppColorTheme.getTheme(ColorTheme.dark);
  }

  Future<void> _changeTheme(ColorTheme newTheme) async {
    setState(() {
      _appTheme = AppColorTheme.getTheme(newTheme);
    });
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
