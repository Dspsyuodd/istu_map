import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class ScaleButton extends StatelessWidget {
  const ScaleButton({Key? key, required this.icon, this.onTap})
      : super(key: key);
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.of(context).colorScheme.background,
        ),
        child: Center(
          child: Icon(icon, size: 30,),
        ),
      ),
    );
  }
}
