import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField({
    Key? key,
    required this.label,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);
  final String label;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 65,
          child: TextField(
            style: AppTheme.of(context).textTheme.displaySmall,
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            autofillHints: const [AutofillHints.email],
            decoration: InputDecoration(
              errorText: errorText,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
