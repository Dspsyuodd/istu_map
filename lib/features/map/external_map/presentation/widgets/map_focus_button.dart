import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class MapFocusButton extends StatelessWidget {
  const MapFocusButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 61,
        height: 61,
        decoration: BoxDecoration(
          color: AppTheme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.navigation,
          size: 35,
        ),
      ),
    );
  }
}
