import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class NavigationDrawerButton extends StatelessWidget {
  const NavigationDrawerButton(
      {Key? key, required this.icon, required this.text})
      : super(key: key);
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Opacity(
              opacity: 0.56,
              child: icon,
            ),
          ),
          Text(text, style: AppTheme.of(context).textTheme.displaySmall),
        ],
      ),
    );
  }
}
