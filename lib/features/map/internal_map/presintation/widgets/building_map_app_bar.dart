import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class BuildingMapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildingMapAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Center(
          child: Text(
        title,
        style: AppTheme.of(context).textTheme.displayLarge,
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
