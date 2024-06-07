import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class FloorSelectButton extends StatelessWidget {
  const FloorSelectButton({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: AppTheme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style: AppTheme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
