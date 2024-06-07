import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class AuthElevatedButton extends StatelessWidget {
  const AuthElevatedButton({Key? key, this.onPressed, required this.text})
      : super(key: key);
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width / 2, 42),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: AppTheme.of(context).colorScheme.secondary),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
