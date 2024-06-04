import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class ObjectMarker extends StatelessWidget {
  const ObjectMarker({Key? key, required this.icon, this.title})
      : super(key: key);
  final IconData icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.of(context).colorScheme.secondary,
          ),
          padding: const EdgeInsets.all(5),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        if (title != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: AppTheme.of(context).colorScheme.secondary,
            ),
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
